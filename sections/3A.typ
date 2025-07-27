#import "../styles.typ": exercise_sol, note, tab
#import "../math.typ": Poly, LinearMap

#exercise_sol(type: "proof")[
	设 $b, c in RR$。定义

	$ T:& RR^3 -> RR^2 \ &(x, y, z) |-> (2x - 4y + 3z + b, 6x + c x y z) $

	证明：$T$ 是线性映射，当且仅当，$b = c = 0$。
][
	首先，假设 $b = c = 0$。则 $T(x, y, z) = (2x - 4y + 3z, 6 x)$，我们逐条验证线性映射的定义（原书3.1）中的要求：

	/ 可加性: 对任意 $u, v in RR^3$，$T(u + v) = T u + T v$。 \
		证明：设 $u = (u_1, u_2, u_3)$，$v = (v_1, v_2, v_3)$，则
		$ T(u + v) &= T(u_1 + v_1, u_2 + v_2, u_3 + v_3) \
			&= (2(u_1 + v_1) - 4(u_2 + v_2) + 3(u_3 + v_3), 6(u_1 + v_1)) \
			&= (2u_1 - 4u_2 + 3u_3, 6u_1) + (2v_1 - 4v_2 + 3v_3, 6v_1) \
			&= T u + T v $

	/ 齐次性: 对任意 $u in RR^3$ 和任意 $lambda in RR$，$T(lambda u) = lambda T u$。 \
		证明：设 $u = (u_1, u_2, u_3)$，则
		$ T(lambda u) &= T(lambda u_1, lambda u_2, lambda u_3) \
			&= (2(lambda u_1) - 4(lambda u_2) + 3(lambda u_3), 6(lambda u_1)) \
			&= lambda (2u_1 - 4u_2 + 3u_3, 6u_1) \
			&= lambda T u $

	#tab 综上，$T$ 满足线性映射的定义。

	#tab 另一方面，假设 $T$ 是线性映射。则根据线性映射将 $0$ 映射到 $0$（原书3.10），有

	$ T(0, 0, 0) &= (2 dot 0 - 4 dot 0 + 3 dot 0 + b, 6 dot 0 + c dot 0) \
		&= (b, 0) = (0, 0) $

	#tab 因此 $b = 0$。另一方面，设 $u = (1, 1, 1)$，则根据齐次性的要求，有

	$ T(2u) = (2, 12 + 8c) = (2, 12 + 2c) = 2 T(u) $

	#tab 于是，$c = 0$。

	#tab 综上所述，$T$ 是线性映射，当且仅当 $b = c = 0$。
]

#exercise_sol(type: "proof")[
	设 $b, c in RR$。定义

	$ T:& Poly(RR) -> RR^2 \ &p |-> vec(3p(4) + 5p'(6) + b p(1)p(2), integral_(-1)^2 x^3 p(x) dif x + c sin p(0)) $

	证明：$T$ 是线性映射，当且仅当，$b = c = 0$。
][
	首先，假设 $b = c = 0$。则 $T(p) = (3p(4) + 5p'(6), integral_(-1)^2 x^3 p(x) dif x)$，我们逐条验证线性映射的定义（原书3.1）中的要求：

	/ 可加性: 对任意 $p, q in Poly(RR)$，$T(p + q) = T p + T q$。 \
		证明：设 $p, q in Poly(RR)$，则
		$ T(p + q) &= (3(p + q)(4) + 5(p + q)'(6), integral_(-1)^2 x^3 (p + q)(x) dif x) \
			&= (3p(4) + 3q(4) + 5p'(6) + 5q'(6), integral_(-1)^2 x^3 p(x) dif x + integral_(-1)^2 x^3 q(x) dif x) \
			&= (3p(4) + 5p'(6), integral_(-1)^2 x^3 p(x) dif x) + (3q(4) + 5q'(6), integral_(-1)^2 x^3 q(x) dif x) \
			&= T p + T q $

	/ 齐次性: 对任意 $p in Poly(RR)$ 和任意 $lambda in RR$，$T(lambda p) = lambda T p$。 \
		证明：设 $p in Poly(RR)$，则
		$ T(lambda p) &= (3(lambda p)(4) + 5(lambda p)'(6), integral_(-1)^2 x^3 (lambda p)(x) dif x) \
			&= (lambda (3p(4)) + lambda (5p'(6)), lambda integral_(-1)^2 x^3 p(x) dif x) \
			&= lambda (3p(4), integral_(-1)^2 x^3 p(x) dif x) \
			&= lambda T p $

	#tab 综上，$T$ 满足线性映射的定义。

	#tab 另一方面，假设 $T$ 是线性映射。设 $p: x |-> x + 1$。则根据齐次性的要求，有

	$ T(2p) = (40 + 24b, 207 / 10 + c sin 2) = (40 + 12b, 207 / 10 + 2c sin 1) = 2 T(p) $

	#tab 解得 $b = c = 0$。这就是说 $T$ 是线性映射，当且仅当 $b = c = 0$。
]

#exercise_sol(type: "proof")[
	设 $T in LinearMap(FF^n, FF^m)$。证明：对于 $j in {1, dots, m}$ 和 $k in {1, dots, n}$，存在标量 $A_(j, k) in FF$，使得对于任意 $(x_1, dots, x_n) in FF^n$，

	$ T(x_1, dots, x_n) = (A_(1, 1)x_1 + dots.c + A_(1, n) x_n, dots, A_(m, 1) x_1 + dots.c + A_(m, n) x_n) $

	#note[此习题表明，线性映射 $T$ 具有在原书例3.3的倒数第二个例子中预示的形式。]
][
	对于 $j in {1, dots, m}$ 和 $k in {1, dots, n}$，令 $w_j in FF^m$ 和 $v_k in FF^n$ 分别为第 $j$ 个和第 $k$ 个分量为 $1$，其余分量为 $0$ 的向量。
	
	#tab 容易发现，$w_1, dots, w_m$ 是 $FF^m$ 的基，$v_1, dots, v_n$ 是 $FF^n$ 的基。于是，对于任意 $k in {1, dots, n}$，可以找到 $A_(1, 1), dots, A_(m, 1) in FF$，使得

	$ T v_k = A_(1, k) w_1 + dots.c + A_(m, k) w_m $

	#tab 另一方面，根据 $v_k$ 的定义，我们知道 $(x_1, dots, x_n) = x_1 v_1 + dots.c + x_n v_n$。同时，考虑到 $T$ 是线性映射，我们有

	$ T(x_1, dots, x_n) &= T(sum_(k = 1)^n x_k v_k) \
		&= sum_(k = 1)^n T(x_k v_k) \
		&= sum_(k = 1)^n x_k T v_k \
		&= sum_(k = 1)^n x_k sum_(j = 1)^m A_(j, k) w_j \
		&= sum_(j = 1)^m w_j sum_(k = 1)^n A_(j, k) x_k \
		&= (A_(1, 1)x_1 + dots.c + A_(1, n) x_n, dots, A_(m, 1) x_1 + dots.c + A_(m, n) x_n) $

	#tab 这立即给出了我们想要的结果。
]
