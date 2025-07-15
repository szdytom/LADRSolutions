#import "../styles.typ": exercise_sol, note, tab, exercise_ref
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

	#tab 为了说明这一点，我们首先证明 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3$ 是线性无关的。设 $a, b, c, d in FF$，满足

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

	#tab 根据子空间的维数的性质，我们知道 $dim U <= dim Poly_4(FF) = 5$。注意到 $z |-> z in.not U$，故 $U != Poly_4(FF)$，于是 $dim U <= 4$。另一方面，将 $U$ 的一组基看作张成组，根据“线性无关组的长度 $<=$ 张成组的长度”（原书2.22），我们得到 $dim U >= 4$。于是只能有 $dim U = 4$。再根据长度恰当的线性无关组是基（原书2.38），我们得出 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3$ 是 $U$ 的一组基。

	#tab 对于 (b)，注意到 $1 in.not U$，根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，可得向量组 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3, 1$ 是线性无关的，进一步地，向量组 $z - 6, z^2 - 6z, z^3 - 6z^2, z^4 - 6z^3, 1$ 是长度恰当（$dim Poly_4(FF) = 5$）的线性无关组，因此它是 $Poly_4(FF)$ 的一组基。

	#tab 对于 (c)，我们可以取 $W = span(1)$。由 (b) 可知 $Poly_4(FF) = U + W$，根据子空间之和的维数（原书2.43），我们有

	$ dim Poly_4(FF) = dim U + dim W - dim(U inter W) $

	#tab 解得 $dim (U inter W) = 0$，即 $U inter W = {0}$。根据“两个子空间的直和”（原书1.46），得到 $Poly_4(FF) = U plus.circle W$。
]
