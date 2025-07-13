import re
import toml
import argparse
import sys
from collections import defaultdict
import time

class LintRule:
	def __init__(self, name, pattern, exception_names=None, enforce=False, comment=""):
		self.name = name
		self.pattern = re.compile(pattern)
		self.exception_names = exception_names if exception_names else []
		self.exceptions = []  # 将被填充为实际的规则对象
		self.enforce = enforce
		self.comment = comment
		self.depth = 0  # 用于检测循环引用

	def add_exception(self, rule):
		"""添加例外规则引用"""
		self.exceptions.append(rule)

class Linter:
	def __init__(self, config_file="lint.toml"):
		self.rules = []
		self.rule_map = {}
		self.load_rules(config_file)
		self.resolve_exceptions()

	def load_rules(self, config_file):
		"""从TOML文件加载规则配置"""
		try:
			with open(config_file, "r") as f:
				config = toml.load(f)
		except FileNotFoundError:
			print(f"Error: Config file '{config_file}' not found", file=sys.stderr)
			sys.exit(1)
		except toml.TomlDecodeError as e:
			print(f"Error parsing TOML: {e}", file=sys.stderr)
			sys.exit(1)

		for rule_config in config.get("rule", []):
			try:
				rule = LintRule(
					name=rule_config["name"],
					pattern=rule_config["pattern"],
					exception_names=rule_config.get("exceptions"),
					enforce=rule_config.get("enforce", False),
					comment=rule_config.get("comment", "")
				)
				self.rules.append(rule)
				self.rule_map[rule.name] = rule
			except KeyError as e:
				print(f"Error: Missing required field '{e}' in rule", file=sys.stderr)
				sys.exit(1)
			except re.error as e:
				print(f"Error compiling regex in rule '{rule_config.get('name', '')}': {e}", file=sys.stderr)
				sys.exit(1)

	def resolve_exceptions(self):
		"""解析规则间的依赖关系"""
		# 第一遍：添加直接例外引用
		for rule in self.rules:
			for exception_name in rule.exception_names:
				if exception_name in self.rule_map:
					rule.add_exception(self.rule_map[exception_name])
				else:
					print(f"Error: Rule '{rule.name}' references undefined exception rule '{exception_name}'", file=sys.stderr)
					sys.exit(1)

		# 第二遍：计算规则深度（用于检测循环依赖）
		changed = True
		while changed:
			changed = False
			for rule in self.rules:
				if rule.exceptions:
					new_depth = max(e.depth for e in rule.exceptions) + 1
					if new_depth > len(self.rules):
						print(f"Error: Circular dependency detected in rule '{rule.name}'", file=sys.stderr)
						sys.exit(1)
					if new_depth > rule.depth:
						rule.depth = new_depth
						changed = True

	def match_rule(self, rule, text, visited=None):
		"""
		递归检查规则匹配
		- 主规则匹配成功
		- 所有例外规则都不匹配
		"""
		if visited is None:
			visited = set()

		# 检测循环引用
		if rule.name in visited:
			print(f"Warning: Circular rule reference detected while matching '{rule.name}', skipping")
			return False

		visited.add(rule.name)

		# 检查主规则是否匹配
		if not rule.pattern.search(text):
			return False

		# 检查例外规则：任何一个例外规则匹配则整个规则不匹配
		for exception in rule.exceptions:
			if self.match_rule(exception, text, visited.copy()):
				return False

		return True

	def lint_file(self, file_path):
		"""检查单个文件并返回违规列表"""
		try:
			with open(file_path, "r") as f:
				lines = f.readlines()
		except IOError as e:
			print(f"Error reading file {file_path}: {e}", file=sys.stderr)
			return []

		violations = []
		for line_num, line in enumerate(lines, start=1):
			# 保留行尾换行符以正确匹配行尾模式
			line_with_nl = line

			for rule in self.rules:
				if rule.enforce and self.match_rule(rule, line_with_nl):
					violations.append({
						"file": file_path,
						"line": line_num,
						"rule": rule.name,
						"comment": rule.comment,
						"text": line.rstrip('\n')  # 去除换行符用于显示
					})

		return violations

def main():
	parser = argparse.ArgumentParser(description="Simple Document Format Linter")
	parser.add_argument("files", nargs="+", help="Files to lint")
	parser.add_argument("--config", default="lint.toml", help="Path to config file")
	args = parser.parse_args()

	start_time = time.time()  # Start timing

	linter = Linter(args.config)

	total_violations = 0
	is_tty = sys.stdout.isatty()
	RED = "\033[31m" if is_tty else ""
	RESET = "\033[0m" if is_tty else ""
	GRAY = "\033[90m" if is_tty else ""
	GREEN = "\033[32m" if is_tty else ""

	for file_path in args.files:
		violations = linter.lint_file(file_path)
		total_violations += len(violations)

		for v in violations:
			comment = f" - {v['comment']}" if v['comment'] else ""
			# Highlight violation header in red, violation text in gray if TTY
			print(f"{RED}{v['file']}:{v['line']}{RESET} [{v['rule']}]{comment}")
			print(f"{GRAY}  | {v['text']}{RESET}")

	elapsed = time.time() - start_time  # End timing

	if total_violations == 0:
		print(f"{GREEN}[OK] No violations found.{RESET}")
	else:
		print(f"\nFound {total_violations} violation(s).")
	print(f"Lint done in {elapsed:.3f} seconds.")  # Show elapsed time
	sys.exit(1 if total_violations > 0 else 0)

if __name__ == "__main__":
	main()
