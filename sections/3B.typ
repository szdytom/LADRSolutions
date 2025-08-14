#import "../styles.typ": exercise_sol, tab, exercise_ref, math_numbering, note
#import "../math.typ": null, range, LinearMap, span, restricted, Poly

#exercise_sol(type: "answer")[
	给出一例：满足 $dim null T = 3$ 且 $dim range T = 2$ 的线性映射 $T$。
][
	令

	$ T:& RR^5 -> RR^2 \ &(x_1, x_2, x_3, x_4, x_5) |-> (x_1, x_2) $

	#tab 根据定义

	$ range T &= RR^2 \
		null T &= {(0, 0, x, y, z) in RR^5 : x, y, z in RR} $

	#tab 于是 $dim null T = 3$ 且 $dim range T = 2$。
]

#exercise_sol(type: "proof")[
	设 $S, T in LinearMap(V)$ 使得 $range S subset.eq null T$，证明：$(S T)^2 = 0$。
][
	设 $v in V$。考虑到 $S (T v) in range S subset.eq null T$，根据定义，$ T S T v = 0$。根据线性映射将 $0$ 映射到 $0$（原书3.10），

	$ (S T)^2 v = S (T S T) v = S 0 = 0 $

	因此 $(S T)^2 = 0$。
]

#exercise_sol(type: "answer")[
	设向量组 $v_1, dots, v_m in V$，定义 $T in LinearMap(FF^m, V)$ 为

	$ (z_1, dots, z_m) |-> z_1 v_1 + dots.c + z_m v_m $

	+ $T$ 的什么性质对应于向量组 $v_1, dots, v_m$ 张成 $V$？
	+ $T$ 的什么性质对应于向量组 $v_1, dots, v_m$ 线性无关？
][
	对于 (a)，结论是 $T$ 是满射等价于向量组 $v_1, dots, v_m$ 张成 $V$。我们使用逆否命题来说明这一点。首先假设 $T$ 不是满射，则存在 $w in V$ 使得 $w in.not range T$。反证假设向量组 $v_1, dots, v_m$ 张成 $V$，则存在 $z_1, dots, z_m in FF$ 使得 $w = z_1 v_1 + dots.c + z_m v_m$。因此 $w in range T$，这与 $w in.not range T$ 矛盾。

	#tab 现在假设向量组 $v_1, dots, v_m$ 不张成 $V$，则 $dim V > dim span(v_1, dots, v_m) = m$，然而 $dim FF^m = m$，根据映射到更高维空间上的线性映射不是满射（原书3.24），$T$ 不是满射。

	#tab 对于 (b)，结论是 $T$ 是单射等价于向量组 $v_1, dots, v_m$ 线性无关。首先假设 $T$ 是单射，则根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$null T = {0}$。因此 $z_1 v_1 + dots.c + z_m v_m = 0$ 仅当 $z_1 = dots.c = z_m = 0$，这说明向量组 $v_1, dots, v_m$ 线性无关。

	#tab 现在假设向量组 $v_1, dots, v_m$ 线性无关。则 $dim range T = dim span(v_1, dots, v_m) = m$，根据线性映射基本定理（原书3.21），$dim FF^m = dim null T + dim range T$，解得 $dim null T = {0}$，即 $T$ 是单射。
]

#exercise_sol(type: "proof")[
	证明：${T in LinearMap(RR^5, RR^4) : dim null T > 2}$ 不是 $LinearMap(RR^5, RR^4)$ 的子空间。
][
	记 $S = {T in LinearMap(RR^5, RR^4) : dim null T > 2}$。取 $T_1, T_2 in LinearMap(RR^5, RR^4)$，使得对于任意 $x_1, x_2, x_3, x_4, x_5 in RR$，有

	$ T_1(x_1, x_2, x_3, x_4, x_5) &= (x_1, x_2, 0, 0) \
		T_2(x_1, x_2, x_3, x_4, x_5) &= (0, 0, x_3, x_4) $

	容易验证 $dim null T_1 = dim null T_2 = 3 > 2$，即 $T_1$ 和 $T_2$ 都是 $S$ 中的元素。然而，注意到 $dim range (T_1 + T_2) = 4$，即根据线性映射基本定理（原书3.21），

	$ dim null (T_1 + T_2) = dim RR^5 - dim range (T_1 + T_2) = 5 - 4 = 1 $

	#tab 因此 $T_1 + T_2 in.not S$。这说明 $S$ 违反了子空间的条件（原书1.34）中对加法封闭性的要求，故 $S$ 不是 $LinearMap(RR^5, RR^4)$ 的子空间。
]

#exercise_sol(type: "answer")[
	给出一例：线性映射 $T in LinearMap(RR^4)$，满足 $range T = null T$。
][
	设 $v_1, dots, v_4$ 是 $RR^4$ 的一组基。根据线性映射引理（原书3.4），存在 $T in LinearMap(RR^4)$，使得 $T v_1 = T v_2 = 0$，$T v_3 = v_1$，$T v_4 = v_2$。因此

	$ range T = null T = span(v_1, v_2) $

	#tab 因此 $T$ 满足题目要求。
]

#exercise_sol(type: "proof")[
	证明：不存在 $T in LinearMap(RR^5)$，使得 $range T = null T$。
][
	假设存在 $T in LinearMap(RR^5)$，使得 $range T = null T$。根据线性映射基本定理（原书3.21），有

	$ dim RR^5 = dim null T + dim range T $

	#tab 由于 $range T = null T$，因此 $dim range T = dim null T$。设 $dim range T = n$，则

	$ dim RR^5 = n + n = 2n $

	#tab 由于 $dim RR^5 = 5$，因此 $2n = 5$，这与 $n$ 是整数矛盾。因此不存在这样的 $T$。
]

#exercise_sol(type: "proof")[
	设 $V$ 和 $W$ 是有限维向量空间，$2 <= dim V <= dim W$。证明：${T in LinearMap(V, W) : T "不是单射"}$ 不是 $LinearMap(V, W)$ 的子空间。
][
	记 $S = {T in LinearMap(V, W) : T "不是单射"}$。设 $v_1, dots, v_m$ 是 $V$ 的一组基，$w_1, dots, w_n$ 是 $W$ 的一组基，其中 $n >= m = dim V >= 2$。

	#tab 根据线性映射引理（原书3.4），存在 $T in LinearMap(V, W)$，使得对于任意 $i in {1, dots, m}$，有 $T v_i = w_i$。设 $v in V$。假设 $T v = 0$，将 $v$ 表示为 $v = z_1 v_1 + dots.c + z_m v_m$，其中 $z_1, dots, z_m in FF$。则

	$ T v = z_1 T v_1 + dots.c + z_m T v_m = z_1 w_1 + dots.c + z_m w_m = 0 $

	#tab 由于 $w_1, dots, w_m$ 是线性无关的，因此 $z_1 = dots.c = z_m = 0$，即 $v = 0$。因此 $null T = {0}$，根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$T$ 是单射，即 $T in.not S$。

	#tab 再次利用线性映射引理（原书3.4），存在 $R in LinearMap(V, W)$，使得 $R v_1 = w_1$，且对于任意 $i in {2, dots, m}$，$R v_i = 0$。由于 $m >= 2$，我们至少有 $R v_2 = R 0 = 0$，故 $R$ 不是单射。

	#tab 注意到

	$ (T - R) v_1 = T v_1 - R v_1 = w_1 - w_1 = 0 = (T - R) 0 $

	#tab 故 $T - R$ 不是单射。即 $R, T - R in S$，注意到

	$ R + (T - R) = T in.not S $

	#tab 这说明 $S$ 违反了子空间的条件（原书1.34）中对加法封闭性的要求，故 $S$ 不是 $LinearMap(V, W)$ 的子空间。
]

#exercise_sol(type: "proof")[
	设 $V$ 和 $W$ 是有限维向量空间，$2 <= dim W <= dim V$。证明：${T in LinearMap(V, W) : T "不是满射"}$ 不是 $LinearMap(V, W)$ 的子空间。
][
	记 $S = {T in LinearMap(V, W) : T "不是满射"}$。设 $v_1, dots, v_m$ 是 $V$ 的一组基，$w_1, dots, w_n$ 是 $W$ 的一组基，其中 $m >= n = dim W >= 2$。

	#tab 根据线性映射引理（原书3.4），存在 $T in LinearMap(V, W)$，使得对于任意 $i in {1, dots, n}$，有 $T v_i = w_i$，且对于任意 $i in {n+1, dots, m}$，$T v_i = 0$。设 $w in W$。将 $w$ 表示为 $w = z_1 w_1 + dots.c + z_n w_n$，其中 $z_1, dots, z_m in FF$。则

	$ w = z_1 T v_1 + dots.c + z_n T v_n = T (z_1 v_1 + dots.c + z_n v_n) $

	#tab 故 $range T = W$，即 $T$ 是满射，因此 $T in.not S$。

	#tab 再次利用线性映射引理（原书3.4），存在 $R in LinearMap(V, W)$，使得 $R v_1 = w_1$，且对于任意 $i in {2, dots, n}$，$R v_i = 0$。由于 $n >= 2$，$w_1, w_2$ 线性无关，根据#exercise_ref(<E-when-1-or-2-vectors-indep>)，不存在 $lambda in FF$，使得 $w_2 = lambda w_1$，即 $w in.not range R$，故 $R$ 不是满射。

	#tab 反证假设 $T - R$ 是满射，则存在 $v in V$ 使得 $(T - R) v = w_1$。将 $v$ 表示为 $v = a_1 v_1 + dots.c + a_m v_m$，其中 $a_1, dots, a_m in FF$。则

	$ w_1 = (T - R) v &= T v - R v \
		&= a_1 T v_1 + dots.c + a_m T v_m + a_1 R v_1 + dots.c + a_m R v_m \
		&= a_1 w_1 + dots.c + a_n w_n - a_1 w_1 \
		&= a_2 w_2 + dots.c + a_n w_n in span(w_2, dots, w_m) $

	#tab 根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，$w_2, dots, w_n, w_1$ 不是线性无关的，矛盾。故 $T - R$ 不是满射。现在 $R, T - R in S$，注意到

	$ R + (T - R) = T in.not S $

	#tab 这说明 $S$ 违反了子空间的条件（原书1.34）中对加法封闭性的要求，故 $S$ 不是 $LinearMap(V, W)$ 的子空间。
]

#exercise_sol(type: "proof", ref: <E-indep-preservance-under-inj>)[
	设 $T in LinearMap(V, W)$ 是单射，向量组 $v_1, dots, v_n$ 在 $V$ 中线性无关。证明：向量组 $T v_1, dots, T v_n$ 在 $W$ 中线性无关。
][
	设 $a_1, dots, a_n in FF$ 使得

	$ a_1 T v_1 + dots.c + a_n T v_n = 0 $

	#tab 根据线性映射的定义，有

	$ T (a_1 v_1 + dots.c + a_n v_n) = 0 $

	#tab 由于 $T$ 是单射，根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$null T = {0}$，因此 $a_1 v_1 + dots.c + a_n v_n = 0$。由于向量组 $v_1, dots, v_n$ 在 $V$ 中线性无关，只能有 $a_1 = dots.c = a_n = 0$。

	#tab 这说明向量组 $T v_1, dots, T v_n$ 在 $W$ 中线性无关。
]

#exercise_sol(type: "proof", ref: <E-domain-span-to-range-span>)[
	设向量组 $v_1, dots, v_n$ 张成 $V$，$T in LinearMap(V, W)$，证明：$T v_1, dots, T v_n$ 张成 $range T$。
][
	设 $w in range T$，则可设 $v in V$，使得 $T v = w$。将 $v$ 表示为 $v = a_1 v_1 + dots.c + a_n v_n$，其中 $a_1, dots, a_n in FF$。则

	$ w = T v = T (a_1 v_1 + dots.c + a_n v_n) = a_1 T a_1 + dots.c + a_n T a_n $

	#tab 这说明 $w$ 可以表示为向量组 $T v_1, dots, T v_n$ 的线性组合，根据张成的定义（原书2.7），可得 $T v_1, dots, T v_n$ 张成 $range T$。
]

#exercise_sol(type: "proof")[
	设 $V$ 是有限维向量空间，$T in LinearMap(V, W)$。证明：存在 $V$ 的子空间 $U$，使得

	$ U inter null T = {0} wide and wide range T = {T u : u in U} $
][
	设 $v_1, dots, v_n$ 是 $V$ 的一组基，则根据@E-domain-span-to-range-span，$T v_1, dots, T v_n$ 张成 $range T$。在根据“每个张成组都包含基”（原书2.30），不妨设 $T v_1, dots, T v_m$ 是 $range T$ 的一组基。

	#tab 令 $U = span(v_1, dots, v_m)$。将 $T$ 视作 $U -> W$ 的线性映射，则根据@E-domain-span-to-range-span，$range T = {T u : u in U}$。现在证明 $U inter null T = {0}$。设 $u in U inter null T$，则存在 $a_1, dots, a_m in FF$，使得

	$ u = a_1 v_1 + dots.c + a_m v_m $

	#tab 由于 $u in null T$，根据线性映射的定义，有

	$ 0 = T u = a_1 T v_1 + dots.c + a_m T v_m $

	#tab 由于 $T v_1, dots, T v_m$ 是线性无关的，故 $a_1 = dots.c = a_m = 0$，即 $u = 0$。因此 $U inter null T = {0}$。
]

#exercise_sol(type: "proof")[
	设 $T$ 是 $FF^4 -> FF^2$ 的线性映射，且

	$ null T = {(x_1, x_2, x_3, x_4) in FF^4 : x_1 = 5x_2 and x_3 = 7 x_4} $

	证明：$T$ 是满射。
][
	注意到，取

	$ v_1 &= (5, 1, 0, 0) \
		v_2 &= (0, 0, 7, 1) $

	#tab 则 $null T = span(v_1, v_2)$，因此 $dim null T = 2$。根据线性映射基本定理（原书3.21），

	$ dim FF^4 = dim null T + dim range T $

	#tab 解得 $dim range T = 2$，即 $dim range T = dim FF^2$，根据“某空间中与之维数相同的子空间即为该空间本身”（原书2.39），$range T = FF^2$，即 $T$ 是满射。
]

#exercise_sol(type: "proof")[
	设 $U$ 是 $RR^8$ 的 $3$ 维子空间，$T$ 是 $RR^8 -> RR^5$ 的线性映射，使得 $null T = U$。证明：$T$ 是满射。
][
	根据线性映射基本定理（原书3.21），有

	$ dim RR^8 = dim U + dim range T $

	#tab 解得 $dim range T = 5$。根据“某空间中与之维数相同的子空间即为该空间本身”（原书2.39），$range T = RR^5$，即 $T$ 是满射。
]

#exercise_sol(type: "proof")[
	证明：不存在 $FF^5 -> FF^2$ 的线性映射，使得其零空间等于

	$ {(x_1, x_2, x_3, x_4, x_5) in FF^5 : x_1 = 3 x_2 and x_3 = x_4 = x_5} $
][
	假设这样的线性映射 $T$ 存在。注意到，取

	$ v_1 &= (3, 1, 0, 0, 0) \
		v_2 &= (0, 0, 1, 1, 1) $

	#tab 则 $null T = span(v_1, v_2)$，因此 $dim null T = 2$。根据线性映射基本定理（原书3.21），

	$ dim FF^5 = dim null T + dim range T $

	#tab 解得 $dim range T = 3$，然而 $dim FF^2 = 2$，根据“子空间的维数不超过该空间的维数”（原书2.37），$range T subset.eq FF^2$，因此 $dim range T <= dim FF^2 = 2$，矛盾。因此不存在这样的线性映射。
]

#exercise_sol(type: "proof")[
	设 $V$ 上存在一个线性映射，使得其零空间和值域都是有限维的，证明：$V$ 是有限维的。
][
	设 $T in LinearMap(V)$，使得 $dim null T = m$ 且 $dim range T = n$。进一步可设 $u_1, dots, u_m$ 是 $null T$ 的一组基，$T v_1, dots, T v_n$ 是 $range T$ 的一组基，其中 $v_1, dots, v_n in V$。

	#tab 设 $w in V$，则 $T w in range T$，因此存在 $a_1, dots, a_n in FF$，使得

	$ T w = a_1 T v_1 + dots.c + a_n T v_n = T (a_1 v_1 + dots.c + a_n v_n) $

	#tab 记 $v = a_1 v_1 + dots.c + a_n v_n$，则 $T (w - v) = 0$，故 $w - v in null T$，即存在 $b_1, dots, b_m in FF$，使得

	$ w - v = b_1 u_1 + dots.c + b_m u_m $

	#tab 这说明 $w$ 可以表示为

	$ w = (a_1 v_1 + dots.c + a_n v_n) + (b_1 u_1 + dots.c + b_m u_m) $

	#tab 即 $w in span(u_1, dots, u_m, v_1, dots, v_n)$。$V$ 可以被有限个向量张成，因此 $V$ 是有限维的。
]

#exercise_sol(type: "proof")[
	设 $V$ 和 $W$ 都是有限维向量空间，证明：存在 $V -> W$ 的单的线性映射，当且仅当 $dim V <= dim W$。
][
	首先假设存在 $T in LinearMap(V, W)$ 是单射。根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$null T = {0}$，因此 $dim null T = 0$。根据线性映射基本定理（原书3.21），有

	$ dim V = dim null T + dim range T = dim range T $

	#tab 由于 $range T subset.eq W$，根据子空间的维数（原书2.37），$dim range T <= dim W$，因此 $dim V <= dim W$。

	#tab 现在假设 $dim V <= dim W$。设 $v_1, dots, v_n$ 是 $V$ 的一组基，$w_1, dots, w_n$ 是 $W$ 上的一个线性无关组。根据线性映射引理（原书3.4），存在 $T in LinearMap(V, W)$，使得对于任意 $i in {1, dots, n}$，有 $T v_i = w_i$。

	#tab 设 $v in V$，使得 $T v = 0$。将 $v$ 表示为 $v = a_1 v_1 + dots.c + a_n v_n$，其中 $a_1, dots, a_n in FF$。则

	$ 0 = T v = a_1 T v_1 + dots.c + a_n T v_n = a_1 w_1 + dots.c + a_n w_n $

	#tab 由于 $w_1, dots, w_n$ 是线性无关的，故 $a_1 = dots.c = a_n = 0$，即 $v = 0$。因此 $null T = {0}$，根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$T$ 是单射。
]

#exercise_sol(type: "proof")[
	设 $V$ 和 $W$ 都是有限维向量空间，证明：存在 $V -> W$ 的满的线性映射，当且仅当 $dim V >= dim W$。
][
	首先假设存在 $T in LinearMap(V, W)$ 是满射。根据线性映射基本定理（原书3.21），有

	$ dim V = dim null T + dim range T $

	#tab 由于 $range T = W$，因此 $dim range T = dim W$，解得 $dim V = dim null T + dim W >= dim W$。

	#tab 现在假设 $dim V >= dim W$。设 $w_1, dots, w_n$ 是 $W$ 的一组基，$v_1, dots, v_n$ 是 $V$ 上的一个线性无关向量组。根据线性映射引理（原书3.4），存在 $S in LinearMap(span(v_1, dots, v_n), W)$，使得对于任意 $i in {1, dots, n}$，有 $S v_i = w_i$。进一步，根据#exercise_ref(<E-extend-linear-map>)，存在 $T in LinearMap(V, W)$，使得对于任意 $v in span(v_1, dots, v_n)$，有 $T v = S v$。

	#tab 设 $w in W$，则可以将 $w$ 表示为 $w = a_1 w_1 + dots.c + a_n w_n$，其中 $a_1, dots, a_n in FF$。则

	$ w = a_1 T v_1 + dots.c + a_n T v_n = T (a_1 v_1 + dots.c + a_n v_n) $

	#tab 这说明对于任意 $w in W$，都存在一个向量在 $V$ 中，使得其通过 $T$ 映射到该向量。因此 $T$ 是满射。
]

#exercise_sol(type: "proof")[
	设 $V$ 和 $W$ 都是有限维向量空间，$U$ 是 $V$ 的子空间。证明：存在 $T in LinearMap(V, W)$，使得 $null T = U$ 当且仅当 $dim U >= dim V - dim W$。
][
	首先假设存在 $T in LinearMap(V, W)$，使得 $null T = U$。根据线性映射基本定理（原书3.21），有

	$ dim V = dim null T + dim range T $

	#tab 由于 $null T = U$，因此 $dim null T = dim U$。由于 $range T subset.eq W$，根据子空间的维数（原书2.37），$dim range T <= dim W$，因此

	$ dim V <= dim U + dim W $

	#tab 解得 $dim U >= dim V - dim W$。

	#tab 现在假设 $dim U >= dim V - dim W$。设 $u_1, dots, u_m$ 是 $U$ 的一组基。根据“每个线性无关组都可以扩展为基”（原书2.31），存在 $v_1, dots, v_n in V$，使得向量组 $u_1, dots, u_m, v_1, dots, v_n$ 是 $V$ 的一组基。其中 $m = dim U$，$n = dim V - dim U$。由于 $dim U >= dim V - dim W$，解得 $n <= dim W$。

	#tab 设 $w_1, dots, w_n in W$ 是线性无关组，根据线性映射引理（原书3.4），存在 $T in LinearMap(V, W)$，使得对于任意 $i in {1, dots, m}$，有 $T u_i = 0$，且对于任意 $i in {1, dots, n}$，有 $T v_i = w_i$。

	#tab 设 $v in null T$，则存在 $a_1, dots, a_m, b_1, dots, b_n in FF$，使得

	$ v = a_1 u_1 + dots.c + a_m u_m + b_1 v_1 + dots.c + b_n v_n $

	#tab 其中

	$ 0 = T v = b_1 T v_1 + dots.c + b_n T v_n = b_1 w_1 + dots.c + b_n w_n $

	#tab 由于 $w_1, dots, w_n$ 是线性无关的，故 $b_1 = dots.c = b_n = 0$，即 $v in U$。因此 $null T subset.eq U$。另一方面，显然 $U subset.eq null T$，因此 $null T = U$。
]

#exercise_sol(type: "proof")[
	设 $W$ 是有限维向量空间，$T in LinearMap(V, W)$。证明：$T$ 是单射，当且仅当，存在 $S in LinearMap(W, V)$，使得 $S T$ 是 $V$ 上的恒等映射。
][
	首先假设 $T$ 是单射。根据值域是子空间（原书3.18），$range T$ 是 $W$ 的子空间，进一步根据子空间的维数（原书2.37），可得 $range T$ 是有限维的。设 $T u_1, dots, T u_n$ 是 $range T$ 的一组基，其中 $u_1, dots, u_n in V$。

	#tab 设 $u in V$，则可以将 $T u$ 表示为

	$ T u = a_1 T u_1 + dots.c + a_n T u_n = T (a_1 u_1 + dots.c + a_n u_n) $

	#tab 其中 $a_1, dots, a_n in FF$。根据单射的定义（原书3.14），$T$ 是单射，因此 $u in span(u_1, dots, u_n)$。因此向量组 $u_1, dots, u_n$ 张成 $V$。故 $V$ 是有限维向量空间。

	#tab 故可设 $v_1, dots, v_n$ 是 $V$ 的一组基。对于 $i in {1, dots, n}$，令 $w_i = T v_i$。根据@E-indep-preservance-under-inj，$w_1, dots, w_n$ 是线性无关的。

	#tab 根据线性映射引理（原书3.4），存在 $R in LinearMap(span(w_1, dots, w_n), V)$，使得对于任意 $i in {1, dots, n}$，有 $R w_i = v_i$。进一步，根据#exercise_ref(<E-extend-linear-map>)，存在 $S in LinearMap(W, V)$，使得对于任意 $w in span(w_1, dots, w_n)$，有 $S w = R w$。

	#tab 设 $v in V$，则可以将 $v$ 表示为 $v = a_1 v_1 + dots.c + a_n v_n$，其中 $a_1, dots, a_n in FF$。则

	$ S T v &= S (a_1 T v_1 + dots.c + a_n T v_n) \
		&= S(a_1 w_1 + dots.c + a_n w_n) \
		&= a_1 S w_1 + dots.c + a_n S w_n \
		&= a_1 v_1 + dots.c + a_n v_n = v $

	#tab 这说明 $S T$ 确实是 $V$ 上的恒等映射。

	#tab 现在假设存在 $S in LinearMap(W, V)$，使得 $S T$ 是 $V$ 上的恒等映射。设 $v in null T$，根据“线性映射将 $0$ 映射到 $0$”（原书3.10），有

	$ v = S T v = S 0 = 0 $

	#tab 这说明 $null T = {0}$，根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$T$ 是单射。
]

#exercise_sol(type: "proof")[
	设 $W$ 是有限维的向量空间，$T in LinearMap(V, W)$。证明：$T$ 是满射，当且仅当，存在 $S in LinearMap(W, V)$，使得 $T S$ 是 $W$ 上的恒等映射。
][
	首先假设 $T$ 是满射。令 $n = dim W$。如果 $V$ 是有限维的，则根据“映射到更高维空间上的线性映射不是满射”（原书3.24）的逆否命题，$dim V >= dim W$。因此可设 $v_1, dots, v_n$ 是 $V$ 上的一个线性无关向量组。如果 $V$ 是无限维的，自然也可以取 $v_1, dots, v_n$ 为 $V$ 上的线性无关向量组。

	#tab 现在对于 $i in {1, dots, n}$，令 $w_i = T v_i$。根据@E-indep-preservance-under-inj，$w_1, dots, w_n$ 是线性无关的。进一步，根据“长度恰当的线性无关组是基”（原书2.38），$w_1, dots, w_n$ 是 $W$ 的一组基。于是，根据线性映射引理（原书3.4），存在 $S in LinearMap(W, V)$，使得对于任意 $i in {1, dots, n}$，有 $S w_i = v_i$。

	#tab 设 $w in W$，则可以将 $w$ 表示为 $w = a_1 w_1 + dots.c + a_n w_n$，其中 $a_1, dots, a_n in FF$。则

	$ T S w &= T (a_1 S w_1 + dots.c + a_n S w_n) \
		&= T (a_1 v_1 + dots.c + a_n v_n) \
		&= a_1 T v_1 + dots.c + a_n T v_n \
		&= a_1 w_1 + dots.c + a_n w_n = w $

	#tab 这说明 $T S$ 确实是 $W$ 上的恒等映射。

	#tab 现在假设存在 $S in LinearMap(W, V)$，使得 $T S$ 是 $W$ 上的恒等映射。设 $w in W$，则可取 $v = S w in V$，使得 $T v = T S w = w$。这说明对于任意 $w in W$，都存在一个向量在 $V$ 中，使得其通过 $T$ 映射到该向量。因此 $T$ 是满射。
]

#exercise_sol(type: "proof")[
	设 $V$ 是有限维向量空间，$T in LinearMap(V, W)$，$U$ 是 $W$ 的子空间。证明：${v in V : T v in U}$ 是 $V$ 的子空间，且

	$ dim {v in V : T v in U} = dim null T + dim (U inter range T) $
][
	记 $V_U = {v in V : T v in U}$。为了说明 $V_U$ 是 $V$ 的子空间，我们逐条验证“子空间的条件”（原书1.34）中给出的要求：

	/ 加法单位元: $0 in V_U$。 \
		证明：根据“线性映射将 $0$ 映射到 $0$”（原书3.10），有 $T 0 = 0 in U$，因此 $0 in V_U$。

	/ 加法封闭性: $u, w in V_U$ 意味着 $u + w in V_U$。 \
		证明：设 $u, w in V_U$，则 $T u in U$ 且 $T w in U$。因此 $T (u + w) = T u + T w in U$，即 $u + w in V_U$。

	/ 乘法封闭性: $lambda in FF$ 且 $v in V_U$ 意味着 $lambda v in V_U$。 \
		证明：设 $v in V_U$，则 $T v in U$。因此 $T (lambda v) = lambda T v in U$，即 $lambda v in V_U$。

	#tab 这说明 $V_U$ 是 $V$ 的子空间。

	#tab 现在证明 $dim V_U = dim null T + dim (U inter range T)$。设 $v_1, dots, v_m$ 是 $V_U$ 的一组基，根据“每个线性无关组都可以扩展为基”（原书2.31），存在 $v_(m+1), dots, v_n in V$，使得向量组 $v_1, dots, v_n$ 是 $V$ 的一组基。

	#tab 根据线性映射引理（原书3.4），存在 $restricted(T, V_U) in LinearMap(V_U, U)$，使得对于任意 $i in {1, dots, m}$，有 $restricted(T, V_U) v_i = T v_i$。

	#tab 首先，我们证明 $dim null restricted(T, V_U) = dim null T$。设 $v in null restricted(T, V_U)$，则 $restricted(T, V_U) v = 0$，因此 $T v = 0$，即 $v in null T$。这说明 $null restricted(T, V_U) subset.eq null T$。另一方面，设 $v in null T$，则 $T v = 0 in U$，因此 $v in V_U$，故 $restricted(T, V_U) v = 0$，即 $v in null restricted(T, V_U)$。这说明 $null T subset.eq null restricted(T, V_U)$。因此 $dim null restricted(T, V_U) = dim null T$。

	#tab 其次，我们证明 $dim range restricted(T, V_U) = dim (U inter range T)$。设 $w in range restricted(T, V_U)$，则存在 $v in V_U$，使得 $restricted(T, V_U) v = w$。因此 $T v = w$，且 $T v in U$，即 $w in U inter range T$。这说明 $range restricted(T, V_U) subset.eq U inter range T$。

	#tab 另一方面，设 $w in U inter range T$，则存在 $v in V$，使得 $T v = w$ 且 $w in U$。由于 $v in V_U$，因此 $restricted(T, V_U) v = w$。这说明 $U inter range T subset.eq range restricted(T, V_U)$。因此 $dim range restricted(T, V_U) = dim (U inter range T)$。

	#tab 现在根据线性映射基本定理（原书3.21），有

	$ dim V_U = dim null restricted(T, V_U) + dim range restricted(T, V_U) $

	#tab 代入上面的结果，得到 $dim V_U = dim null T + dim (U inter range T)$。
]

#exercise_sol(type: "proof")[
	设 $U$ 和 $V$ 都是有限维向量空间，$S in LinearMap(V, W)$，$T in LinearMap(U, V)$. 证明：

	$ dim null S T <= dim null S + dim null T $
][
	#let TN = $restricted(T, N)$
	#show: math_numbering(true)
	令 $N = null S T$。由于 $S T in LinearMap(U, W)$，故 $N$ 是 $U$ 的子空间。设 $u_1, dots, u_m$ 是 $N$ 的一组基。根据线性映射引理（原书3.4），存在 $TN in LinearMap(N, V)$，使得 $TN u_i = T u_i$。设 $u in N$，根据零空间的定义（原书3.11），有 $S T u = 0$，故 $range TN subset.eq null S$，即

	$ dim range TN <= dim null S $ <3B-c-range-TN-leq-null-S>

	#tab 根据线性映射基本定理（原书3.21），有

	$ dim N = dim null TN + dim range TN $ <3B-c-dim-N-eq-null-TN-plus-range-TN>

	#tab 注意到

	$ null TN = {u in N : TN u = 0} = {u in N : T u = 0} = N inter null T $ <3B-c-null-TN-eq-N-inter-null-T>

	#tab 将@3B-c-range-TN-leq-null-S 和@3B-c-null-TN-eq-N-inter-null-T 代入@3B-c-dim-N-eq-null-TN-plus-range-TN，得到
	#show: math_numbering(false)

	$ dim N <= dim (N inter null T) + dim null S $

	#tab 由于 $N inter null T subset.eq null T$，根据子空间的维数（原书2.37），$dim (N inter null T) <= dim null T$，因此 $dim null S T <= dim null T + dim null S$。
]

#exercise_sol(type: "proof")[
	设 $U$ 和 $V$ 都是有限维向量空间，$S in LinearMap(V, W)$，$T in LinearMap(U, V)$. 证明：

	$ dim range S T <= min{dim range S, dim range T} $
][
	首先证明 $dim range S T <= dim range S$。设 $u in U$，则 $S T u = S (T u) in range S$，故 $range S T subset.eq range S$，即 $dim range S T <= dim range S$。

	#let SI = $restricted(S, I)$
	#tab 现在证明 $dim range S T <= dim range T$。令 $I = range T$，则 $I$ 是 $V$ 的子空间。根据线性映射引理（原书3.4），存在 $SI in LinearMap(I, W)$，使得对于任意 $v in I$，有 $SI v = S v$。设 $u in U$，则 $T u in I$，因此 $S T u = SI (T u)$。故 $range S T = range SI T subset.eq range SI$，即 $dim range S T <= dim range SI$。

	#tab 由于 $SI$ 是从 $I$ 到 $W$ 的线性映射，根据线性映射基本定理（原书3.21），有

	$ dim I = dim null SI + dim range SI $

	#tab 即 $dim I >= dim range SI$，又因为 $dim range S T <= dim range SI$，故 $dim range S T <= dim range T$。

	#tab 综上所述，$dim range S T <= min{dim range S, dim range T}$。
]

#exercise_sol(type: "answer")[
	+ 设 $dim V = 5$，且 $S, T in LinearMap(V)$，使得 $S T = 0$。证明 $dim range T S <= 2$；
	+ 给出一例：$S, T in LinearMap(FF^5)$，使得 $S T = 0$ 且 $dim range T S = 2$。
][
	对于（a），根据线性映射基本定理（原书3.21），有

	$ dim V &= dim null S + dim range S \
		dim V &= dim null T + dim range T $

	#tab 设 $v in V$，则 $S (T v) = S T v = 0$，故 $range T subset.eq null S$，即 $dim range T <= dim null S$。再代入 $dim V = 5$，整理得

	$ dim range T + dim range S <= dim null S + dim range S = 5 $

	#tab 注意到 $3 + 3 = 6 > 5$，故 $dim range T < 3$ 或 $dim range S < 3$。分类讨论：当 $dim range T < 3$ 时，即 $dim range T <= 2$。考虑到

	$ range T S = {T v : v in range S} subset.eq range T $

	#tab 这说明 $dim range T S <= dim range T <= 2$。

	#tab 另一方面，当 $dim range S < 3$ 时，即 $dim range S <= 2$，故 $dim null S >= 3$。根据“线性映射将 $0$ 映射到 $0$”（原书3.10），$0 in null T$，故

	$ null S = {v in V : S v = 0} subset.eq {v in V : S v in null T} = null T S $

	#tab 这说明 $3 <= dim null S <= dim null T S$，再根据线性映射基本定理（原书3.21），可得 $dim range T S <= 2$。

	#tab 对于（b），设 $v_1, dots, v_5$ 是 $FF^5$ 的一组基。根据线性映射引理（原书3.4），存在 $S, T in LinearMap(V)$，使得 $S v_1 = S v_2 = S v_3 = 0$，$S v_4 = v_4$，$S v_5 = v_5$，以及 $T v_1 = T v_2 = T v_3 = 0$，$T v_4 = v_1$，$T v_5 = v_2$。

	#tab 设 $v in FF^5$，将 $v$ 表示为 $v = a_1 v_1 + dots.c + a_5 v_5$，其中 $a_1, dots, a_5 in FF$。则

	$ S T v &= S (a_1 T v_1 + dots.c + a_5 T v_5) \
		&= S (a_4 v_1 + a_5 v_2) \
		&= a_4 S v_1 + a_5 S v_2 \
		&= 0 $

	#tab 这说明 $S T = 0$。而

	$ T S v &= T (a_1 S v_1 + dots.c + a_5 S v_5) \
		&= T (a_4 v_4 + a_5 v_5) \
		&= a_4 T v_4 + a_5 T v_5 \
		&= a_4 v_1 + a_5 v_2 $

	#tab 这说明 $range T S = span(v_1, v_2)$，因此 $dim range T S = 2$。综上所述，$S, T in LinearMap(FF^5)$，使得 $S T = 0$ 且 $dim range T S = 2$。
]

#exercise_sol(type: "proof", label: "tricky")[
	设 $W$ 是有限维向量空间，$S, T in LinearMap(V, W)$。证明：$null S subset.eq null T$，当且仅当，存在 $E in LinearMap(W)$，使得 $T = E S$。
][
	首先假设 $null S subset.eq null T$。令 $U = range S$，设 $w_1, dots, w_m$ 是 $U$ 的一组基。可以找到 $v_1, dots, v_m in V$，使得对于 $i in {1, dots, m}$， $S v_i = w_i$。

	#let EU = $restricted(E, U)$
	#tab 根据线性映射引理（原书3.4），存在 $EU in LinearMap(U, W)$，使得对于任意 $i in {1, dots, m}$，有 $EU w_i = T v_i$。进一步，根据#exercise_ref(<E-extend-linear-map>)，存在 $E in LinearMap(W)$，使得对于任意 $u in U$，有 $E u = EU u$。

	#tab 设 $v in V$，将 $S v$ 表示为 $S v = a_1 w_1 + dots.c + a_m w_m$，其中 $a_1, dots, a_m in FF$。则

	$ S v = u = sum_(k = 1)^m c_k w_k = sum_(k = 1)^m c_k S v_k = S (sum_(k = 1)^m c_k v_k) $

	#let vd = $v_Delta$
	#tab 令 $vd = v - sum_(k = 1)^m c_k v_k$，则 $S vd = 0$，即 $vd in null S subset.eq null T$，故 $T vd = 0$，即

	$ T v = T (sum_(k = 1)^m c_k v_k)
		= E (sum_(k = 1)^m c_k w_k)
		= E S v $

	#tab 这说明 $T = E S$。

	#tab 另一方面，现在假设存在 $E in LinearMap(W)$，使得 $T = E S$。设 $v in null S$，即 $S v = 0$，则 $T v = E S v = E 0 = 0$，故 $v in null T$。这说明 $null S subset.eq null T$。

	#tab 综上所述，$null S subset.eq null T$，当且仅当，存在 $E in LinearMap(W)$，使得 $T = E S$。
]

#exercise_sol(type: "proof")[
	设 $V$ 是有限维向量空间，$S, T in LinearMap(V)$。证明：$range S subset.eq range T$，当且仅当，存在 $E in LinearMap(V)$，使得 $S = T E$。
][
	首先假设 $range S subset.eq range T$。设 $v_1, dots, v_m$ 是 $V$ 的一组基。对于每个 $i in {1, dots, m}$，由于 $S v_i in range S subset.eq range T$，因此存在 $u_i in V$，使得 $T u_i = S v_i$。

	#tab 根据线性映射引理（原书3.4），存在 $E in LinearMap(V, V)$，使得对于任意 $i in {1, dots, m}$，有 $E v_i = u_i$。设 $v in V$，将 $v$ 表示为 $v = a_1 v_1 + dots.c + a_m v_m$，其中 $a_1, dots, a_m in FF$。则

	$ S v = S (sum_(k = 1)^m a_k v_k) = T (sum_(k = 1)^m a_k u_k) = T (sum_(k = 1)^m a_k E v_k) = T E v $

	#tab 这说明 $S = T E$。

	#tab 另一方面，现在假设存在 $E in LinearMap(V)$，使得 $S = T E$。设 $w in range S$，则存在 $v in V$，使得 $S v = w$。因此

	$ w = S v = T E v = T (E v) in range T $

	#tab 这说明 $range S subset.eq range T$。

	#tab 综上所述，$range S subset.eq range T$，当且仅当，存在 $E in LinearMap(V)$，使得 $S = T E$。
]

#exercise_sol(type: "proof")[
	设 $P in LinearMap(V)$，且 $P^2 = P$。证明：$V = null P plus.circle range P$。
][
	设 $v in V$，则 $P v = P (P v)$，故 $P (v - P v) = 0$，即 $v - P v in null P$，另一方面，$P v in range P$，即

	$ v = (v - P v) + P v $

	#tab 其中 $v - P v in null N$ 且 $P v in range P$，故 $V = null P + range P$。

	#tab 下面说明这个和是直和。设 $v in null P inter range P$，则 $P v = 0$ 且存在 $w in V$，使得 $v = P w$。故
	
	$ 0 = P v = P^2 w = P w = v $
	
	#tab 即 $null P inter range P = {0}$。因此，根据“两个子空间的直和”（原书1.46），得 $V = null P plus.circle range P$。
]

#exercise_sol(type: "proof", label: "tricky", ref: <E-Poly-lower-const-degree-surj>)[
	设 $D in LinearMap(Poly(RR))$，满足对于任意非常数多项式 $p in Poly(RR)$，都有 $deg D p = (deg p) - 1$。证明：$D$ 是满射。

	#note[上面的记号 $D$ 是用来让你想起微分映射#footnote[注意，微分映射是满足题设条件的映射，但并非满足题设条件的映射就一定是微分映射。]，它将多项式 $p$ 映射到其导数 $p'$。]
][
	对于 $k in NN^+$，令 $p_k in Poly(RR)$ 为 $z |-> z^k$，以及 $q_(k - 1) = D p_k$。于是 $deg p_k = k$，故 $deg q_k = deg q_(k + 1) - 1 = k$。设 $r in Poly(RR)$，使得 $deg r = m$，故 $r in Poly_m (RR)$。

	#tab 根据#exercise_ref(<E-Poly-space-basis>)，$q_0, dots, q_m$ 是 $Poly_m (RR)$ 的一组基。故存在 $a_0, dots, a_m in RR$，使得
	
	$ r = sum_(k = 0)^m a_k q_k = sum_(k = 0)^m a_k D p(k + 1) = D (sum_(k = 0)^m a_k p_(k + 1)) $

	#tab 这说明 $r$ 可以被 $sum_(k = 0)^m a_k p_(k + 1) in Poly(RR)$ 映射到，因此 $D$ 是满射。
]

#exercise_sol(type: "proof")[
	设 $p in Poly(RR)$。证明：存在多项式 $q in Poly(RR)$，使得 $5 q'' + 3q' = p$。

	#note[这道题不一定要用线性代数，但是线性代数的解答更有趣。]
][
	令 $Poly(RR)$ 上的映射 $T$ 为 $p |-> 5p'' + 3p'$，容易验证 $T$ 为线性映射，且对于任意 $p in Poly(RR)$，$deg T p = deg p - 1$。于是，根据@E-Poly-lower-const-degree-surj，$T$ 是满射。

	#tab 这说明，对于任意 $p in Poly(RR)$，都存在$q in Poly(RR)$，使得 $T q = p$，即 $5 q'' + 3q' = p$。
]

#exercise_sol(type: "proof")[
	设 $phi in LinearMap(V, FF)$，$u in V$，满足 $phi != 0$ 且 $u in.not null phi$。证明：

	$ V = null phi plus.circle {a u : a in FF} $
][
	设 $v in V$，满足 $phi v != 0$。令 $k = (phi v) / (phi u) in FF$，则 $phi (k u) = phi v$，故 $phi (v - k u) = 0$，即 $v - k u in null phi$。因此

	$ v = (v - k u) + k u $

	#tab 其中 $v - k u in null phi$ 且 $k u in {a u : a in FF}$，故 $V = null phi + {a u : a in FF}$。现在说明这个和是直和：将 $0$ 表示为 $0 = v + w$，其中 $v in null phi$ 且 $w in {a u : a in FF}$，于是

	$ phi 0 = phi (v + w) = phi w $

	#tab 设 $w = a u$，则 $phi w = a phi u$，由于 $phi u != 0$，故 $a = 0$，即 $w = 0$。进一步，由于 $0 = v + w$，故 $v = 0$。根据直和的条件（原书1.45），得 $V = null phi plus.circle {a u : a in FF}$。
]
