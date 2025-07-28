#import "../styles.typ": exercise_sol, note, tab, exercise_ref
#import "../math.typ": Poly, LinearMap, ii, span

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

#exercise_sol(type: "proof")[
	给出一个例子：函数 $phi: RR^2 -> RR$，使得对于任意 $a in RR$ 和 $v in RR^2$，有

	$ phi(a v) = a phi(v) $

	但是 $phi$ 不是线性映射。

	#note[本题和下一题表明，仅有齐次性或仅有可加性，都不足以推导出一个函数是线性映射。]
][
	对于任意 $(x, y) in RR^2$，令

	$ phi(x, y) = cases(
		x wide& abs(x) >= abs(y),
		y & abs(x) < abs(y),
	) $

	#tab 设 $a in RR$，则当 $abs(x) >= abs(y)$ 时，$phi(x, y) = x$，且有 $abs(a x) >= abs(a y)$，于是

	$ phi(a(x, y)) = phi(a x, a y) = a x = a phi(x, y) $

	#tab 当 $abs(x) < abs(y)$ 时，$phi(x, y) = y$，且有 $abs(a x) < abs(a y)$，于是

	$ phi(a(x, y)) = phi(a x, a y) = a y = a phi(y) $

	#tab 因此，对于任意 $a in RR$ 和 $v in RR^2$，都有 $phi(a v) = a phi(v)$。

	#tab 另一方面，注意到当 $v = (1, 0)$ 和 $w = (0, -1)$ 时，$phi(v + w) = phi(1, -1) = 1$，而 $phi(v) + phi(w) = phi(1, 0) + phi(0, -1) = 1 + (-1) = 0$，即 $phi(v + w) != phi(v) + phi(w)$。

	#tab 这说明 $phi$ 不满足线性映射的定义（原书3.1）中对可加性的要求。因此 $phi$ 不是线性映射。
]

#exercise_sol(type: "proof")[
	给出一个例子：函数 $phi: CC -> CC$，使得对于任意 $w, z in CC$，有

	$ phi(w + z) = phi(w) + phi(z) $

	但是 $phi$ 不是线性映射。（此处将 $CC$ 视为复向量空间。）

	#note[满足上述可加性条件，而不是线性映射的函数 $phi: RR -> RR$ 也是存在的。然而，证明这样的一个函数存在，要用到高得多的数学工具。#footnote[这有很强的分析背景，感兴趣的读者可以搜索“柯西方程的不连续解”“哈默尔基“等关键词。明确构造出这样的函数一般而言需要承认选择公理，构造的基本思路是将 $RR$ 视为 $QQ$ 上的一个无限维向量空间。]]
][
	设 $z in CC$，令#footnote[这里的 $Re z$ 表示 $z$ 的实部，类似地，记号 $Im z$ 表示 $z$ 的虚部。]

	$ phi(z) = Re z $

	#tab 设 $w = (a + b ii), z = (c + d ii) in CC$，其中 $a, b, c, d in RR$。则

	$ phi(w + z) = Re((a + c) + (b + d) ii) = a + c = Re w + Re z = phi(w) + phi(z) $

	#tab 因此，对于任意 $w, z in CC$，都有 $phi(w + z) = phi(w) + phi(z)$。

	#tab 另一方面，注意到

	$ phi(ii 2) = 0 != 2 ii = ii phi(2) $

	#tab 这说明 $phi$ 不满足线性映射的定义（原书3.1）中对齐次性的要求。因此 $phi$ 不是的线性映射。
]

#exercise_sol(type: "answer")[
	证明或证伪：如果 $q in Poly(RR)$，$T: Poly(RR) -> Poly(RR)$ 定义为 $T p = q compose p$，那么 $T$ 是线性映射。

	#note[这里定义的函数 $T$，不同于原书3.3中最后一个例子定义的函数 $T$，区别在于复合的次序。]
][
	设 $x in RR$。令 $q in Poly(RR)$ 为 $ x |-> x^2$。注意到，取 $p in Poly(RR)$ 为 $x |-> x$，则

	$ (T 2p)(x) = q(2 p(x)) = 4 x^2 != 2 x^2 = 2 q(p(x)) = 2 T p $

	#tab 这说明 $T$ 不满足线性映射的定义（原书3.1）中对齐次性的要求。因此 $T$ 不是线性映射。
]

#exercise_sol(type: "proof", label: "tricky")[
	设 $V$ 是有限维向量空间，$T in LinearMap(V)$。证明：$T$ 是恒等算子的标量倍，当且仅当，对于任意 $S in LinearMap(V)$，$S T = T S$ 成立。
][
	首先，假设 $T = lambda I$，其中 $lambda in FF$ 且 $I$ 是 $V$ 上的恒等算子。设 $v in V$，则对于任意 $S in LinearMap(V)$，有

	$ (S T)v = S(T v) = S(lambda v) = lambda S v = (lambda I)(S v) = (T S)v $

	#tab 这说明 $S T = T S$ 成立。

	#tab 另一方面，我们说明逆否命题。假设不存在 $lambda in FF$，使得 $T = lambda I$，即存在 $v in V$，使得不存在 $lambda in FF$，使得 $T v = lambda v$。根据#exercise_ref(<E-when-1-or-2-vectors-indep>)，我们得到 $v, T v$ 是一个线性无关组。

	#tab 现在，我们构造一个线性映射 $S in LinearMap(V)$，使得 $S v = v$ 且 $S T v = v$。具体而言，根据每个线性无关组都可被扩充为基（原书2.32），我们可以找到 $u_1, dots, u_m in V$，使得 $v, T v, u_1, dots, u_m$ 是 $V$ 的一组基。现在，对于任意 $w in V$，我们可以唯一地将 $w$ 表示为

	$ w = a v + b T v + c_1 u_1 + dots.c + c_m u_m $

	其中 $a, b, c_1, dots, c_m in FF$。于是，我们令

	$ S w = (a + b) v + c_1 u_1 + dots.c + c_m u_m $

	#tab 很容易说明 $S$ 是线性映射，且 $S v = S T v = v$。于是只能有

	$ S T v = v != T v = T S v $

	#tab 这说明 $S T != T S$。

	#tab 综上所述，$T$ 是恒等算子的标量倍，当且仅当，对于任意 $S in LinearMap(V)$，$S T = T S$ 成立。
]

#exercise_sol(type: "proof")[
	设 $U$ 是 $V$ 的子空间，$U != V$。设 $S in LinearMap(U, W)$，且 $S != 0$（即存在 $u in U$，使得 $S u != 0$）。定义 $T: V -> W$，使得

	$ T v = cases(
		S v wide& v in U,
		0 wide& v in V quad and quad v in.not U,
	) $

	证明：$T$ 不是 $V$ 上的线性映射。
][
	设 $u in U$，使得 $S u != 0$，$v in V$ 且 $v in.not V$。由于 $u + (v - u) = v in.not U$，根据子空间的条件（原书1.34）中对加法封闭性的要求，只能有 $v - u in.not U$。注意到

	$ T u = S u != 0 = 0 + 0 = T u + T (v - u) $

	#tab 这说明 $T$ 不满足线性映射的定义（原书3.1）中对可加性的要求。因此 $T$ 不是 $V$ 上的线性映射。
]

#exercise_sol(type: "proof", ref: <E-extend-linear-map>)[
	设 $V$ 是有限维的向量空间。证明：$V$ 的子空间上的任意一个线性映射都可以扩充为 $V$ 上的线性映射。形式化地说，设 $U$ 是 $V$ 的子空间，$S in LinearMap(U, W)$。则存在 $T in LinearMap(V, W)$，使得 $T u = S u$ 对任意 $u in U$ 成立。

	#note[原书 3.125 的证明将会用到本题的结果。]
][
	设 $v_1, dots, v_m$ 是 $U$ 的一组基，根据每一个线性无关组都可被扩充为基（原书2.32），我们可以找到 $v_(m + 1), dots, v_n in V$，使得 $v_1, dots, v_n$ 是 $V$ 的一组基。现在，对于任意 $v in V$，我们可以唯一地将 $v$ 表示为

	$ v = a_1 v_1 + dots.c + a_n v_n $

	#tab 其中 $a_1, dots, a_n in FF$。现在，令函数 $R: V -> U$，使得

	$ R v = a_1 v_1 + dots.c + a_m v_m $

	#tab 很容易证明 $R$ 是线性映射，且对于 $u in U$，有 $R u = u$。现在，令 $T = S R$ 就立即完成了证明。
]

#exercise_sol(type: "proof")[
	设 $V$ 是有限维向量空间，$dim V > 0$，$W$ 是无限维向量空间。证明：$LinearMap(V, W)$ 是无限维的。
][
	设 $v in V$，$v != 0$。根据#exercise_ref(<E-inf-dim-space-seq-characterization>)，$W$ 中存在一个序列 $w_1, w_2, dots$ 使得对于任意 $m in NN^+$，向量组 $w_1, dots, w_m$ 线性无关。

	#tab 对于任意 $u in span(v)$，存在 $lambda in FF$，使得 $u = lambda v$。现在，对于任意 $k in NN^+$，令函数 $S_k: span(v) -> W$ 满足

	$ S_k u = lambda w_k $

	#tab 根据@E-extend-linear-map，存在 $T_k in LinearMap(V, W)$，使得对于任意 $u in span(v)$，都有 $T_k u = S_k u$。特别地，$T_k v = w_k$。

	#tab 对于任意 $m in NN^+$，设 $a_1, dots a_m in FF$，使得

	$ a_1 T_1 + dots.c + a_m T_m = 0 $

	#tab 等式两边同时代入 $v$，我们得到

	$ a_1 w_1 + dots.c + a_m w_m = 0 $

	#tab 由于 $w_1, dots, w_m$ 是线性无关的，因此 $a_1 = dots.c = a_m = 0$。这说明 $T_1, dots, T_m$ 是线性无关的。

	#tab 所以，根据#exercise_ref(<E-inf-dim-space-seq-characterization>)，$LinearMap(V, W)$ 是无限维的。
]

#exercise_sol(type: "proof")[
	设 $v_1, dots, v_m$ 是 $V$ 中的线性相关向量组，$dim W > 0$。证明：存在 $w_1, dots, w_m in W$，使得不存在 $T in LinearMap(V, W)$ 对于任意 $k in {1, dots, m}$，都有 $T v_k = w_k$。
][
	根据线性相关性引理（原书2.19），存在 $k in {1, dots, m}$，使得 $v_k in span(v_1, dots, v_(k - 1))$。设

	$ v_k = a_1 v_1 + dots.c + a_(k - 1) v_(k - 1) $

	#tab 其中 $a_1, dots, a_(k - 1) in FF$。任取 $w_k != 0$，并令 $w_1 = dots.c = w_(k - 1) = 0$。于是

	$ T v_k = a_1 T v_1 + dots.c + a_(k - 1) T v_(k - 1) = 0 != w_k $

	#tab 这说明不存在 $T in LinearMap(V, W)$，使得对于任意 $k in {1, dots, m}$，都有 $T v_k = w_k$。
]
