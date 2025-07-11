#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot

#import "../styles.typ": exercise_sol, note, tab, ploting-styles, math_numbering
#import "../math.typ": ii, span

#exercise_sol(type: "answer")[
	对于 $FF^3$ 的下列各个子集，判断其是否是 $FF^3$ 的子空间：

	+ ${(x_1,x_2,x_3) in FF^3 : x_1+2x_2+3x_3=0}$
	+ ${(x_1,x_2,x_3) in FF^3 : x_1+2x_2+3x_3=4}$
	+ ${(x_1,x_2,x_3) in FF^3 : x_1x_2x_3=0}$
	+ ${(x_1,x_2,x_3) in FF^3 : x_1=5x_3}$
][
	方便起见，将这四个集合分别记作 $S_1, S_2, S_3, S_4$。为了验证它们是否是 $FF^3$ 的子空间，我们需要验证它们是否满足子空间的条件（原书定理1.34）。

	#tab 对于 $S_1$，我们验证以下三个条件：

	/ 加法单位元: $0 in S_1$。 \
		证明：注意到 $0 + 2 dot 0 + 3 dot 0 = 0$，故 $0 in S_1$。

	/ 加法封闭性: $u,w in S_1$ 意味着 $u+w in S_1$。 \
		证明：设 $u = (u_1, u_2, u_3)$，$w = (w_1, w_2, w_3)$，则 $u+w = (u_1+w_1, u_2+w_2, u_3+w_3)$。由于 $u_1 + 2u_2 + 3u_3 = 0$ 且 $w_1 + 2w_2 + 3w_3 = 0$，因此
		$ (u+w)_1 + 2(u+w)_2 + 3(u+w)_3 
			&= (u_1+w_1) + 2(u_2+w_2) + 3(u_3+w_3) \
			&= (u_1+2u_2+3u_3) + (w_1+2w_2+3w_3) \
			&= 0 + 0 = 0 $
		故 $u+w in S_1$。

	/ 数乘封闭性: $a in FF$ 且 $u in S_1$ 意味着 $a u in S_1$。 \
		证明：设 $u = (u_1, u_2, u_3)$，则 $a u = (a u_1, a u_2, a u_3)$。由于 $u_1 + 2u_2 + 3u_3 = 0$，因此
		$ (a u)_1 + 2(a u)_2 + 3(a u)_3 
			&= a u_1 + 2 a u_2 + 3 a u_3 \
			&= a (u_1 + 2u_2 + 3u_3) \
			&= a dot 0 = 0 $
		故 $a u in S_1$。
	
	#tab 综上所述，$S_1$ 是 $FF^3$ 的子空间。

	#tab 对于 $S_2$，注意到 $0 + 2 dot 0 + 3 dot 0 = 0 != 4$，故 $0 in.not S_2$。这违反了“加法单位元”的要求，说明 $S_2$ 不是 $FF^3$ 的子空间。

	#tab 对于 $S_3$，取 $u = (1,1,0) in S_3$，$v = (0, 0, 1) in S_3$，注意到 $u+v=(1,1,1) in.not S_3$，这违反了“加法封闭性”的要求，说明 $S_3$ 不是 $FF^3$ 的子空间。

	#tab 对于 $S_4$，我们验证以下三个条件：

	/ 加法单位元: $0 in S_4$。 \
		证明：注意到 $0 = 5 dot 0$，故 $0 in S_4$。

	/ 加法封闭性: $u,w in S_4$ 意味着 $u+w in S_4$。 \
		证明：设 $u = (u_1, u_2, u_3)$，$w = (w_1, w_2, w_3)$，则 $u+w = (u_1+w_1, u_2+w_2, u_3+w_3)$。由于 $u_1 = 5 u_3$ 且 $w_1 = 5 w_3$，因此
		$ u_1 + w_1 = 5 u_3 + 5 w_3 = 5(u_3 + w_3) $
		故 $u+w in S_4$。

	/ 数乘封闭性: $a in FF$ 且 $u in S_4$ 意味着 $a u in S_4$。 \
		证明：设 $u = (u_1, u_2, u_3)$，则 $a u = (a u_1, a u_2, a u_3)$。由于 $u_1 = 5 u_3$，因此
		$ a u_1 = a (5 u_3) = 5(a u_3) $
		故 $a u in S_4$。
	
	#tab 综上所述，$S_4$ 是 $FF^3$ 的子空间。
]

#exercise_sol(type: "explain")[
	验证下面这些有关子空间的结论。

	+ 如果 $b in FF$，那么当且仅当 $b=0$ 时，
		$ {(x_1,x_2,x_3,x_4) in FF^4 : x_3=5x_4 + b} $ 
		是 $FF^4$ 的子空间；
	+ 定义在区间 $[0,1]$ 上的全体连续实值函数构成的集合是 $RR^([0,1])$ 的子空间；
	+ 定义在 $RR$ 上的全体可微实值函数构成的集合是 $RR^RR$ 的子空间；
	+ 当且仅当 $b=0$ 时，定义在区间 $(0,3)$ 上且满足 $f'(2)=b$ 的全体可微实值函数 $f$ 构成的集合是 $RR^((0,3))$ 的子空间；
	+ 极限为 $0$ 的所有复数序列所构成的集合是 $CC^infinity$ 的子空间。

	#note(supplement: "说明")[本题原文为“验证例1.35中关于子空间的所有结论”。出于完整性考虑，这里将原书例1.35的所有结论摘录在上面。]
][
	我们逐个验证这些结论。对于第一个结论，我们首先验证其充分性。当 $b=0$ 时，此时集合 $S={(x_1,x_2,x_3,x_4) in FF^4 : x_3=5x_4}$。我们逐条验证其满足子空间的条件（原书定理1.34）：

	/ 加法单位元: $0 in S$。 \
		证明：注意到 $0 + 5 dot 0 = 0$，故 $0 in S$。

	/ 加法封闭性: $u,w in S$ 意味着 $u+w in S$。 \
		证明：设 $u = (u_1, u_2, u_3, u_4)$，$w = (w_1, w_2, w_3, w_4)$，则 $u+w = (u_1+w_1, u_2+w_2, u_3+w_3, u_4+w_4)$。由于 $u_3 = 5 u_4$ 且 $w_3 = 5 w_4$，因此
		$ (u+w)_3 = (u_3 + w_3) = 5(u_4 + w_4) $
		故 $u+w in S$。

	/ 数乘封闭性: $a in FF$ 且 $u in S$ 意味着 $a u in S$。 \
		证明：设 $u = (u_1, u_2, u_3, u_4)$，则 $a u = (a u_1, a u_2, a u_3, a u_4)$。由于 $u_3 = 5 u_4$，因此
		$ (a u)_3 = a u_3 = a (5 u_4) = 5(a u_4) $
		故 $a u in S$。

	#tab 综上所述，当 $b=0$ 时，$S$ 是 $FF^4$ 的子空间。

	#tab 为了说明其必要性，我们假定 $b != 0$，此时，注意到 $0 + 5 dot 0 + b = b != 0$，故 $0 in.not S$。这违反了“加法单位元”的要求，说明当 $b != 0$ 时，$S$ 不是 $FF^4$ 的子空间。由此，我们证明了第一个结论。

	#tab 第二个结论和第三个结论具有较强的数学分析背景，严格论证大大超出了“代数”的范围。从直觉上说，两个连续函数的和仍然是连续的，两个可微函数的和仍然是可微的，连续函数的数乘仍然是连续的，可微函数的数乘仍然是可微的，以及函数 $x |-> 0$ 自然是连续且可微的。因此这两个集合都是子空间。我们不再详细论证。

	#tab 对于第四个结论，我们首先验证其充分性。当 $b=0$ 时，集合 $S={(f in RR^((0,3)) : f'(2)=0}$。我们逐条验证其满足子空间的条件（原书定理1.34）：

	/ 加法单位元: $0 in S$。 \
		证明：注意到 $0'(2) = 0$，故 $0 in S$。

	/ 加法封闭性: $u,w in S$ 意味着 $u+w in S$。 \
		证明：设 $u, w in S$，则 $u'(2) = 0$ 且 $w'(2) = 0$。因此
		$ (u+w)'(2) = u'(2) + w'(2) = 0 + 0 = 0 $
		故 $u+w in S$。

	/ 数乘封闭性: $a in RR$ 且 $u in S$ 意味着 $a u in S$。 \
		证明：设 $u in S$，则 $u'(2) = 0$。因此
		$ (a u)'(2) = a u'(2) = a dot 0 = 0 $ 
		故 $a u in S$。

	#tab 综上所述，当 $b=0$ 时，$S$ 是 $RR^((0,3))$ 的子空间。下面说明其必要性。假设 $b != 0$，此时，注意到 $0'(2) = 0 != b$，故 $0 in.not S$。这违反了“加法单位元”的要求，说明当 $b != 0$ 时，$S$ 不是 $RR^((0,3))$ 的子空间。由此，我们证明了第四个结论。

	#tab 第五个结论也具有较强的数学分析背景，严格论证大大超出了“代数”的范围。从直觉上说，是很容易理解的，在此不再详细论证。 
]

#exercise_sol(type: "proof")[
	证明：在区间 $(-4,4)$ 上的满足 $f'(-1) = 3f(2)$ 的可微实值函数 $f$ 构成的集合是 $RR^((-4,4))$ 的子空间。
][
	记 $S$ 为题目所说的子集，即 $S={f in RR^((-4,4)) : f'(-1) = 3f(2)}$。我们逐条验证其满足子空间的条件（原书定理1.34）：

	/ 加法单位元: $0 in S$。 \
		证明：注意到 $0'(-1) = 0 = 3 dot 0 = 3 dot 0(2)$，故 $0 in S$。

	/ 加法封闭性: $u,w in S$ 意味着 $u+w in S$。 \
		证明：设 $u, w in S$，则 $u'(-1) = 3 u(2)$ 且 $w'(-1) = 3 w(2)$。因此
		$ (u+w)'(-1) = u'(-1) + w'(-1) = 3 u(2) + 3 w(2) = 3(u(2) + w(2)) $
		故 $u+w in S$。

	/ 数乘封闭性: $a in RR$ 且 $u in S$ 意味着 $a u in S$。 \
		证明：设 $u in S$，则 $u'(-1) = 3 u(2)$。因此
		$ (a u)'(-1) = a u'(-1) = a dot 3 u(2) = 3(a u(2)) $
		故 $a u in S$。

	#tab 综上所述，满足条件的集合是 $RR^((-4,4))$ 的子空间。
]

#exercise_sol(type: "proof")[
	设 $b in RR$，证明：在区间 $[0,1]$ 上满足 $integral_0^1 f = b$ 的连续实值函数 $f$ 构成的集合是 $RR^([0,1])$ 的子空间，当且仅当 $b=0$。
][
	我们首先说明其充分性。假设 $b=0$，此时 $S = {f in RR^([0, 1]) : integral_0^1 f = 0}$，我们逐条验证其满足子空间的条件（原书定理1.34）：

	/ 加法单位元: $0 in S$。 \
		证明：注意到 $integral_0^1 0 = 0$，故 $0 in S$。

	/ 加法封闭性: $u,w in S$ 意味着 $u+w in S$。 \
		证明：设 $u, w in S$，则
		$ integral_0^1 (u+w) = integral_0^1 u + integral_0^1 w = 0 + 0 = 0 $
		故 $u+w in S$。

	/ 数乘封闭性: $a in RR$ 且 $u in S$ 意味着 $a u in S$。 \
		证明：设 $u in S$，则
		$ integral_0^1 (a u) = a integral_0^1 u = a dot 0 = 0 $
		故 $a u in S$。
	
	#tab 综上所述，当 $b=0$ 时，$S$ 是 $RR^([0,1])$ 的子空间。
]

#exercise_sol(type: "answer")[
	$RR^2$ 是不是复向量空间 $CC^2$ 的子空间？
][
	不是。注意到，取 $v=(1,0) in RR^2$，则

	$ ii v = (ii, 0) in.not RR^2 $

	#tab 这违反了子空间的条件（原书定理1.34）中对“数乘封闭性”的要求。由此，$RR^2$ 不是 $CC^2$ 的子空间。
]

#exercise_sol(type: "proof")[
	+ ${(a,b,c) in RR^3 : a^3 = b^3}$ 是不是 $RR^3$ 的子空间？
	+ ${(a,b,c) in CC^3 : a^3 = b^3}$ 是不是 $CC^3$ 的子空间？
][
	我们首先来看第一个集合 $S_RR={(a,b,c) in RR^3 : a^3 = b^3}$。当 $a^3 = b^3$ 时，$a^3 - b^3=0$，即

	$ (a - b)(a^2 + a b + b^2) = 0 $

	#tab 当 $a b>0$ 时，
	
	$ a^2 + a b + b^2 > a^2 - 2 a b + b^2 = (a - b)^2 >= 0 $

	#tab 当 $a b<0$ 时，

	$ a^2 + a b + b^2 > a^2 + 2 a b + b^2 = (a + b)^2 >= 0 $

	#tab 即当 $a != 0$ 且 $b != 0$ 时，$a^2 + a b + b^2 > 0$。此时，必然有 $a - b = 0$，即 $a = b$。而 $a = b = 0$ 时，自然也有 $a = b$。综上所述，$a^3 = b^3$ 意味着 $a = b$。

	#tab 由此，我们可以将 $S_RR$ 重写为 $S_RR={(a,b,c) in RR^3 : a = b}$。我们逐条验证其满足子空间的条件（原书定理1.34）：

	/ 加法单位元: $0 in S_RR$。 \
		证明：注意到 $0 = 0$，故 $0 in S_RR$。

	/ 加法封闭性: $u,w in S_RR$ 意味着
		$u+w in S_RR$。 \
		证明：设 $u = (u_1, u_2, u_3)$，$w = (w_1, w_2, w_3)$，
		则 $u+w = (u_1+w_1, u_2+w_2, u_3+w_3)$。由于 $u_1 = u_2$ 且 $w_1 = w_2$，因此
		$ u_1 + w_1 = u_2 + w_2 $
		故 $u+w in S_RR$。

	/ 数乘封闭性: $a in RR$ 且 $u in S_RR$ 意味着
		$a u in S_RR$。 \
		证明：设 $u = (u_1, u_2, u_3)$，则 $a u = (a u_1, a u_2, a u_3)$。由于 $u_1 = u_2$，因此
		$ a u_1 = a u_2 $
		故 $a u in S_RR$。

	#tab 综上所述，$S_RR$ 是 $RR^3$ 的子空间。

	#tab 对于第二个集合 $S_CC={(a,b,c) in CC^3 : a^3 = b^3}$，注意到，取
	
	$ u = ((-1 + sqrt(3) ii) / 2, 1, 0)"， " v = ((-1 - sqrt(3) ii) / 2, 1, 0) $

	#tab 容易验证 $u, v in S_CC$，而

	$ u + v = (-1, 2, 0) in.not S_CC $

	#tab 这违反了子空间的条件（原书定理1.34）中对“加法封闭性”的要求。由此，$S_CC$ 不是 $CC^3$ 的子空间。
]

#exercise_sol(type: "proof")[
	证明或推翻：如果 $U$ 是 $RR^2$ 的非空子集，满足对加法封闭和对“取加法逆元”封闭（即 $u in U$ 意味着 $-u in U$），那么 $U$ 是 $RR^2$ 的子空间。
][
	取 $U = {(1, 0), (0, 0), (-1, 0)}$，容易验证 $U$ 满足对加法封闭和对“取加法逆元”封闭。但是，取 $u = (1, 0) in U$, $2u = (2, 0) in.not U$，这违反了子空间的条件（原书定理1.34）中对“数乘封闭性”的要求。由此，$U$ 不是 $RR^2$ 的子空间。

	#tab 我们找到了一个反例，这说明题目中的命题不成立。
]

#note[还可以取 $U = {(a, b) : a,b in QQ}$ 作为反例。]

#exercise_sol(type: "answer")[
	给出一例：$RR^2$ 的非空子集 $U$，满足对标量数乘封闭，但不是 $RR^2$ 的子空间。
][
	取
	
	$ U = {(a, 0) : a in RR} union {(0, a) : a in RR} subset.eq RR^2 $

	#tab 这个集合满足对标量数乘封闭，但不满足对加法封闭。比如，取 $u = (1, 0) in U$，$v = (0, 1) in U$，则 $u+v=(1, 1) in.not U$。因此 $U$ 不是 $RR^2$ 的子空间。
]

#exercise_sol(type: "answer", label: "tricky")[
	函数 $f: RR -> RR$ 被成为*周期的（periodic）*，是指存在一正数 $p$，使得 $f(x) = f(x + p)$ 对所有 $x in RR$ 成立。$RR -> RR$ 上的周期函数构成的集合是不是 $RR^RR$ 的子空间？请作解释。
][
	不是。取 $f(x) = sin(x)$，$g(x) = sin(sqrt(2) x)$。容易验证，对于任意 $x in RR$，

	$ f(x + 2 pi) &= f(x) \
		g(x + sqrt(2) pi) &= g(x) $

	因此 $f$ 和 $g$ 都是 $RR^RR$ 中的周期函数。现在令 $h=f+g$。下面说明 $h$ 不是周期函数。

	#figure(
		caption: [函数 $h(x) = sin(pi x) + sin(sqrt(2) pi x)$ 的图像。],
		placement: auto,
	cetz.canvas({
		import cetz.draw: *
		ploting-styles.axis
		let domain = (0, 10.7 * calc.pi)
		plot.plot(
			size: (12, 3),
			x-tick-step: calc.pi,
			x-format: plot.formats.multiple-of,
			axis-style: "scientific",
			y-tick-step: 2,
			x-min: domain.at(0),
			x-max: domain.at(1),
			y-min: -2.4,
			y-max: 2.4,
			x-grid: true,
			y-grid: true,
			x-label: none,
			y-label: none,
		{
			plot.add(
				x => calc.sin(x) + calc.sin(calc.sqrt(2) * x),
				domain: domain,
				samples: 1000,
				style: ploting-styles.s,
			)
		})
	}))

	#show: math_numbering(true)

	#tab 使用反证法，假设存在实数 $p > 0$，满足 $h(x) = h(x + p)$ 对所有 $x in RR$ 成立，即

	$ sin(x) + sin(sqrt(2) x) = sin(x + p) + sin(sqrt(2) x + sqrt(2) p) $ <1C-h-periodic-assume-eq>

	#tab 对@1C-h-periodic-assume-eq 两边同时求导两次，得到

	$ -sin(x) - 2 sin(sqrt(2) x) = - sin(x + p) - 2 sin(sqrt(2) x + sqrt(2) p) $ <1C-h-periodic-assume-eq-dd>

	#tab 将@1C-h-periodic-assume-eq 与@1C-h-periodic-assume-eq-dd 相加并化简，得到

	$ sin(sqrt(2) x) = sin(sqrt(2) x + sqrt(2) p) $ <1C-h-periodic-assume-eq-res-sqrt2>

	#tab 进一步将@1C-h-periodic-assume-eq 减去@1C-h-periodic-assume-eq-res-sqrt2，得到

	$ sin(x) = sin(x + p) $ <1C-h-periodic-assume-eq-res-1>

	#show: math_numbering(false)

	#tab 向@1C-h-periodic-assume-eq-res-sqrt2 与@1C-h-periodic-assume-eq-res-1 中代入 $x=0$，得到

	$ sin(p) = sin(sqrt(2) p) = 0 $

	#tab 这意味着存在 $k_1,k_2 in ZZ$，使得 $sqrt(2) p = 2 k_1 pi$ 且 $p = 2 k_2 pi$。联立消去 $p$，得到 $sqrt(2) = k_1 slash k_2$，这与我们熟知的 $sqrt(2) in.not QQ$ 矛盾，故假设不成立。

	#tab 综上所述，$h$ 不是 $RR^RR$ 上的周期函数。这表明 $RR -> RR$ 上的周期函数构成的集合并不符合子空间的条件（原书定理1.34）中对“加法封闭性”的要求，因此其不是 $RR^RR$ 的子空间。
]

#exercise_sol(type: "proof", ref: <1C-inter-of-subspace-is-subspace>)[
	设 $V_1$ 和 $V_2$ 都是 $V$ 的子空间，证明：交集 $V_1 inter V_2$ 是 $V$ 的子空间。
][
	记 $S=V_1 inter V_2$，我们逐条验证其满足子空间的条件（原书定理1.34）：

	/ 加法单位元: $0 in S$。 \
		证明：由于 $V_1$ 和 $V_2$ 都是 $V$ 的子空间，因此 $0 in V_1$ 且 $0 in V_2$，从而 $0 in S$。

	/ 加法封闭性: $u,w in S$ 意味着 $u+w in S$。 \
		证明：设 $u, w in S$，则
		$ u in V_1, w in V_1, u in V_2, w in V_2 $
		因此 $u+w in V_1$ 且 $u+w in V_2$，从而 $u+w in S$。

	/ 数乘封闭性: $a in V$ 且 $u in S$ 意味着 $a u in S$。 \
		证明：设 $u in S$，则
		$ u in V_1, u in V_2 $
		因此 $a u in V_1$ 且 $a u in V_2$，从而 $a u in S$。

	#tab 综上所述，$V_1 inter V_2$ 是 $V$ 的子空间。
]

#exercise_sol(type: "proof")[
	证明：$V$ 的任意一族子空间的交集是 $V$ 的子空间。
][
	设 $V_1,dots,V_n$ 都是 $V$ 的子空间，记 $S=V_1 inter dots inter V_n$。我们关于 $n$ 使用数学归纳法。

	/ 第 $1$ 步: \
		当 $n=1$ 时，$S=V_1$，显然是 $V$ 的子空间。

	/ 第 $k+1$ 步: \
		假设当 $n=k$ 时，结论成立，即 $V_1 inter dots inter V_k$ 是 $V$ 的子空间。又因为 $V_(k+1)$ 是 $V$ 的子空间，由@1C-inter-of-subspace-is-subspace 可知，$(V_1 inter dots inter V_k) inter V_(k+1)$ 也是 $V$ 的子空间。由此，我们证明了当 $n=k+1$ 时，结论也成立。

	#tab 综上所述，$V$ 的任意一族子空间的交集是 $V$ 的子空间。
]

#exercise_sol(type: "proof", ref: <1C-when-union-of-two-subspaces-is-subspace>)[
	证明：$V$ 的两个子空间的并集是 $V$ 的子空间，当且仅当其中一个子空间是另一个的子集。
][
	设 $V_1$ 和 $V_2$ 都是 $V$ 的子空间。我们首先说明充分性。不妨设 $V_1 subset.eq V_2$，则 $V_1 union V_2 = V_2$ 是 $V$ 的子空间。

	#tab 下面说明必要性。使用反证法，假设 $V_1 union V_2$ 是 $V$ 的子空间，以及 $V_1 subset.eq.not V_2$ 且 $V_2 subset.eq.not V_1$。则可以找到 $v_1, v_2 in V$，使得 $v_1 in V_1$ 且 $v_1 in.not V_2$，以及 $v_2 in V_2$ 且 $v_2 in.not V_1$。

	#tab 令 $u = v_1 + v_2$。由于 $v_1,v_2 in V_1 union V_2$，因此 $u in V_1 union V_2$。不妨设 $u in V_1$，则 $v_2 = u - v_1 in V_1$，矛盾，故假设不成立。

	#tab 综上所述，$V$ 的两个子空间的并集是 $V$ 的子空间，当且仅当其中一个子空间是另一个的子集。
]

#exercise_sol(type: "proof", label: "hard")[
	证明：$V$ 的三个子空间的并集是 $V$ 的子空间，当且仅当其中一个包含另外两个。

	#note[令人惊讶的是，这道习题比@1C-when-union-of-two-subspaces-is-subspace 难不少，也许是因为如果我们把 $FF$ 换成只包含两个元素的域，这道习题的结论就不成立了。]
][
	设 $V_1, V_2, V_3$ 都是 $V$ 的子空间。我们首先说明充分性。不妨设 $V_1 subset.eq V_3$ 且 $V_2 subset.eq V_3$，则 $V_1 union V_2 union V_3 = V_3$ 是 $V$ 的子空间。

	#tab 下面说明必要性。使用反证法，假设 $V_1 union V_2 union V_3$ 是 $V$ 的子空间，以及任意一个 $V_j$ 都不包含另外两个。
	
	#tab 我们首先说明，任意一个 $V_j$ 都不是另外两个的并集的子集。否则，不妨设 $V_1 subset.eq V_2 union V_3$，则 $V_1 union V_2 union V_3 = V_2 union V_3$ 是 $V$ 的子空间。应用@1C-when-union-of-two-subspaces-is-subspace，可以推出 $V_2 subset.eq V_3$ 或 $V_3 subset.eq V_2$，这说明 $V_2$ 或 $V_3$ 包含另外两个，矛盾，故假设不成立。因此，

	$ V_1 subset.eq.not V_2 union V_3 wide and wide V_2 union V_3 subset.eq.not V_1 $

	#tab 所以可以找到 $u, v in V$ 使得 $u in V_1$ 且 $u in.not V_2 union V_3$，以及 $v in V_2 union V_3$ 且 $v in.not V_1$。由于 $V_1$，$V_2$ 和 $V_3$ 都包含 $0$，因此 $u != 0$ 且 $v != 0$。我们取集合 $v + span(u)$#footnote[记号 $span$ 在后续的2A节中由原书定义2.19定义，而记号 $v + V$ 表示平移，由后续3E节原书定义3.97定义。但是这里无需明白这些定义，将其当作一个集合的名字即可。]，

	$ v + span(u) = {v + lambda u : lambda in FF} $

	#tab 下面我们说明 $V_1 inter (v + span(u)) = nothing$。使用反证法，假设存在 $w = v + k_1 u in V_1$，则 $v = w - k_1 u$。又因为 $w in V_1$ 且 $u in V_1$，因此 $v in V_1$，矛盾，故假设不成立，即 $V_1 inter (v + span(u)) = nothing$。

	#tab 根据反证假设 $V_1 union V_2 union V_3$ 是向量空间，因此 $v + span(u) subset.eq V_1 union V_2 union V_3$。又因为 $V_1 inter (v + span(u)) = nothing$，所以

	$ v + span(u) subset.eq V_2 union V_3 $

	#tab 现在，我们说明 $v + span(u)$ 中包含至少 $3$ 个元素。我们取函数

	$ f:& FF -> v + span(u) \ &x |-> v + x u $

	#tab 对于任意的 $x_1, x_2 in FF$，我们有

	$ f(x_1) - f(x_2) = (v + x_1 u) - (v + x_2 u) = (x_1 - x_2)u $

	#tab 由于 $u != 0$，因此 $f(x_1) = f(x_2)$ 当且仅当 $x_1 = x_2$。这说明 $f$ 是单射，即 $v + span(u)$ 至少和 $FF$ 一样大，因此 $v + span(u)$ 至少包含 $3$ 个元素。

	#tab 根据抽屉原理#footnote[抽屉原理的一种通俗的说法是：若将 $n$ 个物品放在 $r$ 个盒子里，$r<n$，那么至少有一个盒子包含多于一个物品。在这里，相当于是将 $v + span(u)$ 中的大于等于 $3$ 个物品放入 $V_2$ 和 $V_3$ 两个盒子中。]，在 $V_2$ 与 $V_3$ 中至少有一个包含 $v + span(u)$ 中的两个元素。不妨设 $V_2$ 包含 $v + span(u)$ 中的两个元素 $w_1 = v + mu_1 u$ 和 $w_2 = v + mu_2 u$，其中 $mu_1, mu_2 in FF$ 且 $mu_1 != mu_2$。由于 $V_2$ 是向量空间，故 
	
	$ w_1 - w_2 = (v + mu_1 u) - (v + mu_2 u) = (mu_1 - mu_2)u in V_2 $

	#tab 由于 $mu_1 != mu_2$，我们立即得到 $u in V_2$，而这与 $u in.not V_2 union V_3$ 矛盾，故假设不成立。

	#tab 综上所述，$V$ 的三个子空间的并集是 $V$ 的子空间，当且仅当其中一个包含另外两个。
]

#exercise_sol(type: "explain")[
	令

	$ U = {(x, -x, 2x) in FF^3 : x in FF} quad "与" quad W = {(x, x, 2x) in FF^3 : x in FF} $

	用符号描述 $U + W$，并给出不使用符号的描述。
][
	我们声称

	$ S = {(x, y, 2x) in FF^3 : x,y in FF^3} = U + W $

	#tab 为了证明这一点，我们将论证 $S subset.eq U + W$ 以及 $U + W subset.eq S$。现在设 $u = (a, b, 2a)$，其中 $a, b in FF$，即 $u in S$。注意到 $u = v_1 + v_2$，其中

	$ v_1 &= ((a - b) / 2, -(a - b) / 2, a - b) in U \
		v_2 &= ((a + b) / 2, (a + b) / 2, a + b) in W $
	
	#tab 故 $u in U + W$，这表明 $S subset.eq U + W$。另一方面，设 $u = (a + b, -a + b, 2a + 2b)$，其中 $a, b in FF$，即 $u in U + W$。注意到 $u = (x, y, 2x)$，其中

	$ cases(x = a + b, y = -a + b) $

	#tab 这表明 $u in S$，即 $U + W subset.eq S$。综上所述，$S = U + W$。

	#tab 不使用符号的描述：$U + W$ 是 $FF^3$ 中第三个分量是第一个分量的两倍的所有元素构成的集合。
]

#exercise_sol(type: "answer")[
	设 $U$ 是 $V$ 的子空间，那么 $U + U$ 是什么？
][
	由子空间加法封闭性可知，$U + U subset.eq U$，另一方面，对于 $u in U$，我们有 $u + 0 = u$，因此 $U subset.eq U + U$。综上所述，$U + U = U$。
]

#exercise_sol(type: "answer")[
	$V$ 的“子空间求和”运算可交换吗？换句话说，设 $U$ 和 $W$ 都是 $V$ 的子空间，那么 $U + W = W + U$ 是否成立？
][
	是的。我们有

	$ U + W = {u + w : u in U, w in W} = {w + u : u in U, w in W} = W + U $

	#tab 这说明 $U + W = W + U$ 成立。
]

#exercise_sol(type: "answer")[
	$V$ 的“子空间求和”运算可结合吗？换句话说，设 $V_1, V_2, V_3$ 都是 $V$ 的子空间，那么 $(V_1 + V_2) + V_3 = V_1 + (V_2 + V_3)$ 是否成立？
][
	是的。我们有

	$ (V_1 + V_2) + V_3 
		&= {u + w : u in V_1 + V_2, w in V_3} \
		&= {u + w : u in {v_1 + v_2 : v_1 in V_1, v_2 in V_2}, w in V_3} \
		&= {v_1 + v_2 + w : v_1 in V_1, v_2 in V_2, w in V_3} \
		&= V_1 + (V_2 + V_3) $

	#tab 这说明 $(V_1 + V_2) + V_3 = V_1 + (V_2 + V_3)$ 成立。
]

#exercise_sol(type: "answer")[
	$V$ 的“子空间求和”运算有没有加法单位元？哪些子空间有加法逆元？
][
	“子空间求和”运算的加法单位元是 ${0}$。设 $U$ 是 $V$ 的子空间，对于任意 $u in U$,都有 $u + 0 = u$，故 $U + {0} = U$。

	#tab 由于 ${0} + {0} = {0}$，故 ${0}$ 有加法逆元 ${0}$。我们下面说明，除此之外，没有任何子空间有加法逆元。使用反证法，假设 $U$ 是 $V$ 的子空间，满足 $U != {0}$ 且 $W$ 是 $U$ 的加法逆元，注意到 $U subset.eq U + W = {0}$，矛盾，故假设不成立。

	#tab 综上所述，“子空间求和”运算的加法单位元是 ${0}$，而只有 ${0}$ 有加法逆元。
]

#exercise_sol(type: "answer")[
	证明或证伪：如果 $V_1$，$V_2$，$U$ 都是 $V$ 的子空间，且

	$ V_1 + U = V_2 + U $

	则有 $V_1 = V_2$。
][
	令

	$ V &= RR^3 \ 
		U &= {(0, x, y) in RR^3 : x,y in RR} \
		V_1 &= {0} \
		V_2 &= {(0, x, 0) in RR^3 : x in RR} $

	#tab 注意到 $V_1 + U = U = V_2 + U$，但 $V_1 != V_2$。

	#tab 该反例说明，题目中的命题不成立。
]

#exercise_sol(type: "answer")[
	令

	$ U = {(x, x, y, y) in FF^4 : x,y in FF} $

	求 $FF^4$ 的一个子空间 $W$，使得 $FF^4 = U plus.circle W$。
][
	取

	$ W = {(x, 0, y, 0) in FF^4 : x,y in FF} $

	#tab 我们首先证明 $FF^4 = U + W$。任取 $u = (a, b, c, d) in FF^4$，注意到 $u = v_1 + v_2$，其中，

	$ v_1 &= (b, b, d, d) in U \
		v_2 &= (a - b, 0, c - d, 0) in W $

	#tab 进一步地，我们说明这个和是直和。根据两个子空间的直和的条件（原书定理1.46），我们只需说明 $U inter W = {0}$。设 $v in U inter W$，那么存在 $a, b, c, d in FF$，使得

	$ (a, a, b, b) = v = (c, 0, d, 0) $

	#tab 解得 $a = b = c = d = 0$，故 $U inter W = {0}$。

	#tab 综上所述，$FF^4 = U plus.circle W$。
]

#note[$W$ 还有其他符合题意的构造方案，例如 $W = {(0, x, 0, y) in FF^4 : x,y in FF}$。]

#exercise_sol(type: "answer")[
	令

	$ U = {(x, y, x + y, x - y, 2x) in FF^5 : x,y in FF} $

	求 $FF^5$ 的一个子空间 $W$，使得 $FF^5 = U plus.circle W$。
][
	取

	$ W &= {(x, y, z, 0, 0) in FF^5 : x,y,z in FF} $

	#tab 我们首先说明，$FF^5 = U + W$。任取 $u = (a, b, c, d, e, f) in FF^5$，注意到 $u = w + v$，其中

	$ w &= (e / 2, -d + e / 2, -d + e, d, e) \
		v &= (a - e / 2, b + d - e / 2, c + d - e, 0, 0) $

	#tab 进一步地，我们说明这个和是直和。我们将 $0$ 分解为两个向量的和，使得每个向量都来自于一个子空间。具体地，我们设

	$ 0 = (a, b, a + b, a - b, 2a) + (c, d, e, 0, 0) $

	#tab 其中 $a, b, c, d, e in FF$。这给出一个五元一次方程组

	$ cases(
		a + c = 0,
		b + d = 0,
		a + b + e = 0,
		a - b = 0,
		2a = 0
	) $

	#tab 这个方程组的唯一解是 $a = b = c = d = e = 0$，这说明 $0$ 只有唯一的表示方式。根据直和的条件（原书定理1.45），我们确认 $FF^5 = U plus.circle W$。
]

#exercise_sol(type: "answer")[
	令

	$ U = {(x, y, x + y, x - y, 2x) in FF^5 : x,y in FF} $

	求 $FF^5$ 的三个都不为 ${0}$ 的子空间 $W_1$，$W_2$ 和 $W_3$，使得 $FF^5 = U plus.circle W_1 plus.circle W_2 plus.circle W_3$。
][
	对于 $i in {1,2,3}$，取

	$ W_1 &= {(x, 0, 0, 0, 0) in FF^5 : x in FF} \
		W_2 &= {(0, x, 0, 0, 0) in FF^5 : x in FF} \
		W_3 &= {(0, 0, x, 0, 0) in FF^5 : x in FF} $

	#tab 我们首先说明，$FF^5 = U + W_1 + W_2 + W_3$。任取 $u = (a, b, c, d, e, f) in FF^5$，注意到 $u = w + v_1 + v_2 + v_3$，其中

	$ w &= (e / 2, -d + e / 2, -d + e, d, e) \
		v_1 &= (a - e / 2, 0, 0, 0, 0) \
		v_2 &= (0, b + d - e / 2, 0, 0, 0) \
		v_3 &= (0, 0, c + d - e, 0, 0) $

	#tab 进一步地，我们说明这个和是直和。我们将 $0$ 分解为四个向量的和，使得每个向量都来自于一个子空间。具体地，我们设

	$ 0 = (a, b, a + b, a - b, 2a) + (c, 0, 0, 0, 0) + (0, d, 0, 0, 0) + (0, 0, e, 0, 0) $

	#tab 其中 $a, b, c, d, e in FF$。这给出一个五元一次方程组

	$ cases(
		a + c = 0,
		b + d = 0,
		a + b + e = 0,
		a - b = 0,
		2a = 0
	) $

	#tab 这个方程组的唯一解是 $a = b = c = d = e = 0$，这说明 $0$ 只有唯一的表示方式。根据直和的条件（原书定理1.45），我们确认 $FF^5 = U plus.circle W_1 plus.circle W_2 plus.circle W_3$。
]

#exercise_sol(type: "answer")[
	证明或证伪：如果 $V_1$，$V_2$，$U$ 都是 $V$ 的子空间，且

	$ V = V_1 plus.circle U wide and wide V = V_2 plus.circle U $

	则有 $V_1 = V_2$。

	#note(supplement: "提示")[在尝试确认线性代数中的一个命题是否成立时，先在 $FF^2$ 中试试，通常时很有帮助的。]
][
	令

	$ V &= FF^2 \
		U &= {(0, x) in FF^2 : x in FF} \
		V_1 &= {(x, 0) in FF^2 : x in FF} \
		V_2 &= {(x, x) in FF^2 : x in FF} $

	#tab 容易验证，$V = V_1 plus.circle U$ 且 $V = V_2 plus.circle U$，但 $V_1 != V_2$。

	#tab 该反例说明，题目中的命题不成立。
]

#exercise_sol(type: "proof")[
	函数 $f: RR -> RR$ 被成为*偶的（even）*，是指

	$ f(-x) = f(x) $

	对所有 $x in RR$ 成立。函数 $f: RR -> RR$ 被成为*奇的（odd）*，是指

	$ f(-x) = -f(x) $
	
	对所有 $x in RR$ 成立。令 $V_"e"$ 代表 $RR$ 上的实值偶函数构成的集合，$V_"o"$ 代表 $RR$ 上的实值奇函数构成的集合。证明：$RR^RR = V_"e" + V_"o"$。
][
	#let ve = $V_"e"$
	#let vo = $V_"o"$
	#let fe = $f_"e"$
	#let fo = $f_"o"$
	我们首先说明 $RR^RR = ve + vo$。任意一个函数 $f: RR -> RR$ 都可以写成 $f = fe + fo$，其中

	$ fe(x) &= 1/2(f(x) + f(-x)) \
		fo(x) &= 1/2(f(x) - f(-x)) $

	#tab 注意到
	
	$ fe(-x) &= 1/2(f(-x) + f(x)) &= fe(x) \
		fo(-x) &= 1/2(f(-x) - f(x)) &= fo(x) $
		
	#tab 因此 $fe in ve$ 且 $fo in vo$。这说明 $f = fe + fo in ve + vo$，即 $RR^RR = ve + vo$。

	#tab 下面说明 $ve inter vo = {0}$。设 $f in ve inter vo$，则 $f$ 是偶函数且奇函数。我们有

	$ f(-x) = f(x) wide and wide f(-x) = -f(x) $

	#tab 这说明 $f(x) = -f(x)$ 对所有 $x in RR$ 成立，因此 $f(x) = 0$ 对所有 $x in RR$ 成立，即 $f = 0$。因此 $ve inter vo = {0}$。

	#tab 根据两个子空间的直和的条件（原书定理1.46），我们确认 $RR^RR = ve plus.circle vo$。
]
