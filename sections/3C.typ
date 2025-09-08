#import "../styles.typ": exercise_sol, note, tab
#import "../math.typ": LinearMap, range, Matrix, null, span

#exercise_sol(type: "proof", label: "tricky")[
	设 $T in LinearMap(V, W)$。证明：对于 $V$ 和 $W$ 的任意基，$T$ 所对应的矩阵至少有 $dim range T$ 个非零元素。
][
	设 $v_1, dots, v_n$ 是 $V$ 的一组基，$w_1, dots, w_m$ 是 $W$ 的一组基，$A$ 为 $T$ 在这两组基下的矩阵表示。则对于 $i in {1, dots, m}$ 和 $j in {1, dots, n}$，

	$ T v_j = sum_(k=1)^m A_(k, j) w_k $

	#tab 设 $p = dim null T$，且 $q = dim range T$，则根据线性映射基本定理（原书3.21），$p + q = n$。则在 $v_1, dots, v_n$ 中至多有 $p$ 个向量属于 $null T$，也即至少有 $q$ 个向量不属于 $null T$。不妨设 $v_1, dots, v_q$ 不属于 $null T$，则对于 $j in {1, dots, q}$，我们有

	$ A_(1, j) w_1 + dots.c + A_(m, j) w_m = T v_j != 0 $

	#tab 考虑到 $w_1, dots, w_m$ 线性无关，只能有至少一个 $k in {1, dots, m}$ 使得 $A_(k, j) != 0$。因此，矩阵 $A$ 至少有 $q$ 个非零元素。
]

#exercise_sol(type: "proof")[
	设 $T in LinearMap(V, W)$，其中 $V$ 和 $W$ 都是有限维的非零向量空间。证明：$dim range T = 1$，当且仅当，存在 $V$ 的一组基和 $W$ 的一组基，使得 $Matrix(T)$ 的所有元素都是 $1$。
][
	首先证明充分性。设 $v_1, dots, v_n$ 是 $V$ 的一组基，$w_1, dots, w_m$ 是 $W$ 的一组基，且在这两组基下的 $Matrix(T)$ 的所有元素都是 $1$。则对于 $j in {1, dots, n}$，

	$ T v_j = sum_(k=1)^m 1 w_k = w_1 + dots.c + w_m $

	#tab 故 $T v_1 = dots.c = T v_n$，记为 $w$。设 $v in V$，则存在 $a_1, dots, a_n in FF$ 使得 $v = a_1 v_1 + dots.c + a_n v_n$。因此，

	$ T v = a_1 T v_1 + dots.c + a_n T v_n = (a_1 + dots.c + a_n) w in span(w) $

	#tab 故 $range T = span(w)$，因此 $dim range T = 1$。

	#tab 另一方面，证明必要性。设 $dim range T = 1$，则存在 $w in W$ 使得 $range T = span(w)$。设 $u_1, dots, u_n$ 是 $V$ 的一组基，则对于 $j in {1, dots, n}$，存在 $a_j in FF$ 使得 $T u_j = a_j w$，其中 $a_j != 0$。

	#tab 现在，对于 $j in {1, dots, n}$，令 $v_j = u_j slash a_j$，则 $T v_1 = dots.c = T v_n = w$。容易说明 $v_1, dots, v_n$ 也是 $V$ 的一组基。根据每个线性无关组都可被扩充为基（原书2.32），我们可以将 $w$ 扩充为 $W$ 的一组基 $w, w_2, dots, w_m$。

	#tab 令 $w_1 = w - (w_2 + dots.c + w_m)$，则 $w_1, dots, w_m$ 也是 $W$ 的一组基，且 $w_1 + dots.c + w_m = w$。

	#tab 设关于 $v_1, dots, v_n$ 和 $w_1, dots, w_m$ 的 $Matrix(T)$ 的元素为 $A_(i, j)$，则对于 $j in {1, dots, n}$，

	$ sum_(k=1)^m A_(k, j) w_k = T v_j = w $

	#tab 由于 $w_1, dots, w_m$ 线性无关，因此对于 $k in {1, dots, m}$，都有 $A_(k, j) = 1$。因此，$Matrix(T)$ 的所有元素都是 $1$。
]
