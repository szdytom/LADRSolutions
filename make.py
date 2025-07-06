import toml
import requests
import zipfile
import tarfile
import platform
import os
import argparse
from pathlib import Path
from tqdm import tqdm

def executable_name(name):
	if platform.system().lower() == "windows":
		return f"{name}.exe"
	return name

# 读取build.toml文件
with open('build.toml', 'r') as f:
	config = toml.load(f)

# 创建临时目录和字体目录
temp_dir = Path('build')
fonts_dir = Path('fonts')
typst_ver = config["typst"]["version"]
typst_bin_path = temp_dir / executable_name(f"typst-{typst_ver}")
temp_dir.mkdir(parents=True, exist_ok=True)
fonts_dir.mkdir(parents=True, exist_ok=True)

# 下载文件的函数
def download_file(url, destination):
	"""
	下载文件并显示进度条

	:param url: 文件的URL
	:param destination: 文件保存的路径
	"""
	try:
		# 使用流式下载
		with requests.get(url, stream=True) as response:
			response.raise_for_status()  # 检查请求是否成功
			total_size = int(response.headers.get('content-length', 0))
			# 使用 tqdm 显示下载进度
			with open(destination, 'wb') as f, tqdm(
				desc=destination.name,
				total=total_size,
				unit='B',
				unit_scale=True,
				unit_divisor=1024,
			) as pbar:
				for chunk in response.iter_content(chunk_size=8192):
					if chunk:  # 过滤掉保持连接的块
						f.write(chunk)
						pbar.update(len(chunk))
		print(f"Downloaded {destination.name} to {destination.parent}.")
	except requests.exceptions.RequestException as e:
		print(f"Failed to download {url}: {e}")
		# 如果下载失败，删除 .part 文件
		if destination.exists():
			destination.unlink()
		raise  # 抛出异常，让调用者处理

# 下载并提取字体文件
def prepare_fonts():
	ok = True
	for font in config['fonts']:
		url = font['url']
		patterns = font['patterns']
		zip_name = Path(url).name  # 获取压缩包文件名
		zip_path = temp_dir / zip_name  # 压缩包本地路径
		zip_part_path = temp_dir / f"{zip_name}.part"  # 下载中的临时文件

		# 检查压缩包是否已存在
		if zip_path.exists():
			print(f"{zip_name} already exists in {temp_dir}. Skipping download.")
		else:
			# 下载压缩包
			print(f"Downloading {url}...")
			try:
				download_file(url, zip_part_path)
				# 下载完成后，将 .part 文件重命名为最终文件名
				zip_part_path.rename(zip_path)
			except requests.exceptions.RequestException:
				ok = False
				continue  # 如果下载失败，跳过当前字体

		# 解压缩并提取匹配的文件
		print(f"Extracting {zip_path}...")
		with zipfile.ZipFile(zip_path, 'r') as zip_ref:
			for file in zip_ref.namelist():
				if any(file.endswith(pattern) for pattern in patterns):
					target_file = fonts_dir / Path(file).name
					# 检查文件是否已经存在于fonts目录
					if target_file.exists():
						print(f"{target_file.name} already exists in {fonts_dir}. Skipping extraction.")
						continue
					# 提取文件
					print(f"Extracting {file}...")
					zip_ref.extract(file, temp_dir)
					# 将文件移动到fonts目录
					extracted_file = temp_dir / file
					extracted_file.rename(target_file)

	if ok:
		print("Fonts download and extraction completed.")
	else:
		print("Fonts download and extraction completed with errors.")
	return ok

def get_system_info():
	"""获取当前系统的操作系统和架构信息"""
	system = platform.system().lower()
	machine = platform.machine().lower()

	if machine == "amd64":
		machine = "x86_64"
	elif machine == "arm64":
		machine = "aarch64"
	elif machine == "armv7l":
		machine = "armv7"
	
	return f"{machine}-{system}"

def prepare_typst():
	"""下载并解压 typst 可执行文件"""
	system_info = get_system_info()
	typst_url = config["typst"][system_info]
	typst_archive_name = Path(typst_url).name
	typst_archive_path = temp_dir / typst_archive_name
	typst_part_path = temp_dir / f"{typst_archive_name}.part"

	# 检查是否已经下载
	if typst_bin_path.exists():
		print(f"Typst already exists in {temp_dir}. Skipping download.")
		return True

	# 下载 typst
	if not typst_archive_path.exists():
		print(f"Downloading {typst_url}...")
		try:
			download_file(typst_url, typst_part_path)
			typst_part_path.rename(typst_archive_path)
		except requests.exceptions.RequestException as e:
			print(f"Failed to download typst: {e}")
			return False
	else:
		print(f"Skipped download of {typst_archive_name}")

	# 解压 typst
	print(f"Extracting {typst_archive_path}...")
	typst_exe_name = executable_name("typst")
	
	if typst_archive_path.suffix == ".zip":
		with zipfile.ZipFile(typst_archive_path, 'r') as zip_ref:
			for file in zip_ref.namelist():
				if file.endswith(typst_exe_name):
					zip_ref.extract(file, temp_dir)
					extracted_file = temp_dir / file
					extracted_file.rename(typst_bin_path)
	elif typst_archive_path.suffixes == [".tar", ".xz"]:
		with tarfile.open(typst_archive_path, 'r:xz') as tar_ref:
			for file in tar_ref.getmembers():
				if file.name.endswith(typst_exe_name):
					tar_ref.extract(file, temp_dir)
					extracted_file = temp_dir / file.path
					extracted_file.rename(typst_bin_path)

	# 确保 typst 可执行文件存在
	if not typst_bin_path.exists():
		print(f"Failed to find typst executable in {temp_dir}.")
		return False
	
	print(f"Typst downloaded and extracted to {typst_bin_path}.")
	return True

def invoke_typst(mode="c"):
	"""调用 typst 命令"""
	if not typst_bin_path.exists():
		print("Typst executable not found.")
		return False

	command = [str(typst_bin_path), mode, "--font-path", str(fonts_dir), "--ignore-system-fonts", "main.typ"]
	print("Executing command: ", " ".join(command))
	try:
		os.execv(str(typst_bin_path), command)
	except OSError as e:
		print(f"Failed to execute typst command: {e}")
		return False

def main():
	parser = argparse.ArgumentParser(description="Run Typst with specified mode.")
	parser.add_argument('--mode', type=str, choices=['w', 'c'], default='c',
						help="Mode to run Typst: 'w' for watch mode, 'c' for compile mode.")
	args = parser.parse_args()

	if not prepare_fonts():
		return
	if not prepare_typst():
		return
	
	invoke_typst(mode=args.mode)

if __name__ == "__main__":
	main()
