#import "../styles.typ": exercise_sol, note, tab
#import "../math.typ": Poly, LinearMap

#note[与原书一致，在本章中，如无其他说明，我们总是假定字母 $U$，$V$ 和 $W$ 都是 $FF$ 上的向量空间。]

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

#exercise_sol(type: "proof")[
	设 $T in LinearMap(V, W)$ 且 $v_1, dots, v_m$ 是 $V$ 中的一组向量，使得向量组 $T v_1, dots, T v_m$ 在 $W$ 中是线性无关的。证明：向量组 $v_1, dots, v_m$ 是线性无关的。
][
	我们证明其逆否命题，即若 $v_1, dots, v_m$ 是线性相关的，则 $T v_1, dots, T v_m$ 也是线性相关的。现在假设 $v_1, dots, v_m$ 是线性相关的。

	#tab 根据线性相关的定义（原书2.17），存在 $a_1, dots, a_m in FF$，使得

	$ a_1 v_1 + dots.c + a_m v_m = 0 $

	#tab 其中 $a_1, dots, a_m$ 不全为 $0$。由于 $T$ 是线性映射，根据线性映射将 $0$ 映射到 $0$（原书3.10），我们有

	$ 0 = T 0 &= T(a_1 v_1 + dots.c + a_m v_m) \
		&= a_1 T v_1 + dots.c + a_m T v_m \ $

	#tab 这立即说明 $T v_1, dots, T v_m$ 是线性相关的。

	#tab 一个命题成立，当且仅当其逆否命题成立。因此，原命题得证。
]

#exercise_sol(type: "proof")[
	证明：$LinearMap(V, W)$ 是向量空间，即原书 3.6 的结论。
][
	我们逐条验证 $LinearMap(V, W)$ 满足向量空间的定义（原书1.20）中的要求。

	/ 可交换性: 对任意 $T, S in LinearMap(V, W)$，$T + S = S + T$。 \
		证明：设 $v in V$，则
		$ (T + S)v &= T v + S v \
			&= S v + T v \
			&= (S + T)v $
		因此 $T + S = S + T$。

	/ 可结合性: 对任意 $T, S, R in LinearMap(V, W)$ 以及 $a, b in FF$，都有 $ (T + S) + R = T + (S + R)$，以及 $(a b)T = a(b T)$。\
		证明：设 $v in V$，则对于加法的结合性，有
		$ ((T + S) + R)v &= (T + S)v + R v \
			&= T v + S v + R v \
			&= T v + (S + R)v \
			&= T v + S v + R v \
			&= (T + (S + R))v $
		因此 $(T + S) + R = T + (S + R)$。另一方面，对于标量乘法的结合性，有
		$ ((a b)T)v &= (a b)(T v) \
			&= a(b(T v)) \
			&= a((b T)v) = (a(b T))v $
		因此 $(a b)T = a(b T)$。

	/ 加法单位元: 存在 $0 in LinearMap(V, W)$，使得对任意 $T in LinearMap(V, W)$，$T + 0 = T$。 \
		证明：取 $0: v |-> 0$，设 $v in V$，则
		$ (T + 0)v &= T v + 0 v \
			&= T v + 0 \
			&= T v $
		因此 $T + 0 = T$。

	/ 加法逆元: 对任意 $T in LinearMap(V, W)$，存在 $-T in LinearMap(V, W)$，使得 $T + (-T) = 0$。 \
		证明：取 $-T: v |-> -T v$，设 $v in V$，则
		$ (T + (-T))v &= T v + (-T)v = T v - T v = 0 = 0 v $
		因此 $T + (-T) = 0$。

	/ 乘法单位元: 对于任意 $T in LinearMap(V, W)$，$1 T = T$。 \
		证明：设 $v in V$，则
		$ (1 T)v = 1(T v) = T v $
		因此 $1 T = T$。

	/ 分配性质: 对于任意 $T, S in LinearMap(V, W)$ 和 $a, b in FF$，都有 $a(T + S) = a T + a S$，以及 $(a + b)T = a T + b T$。\
		证明：设 $v in V$，则对于第一个分配性质，有
		$ (a(T + S))v &= a((T + S)v) \
			&= a(T v + S v) \
			&= a T v + a S v \
			&= (a T + a S)v $
		因此 $a(T + S) = a T + a S$。另一方面，对于第二个分配性质，有
		$ ((a + b)T)v &= (a + b)(T v) \
			&= a(T v) + b(T v) \
			&= (a T)v + (b T)v \
			&= (a T + b T)v $
		因此 $(a + b)T = a T + b T$。
]

#exercise_sol(type: "proof")[
	证明：线性映射的乘法具有可结合性、单位元和分配性质，即原书 3.8 的结论。
][
	我们逐条验证线性映射满足这些性质。

	/ 可结合性: 对于任意使乘积有意义的线性映射 $T_1$，$T_2$ 和 $T_3$（即 $T_3$ 映射到 $T_2$ 的定义空间中，$T_2$ 映射到 $T_1$ 的定义空间中），都有 $(T_1 T_2) T_3 = T_1 (T_2 T_3)$。 \
		证明：设 $v$ 是 $T_3$ 的定义空间中的任意向量，则
		$ ((T_1 T_2) T_3)v = T_1(T_2(T_3 v)) = (T_1 (T_2 T_3))v $
		因此 $(T_1 T_2) T_3 = T_1 (T_2 T_3)$。

	/ 单位元: 对于任意 $T in LinearMap(V, W)$，都有 $T I = I T = T$。这里的第一个 $I$ 是 $V$ 上的恒等变换，而第二个 $I$ 是 $W$ 上的恒等变换。 \
		证明：设 $v in V$，对于 $I T = T$，有
		$ (I T)v = I(T v) = T v $
		因此 $I T = T$。另一方面，对于 $T I = T$，
		$ (T I)v = T(I v) = T v $
		因此 $T I = T$。

	/ 分配性质: 对于任意 $T, T_1, T_2 in LinearMap(U, V)$ 和 $S, S_1, S_2 in LinearMap(V, W)$，有 $(S_1 + S_2) T = S_1 T + S_2 T$ 且 $S(T_1 + T_2) = S T_1 + S T_2$。 \
		证明：设 $v in U$，则对于第一个分配性质，有
		$ ((S_1 + S_2) T)v &= (S_1 + S_2)(T v) \
			&= S_1(T v) + S_2(T v) \
			&= (S_1 T + S_2 T)v $
		因此 $(S_1 + S_2) T = S_1 T + S_2 T$。另一方面，对于第二个分配性质，有
		$ (S(T_1 + T_2))v &= S((T_1 + T_2)v) \
			&= S(T_1 v + T_2 v) \
			&= S(T_1 v) + S(T_2 v) \
			&= (S T_1 + S T_2)v $
		因此 $S(T_1 + T_2) = S T_1 + S T_2$。

	#tab 综上所述，线性映射的乘法具有可结合性、单位元和分配性质。
]

#exercise_sol(type: "proof")[
	证明：任何从一维向量空间到其自身的线性映射，就是标量乘法。形式化地说，即若 $dim V = 1$ 且 $T in LinearMap(V) $，则存在 $lambda in FF$，使得 $T v = lambda v$ 对任意 $v in V$ 成立。
][
	设 $w$ 是 $V$ 的一组基。由于 $T w in V$，根据基的性质，存在 $lambda in FF$，使得 $T w = lambda w$。现在考虑任意 $v in V$。根据基的性质，存在唯一的 $a in FF$，使得 $v = a w$。因此

	$ T v = T(a w) = a T w = a(lambda w) = lambda (a w) = lambda v $

	#tab 综上所述，$T v = lambda v$ 对任意 $v in V$ 成立。
]
