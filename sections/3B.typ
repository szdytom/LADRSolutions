#import "../styles.typ": exercise_sol, tab, exercise_ref
#import "../math.typ": null, range, LinearMap, span

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

	#tab 根据线性映射引理（原书3.4），存在 $T in LinearMap(V, W)$，使得对于任意 $i in {1, dots, m}$，有 $T v_i = w_i$。设 $v in V$。假设 $T v = 0$，将 $v$ 表示为

	$ v = z_1 v_1 + dots.c + z_m v_m $

	#tab 其中 $z_1, dots, z_m in FF$。则

	$ T v = z_1 T v_1 + dots.c + z_m T v_m = z_1 w_1 + dots.c + z_m w_m = 0$

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

	#tab 根据线性映射引理（原书3.4），存在 $T in LinearMap(V, W)$，使得对于任意 $i in {1, dots, n}$，有 $T v_i = w_i$，且对于任意 $i in {n+1, dots, m}$，$T v_i = 0$。设 $w in W$。将 $w$ 表示为

	$ w = z_1 w_1 + dots.c + z_n w_n $

	#tab 其中 $z_1, dots, z_m in FF$。则

	$ w = z_1 T v_1 + dots.c + z_n T v_n = T (z_1 v_1 + dots.c + z_n v_n) $

	#tab 故 $range T = W$，即 $T$ 是满射，因此 $T in.not S$。

	#tab 再次利用线性映射引理（原书3.4），存在 $R in LinearMap(V, W)$，使得 $R v_1 = w_1$，且对于任意 $i in {2, dots, n}$，$R v_i = 0$。由于 $n >= 2$，$w_1, w_2$ 线性无关，根据#exercise_ref(<E-when-1-or-2-vectors-indep>)，不存在 $lambda in FF$，使得 $w_2 = lambda w_1$，即 $w in.not range R$，故 $R$ 不是满射。

	#tab 反证假设 $T - R$ 是满射，则存在 $v in V$ 使得 $(T - R) v = w_1$。将 $v$ 表示为

	$ v = z_1 v_1 + dots.c + z_m v_m $

	#tab 其中 $z_1, dots, z_m in FF$。则

	$ w_1 = (T - R) v &= T v - R v \
		&= z_1 T v_1 + dots.c + z_m T v_m + z_1 R v_1 + dots.c + z_m R v_m \
		&= z_1 w_1 + dots.c + z_n w_n - z_1 w_1 \
		&= z_2 w_2 + dots.c + z_n w_n in span(w_2, dots, w_m) $

	#tab 根据#exercise_ref(<E-when-vector-list-append-remains-indep>)，$w_2, dots, w_n, w_1$ 不是线性无关的，矛盾。故 $T - R$ 不是满射。现在 $R, T - R in S$，注意到

	$ R + (T - R) = T in.not S $

	#tab 这说明 $S$ 违反了子空间的条件（原书1.34）中对加法封闭性的要求，故 $S$ 不是 $LinearMap(V, W)$ 的子空间。
]

#exercise_sol(type: "proof")[
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
	设 $w in range T$，则可设 $v in V$，使得 $T v = w$。将 $v$ 表示为

	$ v = z_1 v_1 + dots.c + z_n v_n $

	#tab 其中 $z_1, dots, z_n in FF$。则

	$ w = T v = T (z_1 v_1 + dots.c + z_n v_n) = z_1 T v_1 + dots.c + z_n T v_n $

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

	$ dim RR^8 = dim null T + dim range T $

	#tab 由于 $null T = U$，因此 $dim null T = 3$。解得 $dim range T = 5$。根据“某空间中与之维数相同的子空间即为该空间本身”（原书2.39），$range T = RR^5$，即 $T$ 是满射。
]
