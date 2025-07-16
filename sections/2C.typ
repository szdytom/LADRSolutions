#import "../styles.typ": exercise_sol, note, tab, exercise_ref, math_numbering
#import "../math.typ": span, Poly

#exercise_sol(type: "proof")[
	证明：$RR^2$ 的子空间恰有 ${0}$，$RR^2$ 中所有过原点的直线，以及 $RR^2$ 本身。
][
	设 $U$ 是 $RR^2$ 的子空间，根据子空间的维数性质（原书2.37），有 $dim U in {0, 1, 2}$。

	- 如果 $dim U = 0$，则 $U = span() = {0}$；

	- 如果 $dim U = 1$，则存在一个非零向量 $v$，使得 $U = span(v)$，即 $U$ 是过原点的直线；

	- 如果 $dim U = 2$，则根据满维数的子空间等于整个空间（原书2.39），$U = RR^2$。

	#tab 综上所述，$RR^2$ 的子空间恰有 ${0}$，$RR^2$ 中所有过原点的直线，以及 $RR^2$ 本身。
]

#exercise_sol(type: "proof")[
	证明：$RR^3$ 的子空间恰有 ${0}$，$RR^3$ 中所有过原点的直线，$RR^3$ 中所有过原点的平面，以及 $RR^3$ 本身。
][
	设 $U$ 是 $RR^3$ 的子空间，根据子空间的维数性质（原书2.37），有 $dim U in {0, 1, 2, 3}$。

	- 如果 $dim U = 0$，则 $U = span() = {0}$；

	- 如果 $dim U = 1$，则存在一个非零向量 $v$，使得 $U = span(v)$，即 $U$ 是过原点的直线；

	- 如果 $dim U = 2$，则存在两个线性无关的向量 $v_1, v_2$，使得 $U = span(v_1, v_2)$，即 $U$ 是过原点的平面；

	- 如果 $dim U = 3$，则根据满维数的子空间等于整个空间（原书2.39），$U = RR^3$。

	#tab 综上所述，$RR^3$ 的子空间恰有 ${0}$，$RR^3$ 中所有过原点的直线，$RR^3$ 中所有过原点的平面，以及 $RR^3$ 本身。
]

#exercise_sol(type: "answer")[
	+ 令 $U = {p in Poly_4(FF) : p(6) = 0}$，求 $U$ 的一组基；
	+ 将 (a) 中的基扩充为 $Poly_4(FF)$ 的基；
	+ 求 $Poly_4(FF)$ 的一个子空间 $W$，使得 $Poly_4(FF) = U plus.circle W$。
][
	对于 (a)，我们的思路是，考虑到 $p(6) = 0$ 意味着任意 $p in U$ 都可以表示为 $p(z) = (z - 6)q(z)$，其中 $q in Poly_3(FF)$。因此，我们很容易猜测 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3$#footnote[将这些表达式看作关于 $z$ 的函数，即这里表示的是 $z |-> dots.c$，下同。]是 $U$ 的一组基。

	#tab 为了说明这一点，我们首先证明 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3$ 是线性无关的。设 $a, b, c, d in FF$，满足对于任意 $z in FF$，

	$ a(z - 6) + b(z^2 - 6z) + c(z^3 - 6z^2) + d(z^4 - 6z^3) = 0 $

	#tab 整理得到

	$ -6a + (a - 6b)z + (b - 6c)z^2 + (c - 6d)z^3 + d z^4 = 0 $

	#tab 根据多项式系数的唯一性，我们有

	$ cases(
		-6a = 0,
		a - 6b = 0,
		b - 6c = 0,
		c - 6d = 0,
		d = 0
	) $

	#tab 由此可得 $a = b = c = d = 0$，因此 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3$ 是线性无关的。

	#tab 根据子空间的维数的性质，我们知道 $dim U <= dim Poly_4(FF) = 5$。注意到 $z |-> z in.not U$，故 $U != Poly_4(FF)$，于是 $dim U <= 4$。另一方面，将 $U$ 的一组基看作张成组，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到 $dim U >= 4$。于是只能有 $dim U = 4$。

	#tab 代入 $z=6$，立即可以验证 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3 in U$，根据长度恰当的线性无关组是基（原书2.38），我们得出 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3$ 是 $U$ 的一组基。

	#tab 对于 (b)，注意到 $1 in.not U$，根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，可得向量组 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3, 1$ 是线性无关的，进一步地，向量组 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3, 1$ 是长度恰当（$dim Poly_4(FF) = 5$）的线性无关组，因此它是 $Poly_4(FF)$ 的一组基。

	#tab 对于 (c)，我们可以取 $W = span(1)$。由 (b) 可知 $Poly_4(FF) = U + W$，根据子空间之和的维数（原书2.43），我们有

	$ dim Poly_4(FF) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim (U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $Poly_4(FF) = U plus.circle W$。
]

#exercise_sol(type: "answer")[
	+ 令 $U = {p in Poly_4(FF) : p''(6) = 0}$，求 $U$ 的一组基；
	+ 将 (a) 中的基扩充为 $Poly_4(FF)$ 的基；
	+ 求 $Poly_4(FF)$ 的一个子空间 $W$，使得 $Poly_4(FF) = U plus.circle W$。
][
	#tab 对于 (a)，向量组 $1, z, z^3 - 18z^2, z^4 - 216z^2$ 是 $U$ 的一组基。为了说明这一点，我们首先证明 $1, z, z^3 - 18z^2, z^4 - 216z^2$ 是线性无关的。设 $a, b, c, d in FF$，满足对于任意 $z in FF$，

	$ a + b z + c(z^3 - 18z^2) + d(z^4 - 216z^2) = 0 $

	#tab 整理得到

	$ a + b z + (-18c - 216d)z^2 + c z^3 + d z^4 = 0 $

	#tab 根据多项式系数的唯一性，我们有

	$ cases(
		a = 0,
		b = 0,
		-18c - 216d = 0,
		c = 0,
		d = 0
	) $

	#tab 由此可得 $a = b = c = d = 0$，因此 $1, z, z^3 - 18z^2, z^4 - 216z^2$ 是线性无关的。

	#tab 根据子空间的维数的性质，我们知道 $dim U <= dim Poly_4(FF) = 5$。注意到 $z |-> z^2 in.not U$，故 $U != Poly_4(FF)$，于是 $dim U <= 4$。另一方面，将 $U$ 的一组基看作张成组，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到 $dim U >= 4$。于是只能有 $dim U = 4$。

	#tab 分别求二阶导，再代入 $z = 6$，可以验证 $1, z, z^3 - 18z^2, z^4 - 216z^2 in U$，根据长度恰当的线性无关组是基（原书2.38），我们得出 $1, z, z^3 - 18z^2, z^4 - 216z^2$ 是 $U$ 的一组基。

	#tab 对于 (b)，注意到 $z^2 in.not U$，根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，可得向量组 $1, z, z^3 - 18z^2, z^4 - 216z^2, z^2$ 是线性无关的，进一步地，向量组 $1, z, z^3 - 18z^2, z^4 - 216z^2, z^2$ 是长度恰当（$dim Poly_4(FF) = 5$）的线性无关组，因此它是 $Poly_4(FF)$ 的一组基。

	#tab 对于 (c)，我们可以取 $W = span(z^2)$。由 (b) 可知 $Poly_4(FF) = U + W$，
	根据子空间之和的维数（原书2.43），我们有

	$ dim Poly_4(FF) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim (U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $Poly_4(FF) = U plus.circle W$。
]

#exercise_sol(type: "answer", ref: <E-p2-eq-p5-poly4>)[
	+ 令 $U = {p in Poly_4(FF) : p(2) = p(5)}$，求 $U$ 的一组基；
	+ 将 (a) 中的基扩充为 $Poly_4(FF)$ 的基；
	+ 求 $Poly_4(FF)$ 的一个子空间 $W$，使得 $Poly_4(FF) = U plus.circle W$。
][
	#tab 对于 (a)，向量组 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z$ 是 $U$ 的一组基。为了说明这一点，我们首先证明 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z$ 是线性无关的。设 $a, b, c, d in FF$，满足对于任意 $z in FF$，

	$ a + b(z^2 - 7z) + c(z^3 - 39 z) + d(z^4 - 203 z) = 0 $

	#tab 整理得到

	$ a + (-7b - 39c - 203d)z + b z^2 + c z^3 + d z^4 = 0 $

	#tab 根据多项式系数的唯一性，我们有

	$ cases(
		a = 0,
		-7b - 39c - 203d = 0,
		b = 0,
		c = 0,
		d = 0
	) $

	#tab 由此可得 $a = b = c = d = 0$，因此 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z$ 是线性无关的。

	#tab 根据子空间的维数的性质，我们知道 $dim U <= dim Poly_4(FF) = 5$。注意到 $z |-> z in.not U$，故 $U != Poly_4(FF)$，于是 $dim U <= 4$。另一方面，将 $U$ 的一组基看作张成组，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到 $dim U >= 4$。于是只能有 $dim U = 4$。

	#tab 分别代入 $z = 2$ 和 $z = 5$，可以验证 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z in U$，根据长度恰当的线性无关组是基（原书2.38），我们得出 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z$ 是 $U$ 的一组基。

	#tab 对于 (b)，注意到 $z in.not U$，根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，可得向量组 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z, z$ 是线性无关的，进一步地，向量组 $1, z^2 - 7z, z^3 - 39 z, z^4 - 203 z, z$ 是长度恰当（$dim Poly_4(FF) = 5$）的线性无关组，因此它是 $Poly_4(FF)$ 的一组基。

	#tab 对于 (c)，我们可以取 $W = span(z)$。由 (b) 可知 $Poly_4(FF) = U + W$，根据子空间之和的维数（原书2.43），我们有

	$ dim Poly_4(FF) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim (U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $Poly_4(FF) = U plus.circle W$。
]

#exercise_sol(type: "answer")[
	+ 令 $U = {p in Poly_4(FF) : p(2) = p(5) = p(6)}$，求 $U$ 的一组基；
	+ 将 (a) 中的基扩充为 $Poly_4(FF)$ 的基；
	+ 求 $Poly_4(FF)$ 的一个子空间 $W$，使得 $Poly_4(FF) = U plus.circle W$。
][
	对于 (a)，向量组 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z$ 是 $U$ 的一组基。为了说明这一点，我们首先证明 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z$ 是线性无关的。设 $a, b, c in FF$，满足对于任意 $z in FF$，

	$ a + b(z^3 - 13 z^2 + 52z) + c(z^4 - 117 z^2 + 616z) = 0 $

	#tab 整理得到

	$ a + (52b + 616c)z + (-13b - 117c)z^2 + b z^3 + c z^4 = 0 $

	#tab 根据多项式系数的唯一性，我们有

	$ cases(
		a = 0,
		52b + 616c = 0,
		-13b - 117c = 0,
		b = 0,
		c = 0
	) $

	#tab 由此可得 $a = b = c = 0$，因此 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z$ 是线性无关的。

	#tab 设 $U_0$ 表示@E-p2-eq-p5-poly4 中的子空间 $U$。根据子空间的维数的性质，我们知道 $dim U <= dim U_0 = 4$。注意到 $(z - 2)(z - 5) in U_0$ 但是 $(z - 2)(z - 5) in.not U$，故 $U != U_0$，于是 $dim U <= 3$。另一方面，将 $U$ 的一组基看作张成组，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到 $dim U >= 3$。于是只能有 $dim U = 3$。

	#tab 分别代入 $z = 2$、$z = 5$ 和 $z = 6$，可以验证 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z in U$，根据长度恰当的线性无关组是基（原书2.38），我们得出 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z$ 是 $U$ 的一组基。

	#tab 对于 (b)，注意到 $(z - 2)(z - 5) in.not U$，根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，可得向量组 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z, (z - 2)(z - 5)$ 是线性无关的。进一步地，注意到该向量组中的多项式均满足在 $z = 2$ 处的取值与在 $z = 5$ 处的取值相等，故

	$ z^2 in.not span(1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z, (z - 2)(z - 5)) $

	#tab 所以，向量组 $1, z^3 - 13 z^2 + 52z, z^4 - 117 z^2 + 616z, (z - 2)(z - 5), z^2$ 是线性无关的，作为长度恰当（$dim Poly_4(FF) = 5$）的线性无关组，它是 $Poly_4(FF)$ 的一组基。

	#tab 对于 (c)，我们可以取 $W = span((z - 2)(z - 5), z^2)$。由 (b) 可知 $Poly_4(FF) = U + W$，根据子空间之和的维数（原书2.43），我们有

	$ dim Poly_4(FF) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim (U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $Poly_4(FF) = U plus.circle W$。
]

#exercise_sol(type: "answer")[
	+ 令 $U = {p in Poly_4(FF) : integral_(-1)^1 p = 0}$，求 $U$ 的一组基；
	+ 将 (a) 中的基扩充为 $Poly_4(FF)$ 的基；
	+ 求 $Poly_4(FF)$ 的一个子空间 $W$，使得 $Poly_4(FF) = U plus.circle W$。
][
	我们的思路是，考虑到

	#show: math_numbering(true)
	$ integral_(-1)^1 a_0 + a_1 z + a_2 z^2 + a_3 z^3 + a_4 z^4 dif z = 2 a_0 + 2/3 a_2 + 2/5 a_4 $ <2C-F-intt-poly4--1-to-1>
	#show: math_numbering(false)

	#tab 我们很容易猜测 $z, 3 z^2 - 1, z^3, 5z^4 - 1$ 是 $U$ 的一组基。为了严格说明这一点，我们首先证明 $z, 3 z^2 - 1, z^3, 5z^4 - 1$ 是线性无关的。设 $a, b, c, d in FF$，满足对于任意 $z in FF$，

	$ a z + b(3 z^2 - 1) + c z^3 + d(5z^4 - 1) = 0 $

	#tab 整理得到

	$ (-b - d) + a z + (3b)z^2 + c z^3 + (5d)z^4 = 0 $

	#tab 根据多项式系数的唯一性，我们有

	$ cases(
		-b - d = 0,
		a = 0,
		3b = 0,
		c = 0,
		5d = 0
	) $

	#tab 由此可得 $a = b = c = d = 0$，因此 $z, 3 z^2 - 1, z^3, 5z^4 - 1$ 是线性无关的。

	#tab 根据子空间的维数的性质，我们知道 $dim U <= dim Poly_4(FF) = 5$。注意到 $z |-> 1 in.not U$，故 $U != Poly_4(FF)$，于是 $dim U <= 4$。另一方面，将 $U$ 的一组基看作张成组，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到 $dim U >= 4$。于是只能有 $dim U = 4$。

	#tab 将系数代入@2C-F-intt-poly4--1-to-1 的积分结果，发现 $z, 3 z^2 - 1, z^3, 5z^4 - 1 in U$，根据长度恰当的线性无关组是基（原书2.38），我们得出 $z, 3 z^2 - 1, z^3, 5z^4 - 1$ 是 $U$ 的一组基。

	#tab 对于 (b)，注意到 $1 in.not U$，根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，可得向量组 $z, 3 z^2 - 1, z^3, 5z^4 - 1, 1$ 是线性无关的，进一步地，向量组 $z, 3 z^2 - 1, z^3, 5z^4 - 1, 1$ 是长度恰当（$dim Poly_4(FF) = 5$）的线性无关组，因此它是 $Poly_4(FF)$ 的一组基。

	#tab 对于 (c)，我们可以取 $W = span(1)$。由 (b) 可知 $Poly_4(FF) = U + W$，根据子空间之和的维数（原书2.43），我们有

	$ dim Poly_4(FF) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim (U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $Poly_4(FF) = U plus.circle W$。
]

#exercise_sol(type: "proof", label: "tricky")[
	设向量组 $v_1, dots, v_m$ 在 $V$ 中线性无关，$w in V$，证明

	$ dim span(v_1 + w, dots, v_m + w) >= m - 1 $
][
	$m = 1$ 的情况是平凡的。对于 $m >= 2$，我们注意到以下事实：

	- $-v_1 in.not span(v_2, dots, v_m)$；
	- $v_2, dots, v_m$ 线性无关。

	#tab 根据#exercise_ref(<E-when-shared-vec-add-become-dep>) 的逆否命题，我们得到 $v_2 - v_1, dots, v_m - v_1$ 是线性无关的。另一方面，注意到，对于任意 $k in {2, dots, m}$

	$ v_k - v_1 = (v_k + w) - (v_1 + w) in span(v_1 + w, dots, v_m + w) $

	#tab 综上所述，$v_2 - v_1, dots, v_m - v_1$ 是 $span(v_1 + w, dots, v_m + w)$ 上的一个线性无关组，因此，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到结论 $dim span(v_1 + w, dots, v_m + w) >= m - 1$。
]

#note[可以验证，上面结论等号成立，当且仅当存在 $i,j in {1, dots, m}$（$i != j$），使得 $w = lambda v_i + mu v_j$，其中 $lambda, mu in FF$，满足 $lambda + mu = -1$。]

#exercise_sol(type: "proof")[
	设 $m$ 是正整数，$p_0, dots, p_m in Poly(FF)$，其中 $p_k$ 的次数为 $k$，证明： $p_0, dots, p_m$ 是 $Poly_m (FF)$ 的基。
][
	我们首先论证：对于任意自然数 $m$，$p_0, dots, p_m$ 是线性无关的。我们关于 $m$ 使用数学归纳法。

	/ 第 $0$ 步: \
		当 $m = 0$ 时，根据#exercise_ref(<E-when-1-or-2-vectors-indep>)，向量组 $p_0$ 是线性无关的。

	/ 第 $k$ 步: \
		假设向量组 $p_0, dots, p_(k - 1)$ 是线性无关的。根据多项式系数的唯一性，$k$ 次多项式 $p_k in.not span(p_0, dots, p_(k-1))$，于是根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，向量组 $p_0, dots, p_k$ 是线性无关的。

	#tab 综上所述，对于任意自然数 $m$，向量组 $p_0, dots, p_m$ 是线性无关的。注意到对于任意正整数 $m$，$Poly_m (FF) = m + 1$，根据长度恰当的线性无关组是基（原书2.38），$p_0, dots, p_m$ 是 $Poly_m (FF)$ 的基。
]

#exercise_sol(type: "proof")[
	设 $m$ 是正整数，对于 $k in {0, dots, m}$，令

	$ p_k:& FF -> FF \ &z |-> z^k (1 - z)^(m - k) $

	证明：$p_0, dots, p_m$ 是 $Poly_m (FF)$ 的基。

	#note[这道习题中的基能够引出所谓*伯恩斯坦多项式（Bernstein polynomials）*。你可以上网搜索，了解伯恩斯坦多项式如何用于逼近 $[0, 1]$ 上的连续函数。]
][
	注意到，根据二项式定理，对于任意 $j in {0, dots, m}$，

	$ z^j = sum_(k = j)^(m) binom(m - j, k - j) z^k (1 - z)^(m - k) $

	#tab 即 $1, z, dots, z^m$ 均可用 $p_0, dots, p_m$ 的线性组合表示，于是 $p_0, dots, p_k$ 张成 $Poly_m (FF)$。

	#tab 注意到 $dim Poly_m (FF) = m + 1$，根据恰当长度的张成组是基（原书2.42），$p_0, dots, p_m$ 是 $Poly_m (FF)$ 的基。
]

#exercise_sol(type: "proof")[
	设 $U$ 和 $W$ 都是 $CC^6$ 的四维子空间，证明：在 $U inter W$ 中存在两个向量，其中任意一个都不是另一个的标量倍。
][
	根据子空间之和的维数（原书2.43），我们有

	$ dim(U + W) = dim U + dim W - dim(U inter W) $

	#tab 另一方面，根据子空间的维数性质（原书2.37），$dim(U + W) <= dim CC^6 = 6$。因此，

	$ dim(U inter W) >= 2 $

	#tab 设 $u_1, dots, u_m$ 是 $U inter W$ 的一组基，其中 $m >= 2$。则 $u_1, u_2$ 是线性无关的。根据#exercise_ref(<E-when-1-or-2-vectors-indep>), $u_1, u_2$ 中任意一个都不是另一个的标量倍。由此得证。
]

#exercise_sol(type: "proof")[
	设 $U$ 和 $W$ 都是 $RR^8$ 的子空间，$dim U = 3$，$dim W = 5$，且 $U + W = RR^8$，证明：$RR^8 = U plus.circle W$。
][
	根据子空间之和的维数（原书2.43），我们有

	$ dim(U + W) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim(U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $RR^8 = U plus.circle W$。
]

#exercise_sol(type: "proof")[
	设 $U$ 和 $W$ 都是 $RR^9$ 的五维子空间，证明：$U inter W != {0}$。
][
	根据子空间之和的维数（原书2.43），我们有

	$ dim(U + W) = dim U + dim W - dim(U inter W) $

	#tab 另一方面，根据子空间的维数性质（原书2.37），$dim(U + W) <= dim RR^9 = 9$。因此，

	$ dim(U inter W) >= 1 $

	#tab 由此得证 $U inter W != {0}$。
]

#exercise_sol(type: "proof")[
	设 $V$ 是 $10$ 维向量空间，$V_1, V_2, V_3$ 都是 $V$ 的子空间，$dim V_1 = dim V_2 = dim V_3 = 7$，证明：$V_1 inter V_2 inter V_3 != {0}$。
][
	根据子空间之和的维数（原书2.43），我们有

	$ dim(V_1 + V_2) &= dim V_1 + dim V_2 - dim(V_1 inter V_2) \
		dim((V_1 + V_2) + V_3) &= dim(V_1 + V_2) + dim V_3 - dim((V_1 + V_2) inter V_3) $

	#tab 上下两式相加，化简得

	$ dim(V_1 + V_2 + V_3) =& dim V_1 + dim V_2 + dim V_3 \
		&- dim(V_1 inter V_2) - dim((V_1 + V_2) inter V_3) $

	#tab 另一方面，根据子空间的维数性质（原书2.37），$dim(V_1 + V_2 + V_3) <= dim V = 10$。同时，考虑到 $(V_1 + V_2) inter V_3 subset.eq V_3$，我们有 $dim((V_1 + V_2) inter V_3) <= dim V_3 = 7$，因此

	$ dim(V_1 inter V_2) >= 4 $

	#tab 同时

	$ dim((V_1 inter V_2) + V_3) = dim(V_1 inter V_2) + dim V_3 - dim(V_1 inter V_2 inter V_3) $

	#tab 结合 $dim((V_1 inter V_2) + V_3) <= dim V = 10$，于是

	$ 4 <= dim(V_1 inter V_2) <= 3 + dim(V_1 inter V_2 inter V_3) $

	#tab 所以 $dim(V_1 inter V_2 inter V_3) >= 1$，由此得证 $V_1 inter V_2 inter V_3 != {0}$。
]

#exercise_sol(type: "proof", label: "tricky")[
	设 $V$ 是有限维向量空间，$V_1, V_2, V_3$ 都是 $V$ 的子空间，$dim V_1 + dim V_2 + dim V_3 > 2 dim V$，证明：$V_1 inter V_2 inter V_3 != {0}$。
][
	根据子空间之和的维数（原书2.43），我们有

	$ dim((V_1 inter V_2) + V_3) &= dim(V_1 inter V_2) + dim V_3 - dim(V_1 inter V_2 inter V_3) \
		dim(V_1 + V_2) &= dim V_1 + dim V_2 - dim (V_1 inter V_2) $

	#tab 两式向加，移项得

	$ dim((V_1 inter V_2) + V_3) &=&& dim V_1 + dim V_2 + dim V_3 \
		&&&- dim(V_1 + V_2) - dim(V_1 inter V_2 inter V_3) \
		&>&& 2 dim V -  dim(V_1 + V_2) - dim(V_1 inter V_2 inter V_3) $

	#tab 另一方面，根据子空间的维数性质（原书2.37），$dim((V_1 inter V_2) + V_3) <= dim V$，以及 $dim (V_1 + V_2) <= dim V$，因此

	$ dim(V_1 inter V_2 inter V_3) > 0 $

	#tab 由此得证 $V_1 inter V_2 inter V_3 != {0}$。
]

#exercise_sol(type: "proof")[
	设 $V$ 是有限维向量空间，$U$ 是 $V$ 的子空间（$U != V$）。令 $n = dim V$，$m = dim U$，证明：$V$ 中存在这样 $n - m$ 个子空间，其中每个子空间的维数都是 $n-1$，且它们的交集是 $U$。
][
	设 $u_1, dots, u_m$ 是 $U$ 的一组基，将其看作 $V$ 中的线性无关组，根据每个线性无关组都可被扩充为基（原书2.32），我们可以将 $u_1, dots, u_m$ 扩充为 $V$ 的一组基 $u_1, dots, u_n$。现在，对于 $k in {1, dots, n - m}$ 和 $j in {1, dots, n - 1}$，令

	$ W_k = span(u_1, dots, u_(m + k - 1), u_(m + k + 1), dots, u_n) $

	#tab 即 $W_k$ 是向量组 $u_1, dots, u_m$ 中去掉第 $m + k$ 个向量后得到的向量组所张成的子空间。注意到 $dim W_k = n - 1$，因此 $W_1, dots, W_(n - m)$ 是 $V$ 的 $n - m$ 个维数为 $n - 1$ 的子空间。同时，注意到 $U = span(u_1, dots, u_m) subset.eq W_k$，因此

	$ U subset.eq W_1 inter dots.c inter W_(n - m) $

	#tab 另一方面，我们说明 $W_1 inter dots.c inter W_(n - m) subset.eq U$。当 $n - m = 1$ 时，情况时平凡的。设 $v in W_1 inter dots.c inter W_(n - m)$，则对于 $k in {1, dots, n - m}$ 和 $i in {1, dots, n}$，存在 $a_(k, i)$，使得对于任意 $k in {1, dots, n - m}$，有

	$ v = a_(k, 1) u_1 + dots.c + a_(k, n) u_n $

	#tab 且 $a_(k, m + k) = 0$。现在，对于任意 $j in {2, dots, n - m}$，我们将 $v$ 在 $W_1$ 和 $W_q$ 中线性组合的表达式相减，得到

	$ 0 = (a_(1, 1) - a_(j, 1)) u_1 + dots.c + (a_(1, n) - a_(j, n)) u_n $

	#tab 由于 $u_1, dots, u_n$ 是线性无关的，因此，对于任意 $i in {1, dots, n}$，$a_(1, i) = a_(j, i)$。特别注意到，$a_(1, m + j) = a_(j, m + j) = 0$，考虑到 $a_(1, m + 1) = 0$，以及 $j in {2, dots, n - m}$ 选取的任意性，我们得到，对于任意 $j in {1, dots, n - m}$，$a_(1, m + j) = 0$，即

	$ v = a_(1, 1) u_1 + dots.c + a_(1, m) u_m in U $

	#tab 这表明 $W_1 inter dots.c inter W_(n - m) subset.eq U$。

	#tab 综上所述 $U = W_1 inter dots.c inter W_(n - m)$。也就是说，$W_1, dots, W_(n - m)$ 就是所求的 $n - m$ 个子空间。
]
