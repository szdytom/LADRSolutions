#import "../styles.typ": exercise_sol, tab, note, exercise_ref
#import "../math.typ": Poly, span, complexification, ii

#exercise_sol(type: "answer")[
	求出所有恰好有一个基的向量空间。
][
	${0}$ 是唯一满足要求的向量空间，它的基是空集。对于任何其他向量空间 $V$，不妨设其的一个基为 $v_1, dots, v_m$，则由基的判定准则（原书定理2.28）可知，$V$ 中的任意向量都 $v$ 都可以唯一地表示为

	$ v = a_1 v_1 + dots.c + a_m v_m $

	#tab 其中 $a_1, dots, a_m in FF$。现在取向量组 $2v_1, dots, 2v_m$，则 $v$，可以被表示为

	$ v = b_1 (2v_1) + dots.c + b_m (2v_m) $

	#tab 则对于 $k in {1, dots, m}$，$a_k = 2b_k$。这只有唯一的解，即 $b_k = a_k slash 2$，因此 $v$ 可以唯一地被向量组 $2v_1, dots, 2v_m$ 的线性组合表示，这表明向量组 $2v_1, dots, 2v_m$ 也是 $V$ 的一个基。由此可知，$V$ 中的任意向量都可以被表示为两个不同的基的线性组合，因此 $V$ 不可能只有一个基。

	#tab 综上所述，只有 ${0}$ 满足题目要求。
]

#exercise_sol(type: "proof")[
	验证下面这些的结论。

	+ 向量组 $(1, 0, dots, 0), (0, 1, 0, dots, 0), dots, (0, dots, 0, 1)$ 是 $FF^n$ 的基；
	+ 向量组 $(1, 2), (3, 5)$ 是 $FF^2$ 的基；
	+ 向量组 $(1, 2, -4), (7, -5, 6)$ 在 $FF^3$ 中是线性无关的，但不是 $FF^3$ 的基，因为它不张成 $FF^3$；
	+ 向量组 $(1, 2), (3, 5), (4, 13)$ 张成 $FF^2$，但不是 $FF^2$ 的基，因为它们是线性相关的；
	+ 向量组 $(1, 1, 0), (0, 0, 1)$ 是 ${(x, x, y) in FF^3 : x,y in FF}$ 的基；
	+ 向量组 $(1, -1, 0), (1, 0, -1)$ 是 ${(x, y, z) in FF^3 : x + y + z = 0}$ 的基；
	+ 向量组 $1, z, dots, z^m$ 是 $Poly_m (FF)$ 的基。

	#note(supplement: "说明")[本题原文为“验证例2.27中的所有结论”。出于完整性考虑，这里将原书例2.27的所有结论摘录在上面。]
][
	对于 (a)，记这些向量为 $v_1, dots, v_n$，设 $a_1, dots, a_n in FF$，使得

	$ a_1 v_1 + dots.c + a_n v_n = 0 $

	#tab 这立即给出 $a_1 = dots.c = a_n = 0$，根据线性无关的定义（原书定义2.15），可知向量组 $v_1, dots, v_n$ 是线性无关的。设 $v = (x_1, dots, x_n) in FF^n$，则

	$ v = x_1 v_1 + dots.c + x_n v_n $

	#tab 因此，$v_1, dots, v_n$ 张成 $FF^n$。根据基的定义（原书定义2.26），可知向量组 $v_1, dots, v_n$ 是 $FF^n$ 的基。

	#tab 对于 (b)，设 $a_1, a_2 in FF$，$v = (x_1, x_2) in FF^2$，满足

	$ v = a_1 (1, 2) + a_2 (3, 5) $

	#tab 求解 $a_1, a_2$，得到唯一的一组解是

	$ cases(
		a_1 = -5 x_1 + 3 x_2,
		a_2 = 2 x_1 - x_2
	) $

	#tab 这表明 $FF^2$ 中的每个向量都可以唯一地被表示为向量组 $(1, 2), (3, 5)$ 的线性组合。所以，根据基的判定准则（原书定理2.28），向量组 $(1, 2), (3, 5)$ 是 $FF^2$ 的基。

	#tab 对于 (c)，设 $a_1, a_2 in FF$，满足

	$ a_1 (1, 2, -4) + a_2 (7, -5, 6) = 0 $

	#tab 这给出 $a_1 = a_2 = 0$，因此向量组 $(1, 2, -4), (7, -5, 6)$ 是线性无关的。反证假设向量组 $(1, 2, -4), (7, -5, 6)$ 张成 $FF^3$，则存在 $a_1, a_2 in FF$，使得

	$ (1, 2, 0) = a_1 (1, 2, -4) + a_2 (7, -5, 6) $

	#tab 然而，该方程组无解。因此，向量组 $(1, 2, -4), (7, -5, 6)$ 不张成 $FF^3$，所以它们不是 $FF^3$ 的基。

	#tab 对于 (d)，由 (b) 可知，向量组 $(1, 2), (3, 5)$ 张成 $FF^2$，所以向量组 $(1, 2), (3, 5), (4, 13)$ 也张成 $FF^2$。然而，注意到

	$ (-19)(1, 2) + 5(3, 5) + 1(4, 13) = 0 $

	#tab 所以，向量组 $(1, 2), (3, 5), (4, 13)$ 不是线性无关的，因此它们不是 $FF^2$ 的基。

	#tab 对于 (e)，设 $a_1, a_2 in FF$，$v = (x, x, y) in FF^3$，满足

	$ v = a_1 (1, 1, 0) + a_2 (0, 0, 1) $

	#tab 求解 $a_1, a_2$，得到唯一的一组解是

	$ cases(
		a_1 = x,
		a_2 = y
	) $

	#tab 这表明 ${(x, x, y) in FF^3 : x,y in FF}$ 中的每个向量都可以唯一地被表示为向量组 $(1, 1, 0), (0, 0, 1)$ 的线性组合。所以，根据基的判定准则，向量组 $(1, 1, 0), (0, 0, 1)$ 是 ${(x, x, y) in FF^3 : x,y in FF}$ 的基。

	#tab 对于 (f)，设 $a_1, a_2 in FF$，$v = (x, y, -x - y) in FF^3$，满足

	$ v = a_1 (1, -1, 0) + a_2 (1, 0, -1) $

	#tab 求解 $a_1, a_2$，得到唯一的一组解是

	$ cases(
		a_1 = -y,
		a_2 = x + y
	) $

	#tab 这表明 ${(x, y, z) in FF^3 : x + y + z = 0}$ 中的每个向量都可以唯一地被表示为向量组 $(1, -1, 0), (1, 0, -1)$ 的线性组合。所以，根据基的判定准则，向量组 $(1, -1, 0), (1, 0, -1)$ 是 ${(x, y, z) in FF^3 : x + y + z = 0}$ 的基。

	#tab 对于 (g)，根据多项式的次数的定义（原书定义2.11），立即可得 $1, z, dots, z^m$ 张成 $Poly_m (FF)$。现在反证假设 $1, z, dots, z^m$ 不是线性无关的。即存在 $a_0, dots, a_m in FF$，其中至少有一个不为 $0$，使得对于任意 $z in FF$，有

	$ a_0 + a_1 z + dots.c + a_m z^m = 0 $

	#tab 现在找到编号最大的不为 $0$ 的系数 $ell$，即 $a_ell != 0$，且 $a_k = 0$ 对于 $ell < k <= m$ 成立。取

	$ z = (abs(a_0) + dots.c + abs(a_(ell - 1))) / abs(a_m) + 1 $

	#tab 注意到 $z >= 1$，于是对 $j in {0, dots, ell - 1}$，有 $z^j <= z^(ell-1)$。使用三角不等式#footnote[见原书定理4.4。一般而言，我们不应该引用后面的定理，因为这将带来循环论证的风险。但是复数的性质这个定理完全独立，因此从逻辑上说，这里引用原书定理4.4是没有问题的。]，我们有

	$ abs(a_0 + a_1 z + dots.c + a_(ell - 1) z^(ell - 1)) <= (abs(a_0) + dots.c + abs(a_(ell - 1)))z^(ell - 1) < abs(a_ell z^ell) $

	#tab 于是 $a_0 + a_1 z + dots.c + a_(ell-1)z^(ell-1) != -a_ell z^ell$，这表明

	$ a_0 + a_1 z + dots.c + a_m z^m != 0 $

	#tab 矛盾，因此 $1, z, dots, z^m$ 是线性无关的。根据基的定义，$1, z, dots, z^m$ 是 $Poly_m (FF)$ 的基。
]

#note[对于 (g)，值得一提的是，上面证明的核心部分表明，多项式的系数是唯一的。这个巧妙的证明来自原书第三版的正文（定理4.7），然而在第四版中被删除了，取而代之的是不那么直接的原书定理4.8。]

#exercise_sol(type: "answer")[
	+ 设 $U$ 为 $RR^5$ 的子空间，定义为#h(1fr) //https://github.com/typst/typst/issues/529
		$ U = {(x_1, x_2, x_3, x_4, x_5) in RR^5 : x_1 = 3x_2 and x_3 = 7x_4} $
		求 $U$ 的一个基；

	+ 将 (a) 中的基扩充为 $RR^5$ 的一个基；

	+ 求 $RR^5$ 的一个子空间 $W$，使得 $RR^5 = U plus.circle W$。
][
	对于 (a)，令

	$ u_1 = (3, 1, 0, 0, 0), quad u_2 = (0, 0, 7, 1, 0), quad u_3 = (0, 0, 0, 0, 1) $

	#tab 下面说明 $u_1, u_2, u_3$ 是 $U$ 的一个基。设 $a_1, a_2, a_3 in RR$，$v = (3x, x, 7y, y, z) in U$，满足

	$ v = a_1 u_1 + a_2 u_2 + a_3 u_3 $

	#tab 求解 $a_1, a_2, a_3$，得到唯一的一组解是

	$ cases(
		a_1 = x,
		a_2 = y,
		a_3 = z
	) $

	#tab 这表明 $U$ 中的每个向量都可以唯一地被表示为向量组 $u_1, u_2, u_3$ 的线性组合。所以，根据基的判定准则（原书定理2.28），向量组 $u_1, u_2, u_3$ 是 $U$ 的基。

	#tab 对于 (b)，令

	$ u_4 = (1, 0, 0, 0, 0), quad u_5 = (0, 0, 1, 0, 0) $

	#tab 下面说明 $u_1, dots, u_5$ 是 $RR^5$ 的一个基。设 $a_1, dots, a_5 in RR$，$v = (x_1, dots, x_5) in RR^5$，满足

	$ v = a_1 u_1 + dots.c + a_5 u_5 $

	#tab 求解 $a_1, dots, a_5$，得到唯一的一组解是

	$ cases(
		a_1 = x_2,
		a_2 = x_4,
		a_3 = x_5,
		a_4 = x_1 - 3 x_2,
		a_5 = x_3 - 7 x_4
	) $

	#tab 这表明 $RR^5$ 中的每个向量都可以唯一地被表示为向量组 $u_1, dots, u_5$ 的线性组合。所以，根据基的判定准则，向量组 $u_1, dots, u_5$ 是 $RR^5$ 的基。

	#tab 对于 (c)，令

	$ w = span(u_4, u_5) $

	#tab 我们首先说明，$RR^5 = U + W$。由于向量组 $u_1, dots, u_5$ 张成 $RR^5$，因此任意向量 $v in RR^5$ 都可以被表示为

	$ v = (a_1 u_1 + a_2 u_2 + a_3 u_3) + (a_4 u_4 + a_5 u_5) $

	#tab 注意到 $a_1 u_1 + a_2 u_2 + a_3 u_3 in U$，且 $a_4 u_4 + a_5 u_5 in W$，故 $RR^5 = U + W$。

	#tab 设 $v in U inter W$。则存在标量 $a_1, dots, a_5$，满足

	$ a_1 u_1 + a_2 u_2 + a_3 u_3 = v = a_4 u_4 + a_5 u_5 $

	#tab 于是

	$ a_1 u_1 + a_2 u_2 + a_3 u_3 - a_4 u_4 - a_5 u_5 = 0 $

	#tab 由于 $u_1, dots, u_5$ 是线性无关的（见上面 (b) 的证明），因此 $a_1 = dots.c = a_5 = 0$。这表明 $v = 0$，因此 $U inter W = {0}$。根据“两个子空间的直和”（原书定理1.46），我们得到 $RR^5 = U plus.circle W$。
]

#exercise_sol(type: "answer")[
	+ 设 $U$ 为 $CC^5$ 的子空间，定义为#h(1fr) //https://github.com/typst/typst/issues/529
		$ U = {(z_1, z_2, z_3, z_4, z_5) in CC^5 : 6z_1 = z_2 and z_3 + 2z_4 + 3z_5 = 0} $
		求 $U$ 的一个基；

	+ 将 (a) 中的基扩充为 $CC^5$ 的一个基；

	+ 求 $CC^5$ 的一个子空间 $W$，使得 $CC^5 = U plus.circle W$。
][
	对于 (a)，令

	$ u_1 = (1, 6, 0, 0, 0), quad u_2 = (0, 0, -2, 1, 0), quad u_3 = (0, 0, -3, 0, 1) $

	#tab 下面说明 $u_1, u_2, u_3$ 是 $U$ 的一个基。设 $a_1, a_2, a_3 in CC$，$v = (x, 6x, y, z, -1/3(y + 2z)) in U$，满足

	$ v = a_1 u_1 + a_2 u_2 + a_3 u_3 $

	#tab 求解 $a_1, a_2, a_3$，得到唯一的一组解是

	$ cases(
		a_1 = x,
		a_2 = z,
		a_3 = -1/3(y + 2z)
	) $

	#tab 这表明 $U$ 中的每个向量都可以唯一地被表示为向量组 $u_1, u_2, u_3$ 的线性组合。所以，根据基的判定准则（原书定理2.28），向量组 $u_1, u_2, u_3$ 是 $U$ 的基。

	#tab 对于 (b)，令

	$ u_4 = (1, 0, 0, 0, 0), quad u_5 = (0, 0, 0, 1, 0) $

	#tab 下面说明 $u_1, dots, u_5$ 是 $CC^5$ 的一个基。设 $a_1, dots, a_5 in CC$，$v = (z_1, dots, z_5) in CC^5$，满足

	$ v = a_1 u_1 + dots.c + a_5 u_5 $

	#tab 求解 $a_1, dots, a_5$，得到唯一的一组解是

	$ cases(
		a_1 = 1/6 z_2,
		a_2 = z_4,
		a_3 = z_5,
		a_4 = z_1 - 1/6 z_2,
		a_5 = z_3 + 2 z_4 + 3 z_5
	) $

	#tab 这表明 $CC^5$ 中的每个向量都可以唯一地被表示为向量组 $u_1, dots, u_6$ 的线性组合。所以，根据基的判定准则，向量组 $u_1, dots, u_6$ 是 $CC^5$ 的基。

	#tab 对于 (c)，令

	$ W = span(u_4, u_5) $

	#tab 我们首先说明，$CC^5 = U + W$。由于向量组 $u_1, dots, u_5$ 张成 $CC^5$，因此任意向量 $v in CC^5$ 都可以被表示为

	$ v = (a_1 u_1 + a_2 u_2 + a_3 u_3) + (a_4 u_4 + a_5 u_5) $

	#tab 注意到 $a_1 u_1 + a_2 u_2 + a_3 u_3 in U$，且 $a_4 u_4 + a_5 u_5 in W$，故 $CC^5 = U + W$。

	#tab 设 $v in U inter W$。则存在标量 $a_1, dots, a_5$，满足

	$ a_1 u_1 + a_2 u_2 + a_3 u_3 = v = a_4 u_4 + a_5 u_5 $

	#tab 于是

	$ a_1 u_1 + a_2 u_2 + a_3 u_3 - a_4 u_4 - a_5 u_5 = 0 $

	#tab 由于 $u_1, dots, u_5$ 是线性无关的（见上面 (b) 的证明），因此 $a_1 = dots.c = a_5 = 0$。这表明 $v = 0$，因此 $U inter W = {0}$。根据“两个子空间的直和”（原书定理1.46），我们得到 $CC^5 = U plus.circle W$。
]

#exercise_sol(type: "proof")[
	设 $V$ 是有限维向量空间，$U, W$ 是 $V$ 的子空间，且 $V = U + W$。证明：$V$ 有一个由 $U union W$ 中的向量组成的基。
][
	设 $u_1, dots, u_m in U$ 是 $U$ 的一组基，$w_1, dots, w_ell in W$ 是 $W$ 的一组基。由于 $V = U + W$，因此任意向量 $v in V$ 都可以被表示为

	$ v = (a_1 u_1 + dots.c + a_m u_m) + (b_1 w_1 + dots.c + b_n w_ell) $

	#tab 其中 $a_1, dots, a_m, b_1, dots, b_ell in FF$。这表明

	$ V = span(u_1, dots, u_m, w_1, dots w_ell) $

	#tab 由于每个张成组都包含基（原书定理2.30），因此 $V$ 有一个由 $U union W$ 中的向量组成的基。
]

#exercise_sol(type: "answer")[
	证明或证伪：如果 $p_0, p_1, p_2, p_3$ 是 $Poly_3(FF)$ 中的向量组，该组中的每个多项式次数都不为 $2$，那么 $p_0, p_1, p_2, p_3$ 不是 $Poly_3(FF)$ 的基。
][
	取 $FF -> FF$ 上的函数 $p_0, dots, p_3$

	$ p_0:& z -> 1 \
		p_1:& z -> z \
		p_2:& z -> z^2 + z^3 \
		p_3:& z -> z^3 $

	#tab 设 $p in Poly_3(FF)$，则根据多项式的次数的定义（原书定义2.11），存在 $a_0, dots, a_3 in FF$，使得对于任意 $z in FF$，有

	$ p(z) = a_0 + a_1 z + a_2 z^2 + a_3 z^3 $

	#tab 于是，

	$ p = a_0 p_0 + a_1 p_1 + a_2 p_2 + (a_3 - a_2) p_3 $

	#tab 这表明 $p$ 可以被表示为向量组 $p_0, p_1, p_2, p_3$ 的线性组合，即 $p_0, p_1, p_2, p_3$ 张成 $Poly_3(FF)$。

	#tab 设 $a_0, a_1, a_2, a_3 in FF$，满足

	$ a_0 p_0 + a_1 p_1 + a_2 p_2 + a_3 p_3 = 0 $

	#tab 即对于任意 $z in FF$，有

	$ a_0 + a_1 z + a_2 z^2 + (a_2 + a_3) z^3 = 0 $

	#tab 根据多项式系数的唯一性，我们有 $a_0 = a_1 = a_2 = a_3 = 0$。这表明向量组 $p_0, p_1, p_2, p_3$ 是线性无关的。

	#tab 综上所述，$p_0, p_1, p_2, p_3$ 是 $Poly_3(FF)$ 的基，故原命题不成立。
]

#exercise_sol(type: "proof")[
	设 $v_1, v_2, v_3, v_4$ 是 $V$ 的基，证明：向量组

	$ v_1 + v_2, v_2 + v_3, v_3 + v_4, v_4 $

	也是 $V$ 的基。
][
	设 $v in V$，注意到

	$ v = a_1 v_1 + a_2 v_2 + a_3 v_3 + a_4 v_4 $

	#tab 其中 $a_1, a_2, a_3, a_4 in FF$。另一方面，设 $b_1, b_2, b_3, b_4 in FF$，满足

	$ v = b_1 (v_1 + v_2) + b_2 (v_2 + v_3) + b_3 (v_3 + v_4) + b_4 v_4 $

	#tab 则

	$ v = (b_1 + b_2) v_1 + (b_2 + b_3) v_2 + (b_3 + b_4) v_3 + b_4 v_4 $

	#tab 由于 $v_1, v_2, v_3, v_4$ 是基，根据基的判定准则（原书定理2.28），$v_1, v_2, v_3, v_4$ 的系数只能对应相等，即

	$ cases(
		a_1 = b_1 + b_2,
		a_2 = b_2 + b_3,
		a_3 = b_3 + b_4,
		a_4 = b_4
	) $

	#tab 求解 $b_1, b_2, b_3, b_4$，得到唯一的一组解是

	$ cases(
		b_1 = a_1 - a_2,
		b_2 = a_2 - a_3,
		b_3 = a_3 - a_4,
		b_4 = a_4
	) $

	#tab 这表明 $v$ 可以唯一地被表示为向量组 $v_1 + v_2, v_2 + v_3, v_3 + v_4, v_4$ 的线性组合。因此，向量组 $v_1 + v_2, v_2 + v_3, v_3 + v_4, v_4$ 是 $V$ 的基。
]

#exercise_sol(type: "answer")[
	证明或证伪：设向量组 $v_1, v_2, v_3, v_4$ 是 $V$ 的基，且子空间 $U$ 满足 $v_1, v_2 in U$，而 $v_3 in.not U$ 和 $v_4 in.not U$，则 $v_1, v_2$ 是 $U$ 的基。
][
	令 $V = RR^4$，且

	$ v_1 = (1, 0, 0, 0), quad v_2 = (0, 1, 0, 0), quad v_3 = (0, 0, 1, 0), quad v_4 = (0, 0, 0, 1) $

	#tab 注意到，集合

	$ U = {(x, y, z, z) in RR^4 : x, y, z in RR} $

	#tab 是 $RR^4$ 的子空间,且满足 $v_1, v_2 in U$，而 $v_3 in.not U$ 和 $v_4 in.not U$。然而，$v_1, v_2$ 不是 $U$ 的基，因为向量 $(0, 0, 1, 1) in U$ 不是 $span(u_1, u_2)$ 中的元素。由此可知，原命题不成立。
]

#exercise_sol(type: "proof")[
	设 $v_1, dots, v_m$ 是 $V$ 上的向量组，对于 $k in {1, dots, m}$，定义

	$ w_k = v_1 + dots.c + v_k $

	证明：向量组 $v_1, dots, v_m$ 是 $V$ 的基，当且仅当向量组 $w_1, dots, w_m$ 是 $V$ 的基。
][
	由#exercise_ref(<E-cumulative-sum-span>) 和#exercise_ref(<E-cumulative-sum-independence>) 得证。
]

#exercise_sol(type: "proof")[
	设 $U$ 和 $W$ 是 $V$ 的子空间，且 $V = U plus.circle W$。又设 $u_1, dots, u_m$ 是 $U$ 的基，$w_1, dots, w_n$ 是 $W$ 的基。证明：向量组

	$ u_1, dots, u_m, w_1, dots, w_n $

	是 $V$ 的基。
][
	设 $v in V$，由于 $V = U plus.circle W$，因此存在唯一的 $u_1, dots, u_m in U$ 和 $w_1, dots, w_n in W$，使得

	$ v = (a_1 u_1 + dots.c + a_m u_m) + (b_1 w_1 + dots.c + b_n w_n) $

	#tab 其中 $a_1, dots, a_m, b_1, dots, b_n in FF$，这表明 $u_1, dots, u_m, w_1, dots w_n$ 张成 $V$。

	#tab 另一方面，设 $a_1, dots, a_m, b_1, dots, b_n in FF$，满足

	$ (a_1 u_1 + dots.c + a_m u_m) + (b_1 w_1 + dots.c + b_n w_n) = 0 $

	#tab 根据直和的条件（原书定理1.45），必须有

	$ a_1 u_1 &+ dots.c + a_m u_m &= 0 \
		b_1 w_1 &+ dots.c + b_n w_n &= 0 $

	#tab 由于 $u_1, dots, u_m$ 是 $U$ 的基，$w_1, dots, w_n$ 是 $W$ 的基，根据基的定义（原书定义2.26），我们有 $a_1 = dots.c = a_m = b_1 = dots.c = b_n = 0$。这表明向量组 $u_1, dots, u_m, w_1, dots, w_n$ 是线性无关的。

	#tab 综上所述，向量组 $u_1, dots, u_m, w_1, dots, w_n$ 是 $V$ 的基。
]

#exercise_sol(type: "proof")[
	设 $V$ 是实向量空间，证明：若 $v_1, dots, v_n$ 是 $V$（视为实向量空间）的基，则 $v_1, dots, v_n$ 也是其复化 $complexification(V)$（视为复向量空间）的基。

	#note[复化 $complexification(V)$ 的定义见#exercise_ref(<E-vector-dspace-complexification>)。]
][
	对于 $u + ii v in complexification(V)$，由于 $v_1, dots, v_n$ 是 $V$ 的基，可以找到 $a_1, dots, a_n in RR$ 和 $b_1, dots, b_n in RR$，使得

	$ u &= a_1 v_1 &+& dots.c + a_n v_n \
		v &= b_1 v_1 &+& dots.c + b_n v_n $

	#tab 于是

	$ u + ii v = (a_1 + ii b_1) v_1 + dots.c + (a_n + ii b_n) v_n $

	#tab 这表明 $v_1, dots, v_n$ 张成 $complexification(V)$。

	#tab 另一方面，设 $a_1 + ii b_1, dots, a_n + ii b_n in CC$，满足

	$ (a_1 + ii b_1) v_1 + dots.c + (a_n + ii b_n) v_n = 0 + ii 0 $

	#tab 根据 $complexification(V)$ 上标量乘法的定义，这相当于

	$ (a_1 v_1 + dots.c + a_n v_n) + ii (b_1 v_1 + dots.c + b_n v_n) = 0 + ii 0 $

	#tab 更进一步，必须有

	$ a_1 v_1 &+ dots.c + a_n v_n &= 0 \
		b_1 v_1 &+ dots.c + b_n v_n &= 0 $

	#tab 由于 $v_1, dots, v_n$ 是 $V$ 的基，根据基的定义（原书定义2.26），我们有 $a_1 = dots.c = a_n = b_1 = dots.c = b_n = 0$。这表明向量组 $v_1, dots, v_n$ 是线性无关的。

	#tab 综上所述，向量组 $v_1, dots, v_n$ 是 $complexification(V)$ 的基。
]
