#import "../styles.typ": exercise_sol, note, tab, exercise_ref
#import "../math.typ": LinearMap, range, Matrix, null, span, Poly

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

#exercise_sol(type: "proof")[
	设 $v_1, dots, v_n$ 是 $V$ 的一组基，$w_1, dots, w_m$ 是 $W$ 的一组基。证明：

	+ 若 $S, T in LinearMap(V, W)$，则 $M(S + T) = M(S) + M(T)$；
	+ 若 $lambda in FF$，$T in LinearMap(V, W)$，则 $M(lambda T) = lambda M(T) $。

	#note[本题是在让你验证原书3.35和3.38。]
][
	对于（a），记 $A = M(S)$，$B = M(T)$，$C = M(S + T)$。则对于 $j in {1, dots, n}$，有

	$ sum_(k=1)^m C_(k, j) w_k = (S + T) v_j = S v_j + T v_j = sum_(k=1)^m (A_(k, j) + B_(k, j)) w_k $

	#tab 故 $C_(k, j) = A_(k, j) + B_(k, j)$，即 $C = A + B$。

	#tab 对于（b），记 $A = M(T)$，$B = M(lambda T)$。则对于 $j in {1, dots, n}$，有

	$ sum_(k=1)^m B_(k, j) w_k = (lambda T) v_j = lambda (T v_j) = sum_(k=1)^m (lambda A_(k, j)) w_k $

	#tab 故 $B_(k, j) = lambda A_(k, j)$，即 $B = lambda A$。
]

#exercise_sol(type: "answer", ref: <E-mat-of-derivation-of-poly3>)[
	设 $D in LinearMap(Poly_3(RR), Poly_2(RR))$ 是微分映射，定义为 $p |-> p'$。求 $Poly_3(RR)$ 的一个基和 $Poly_2(RR)$ 的一个基，使得 $Matrix(D)$ 为

	$ mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0) $

	#note[和原书3.33比较一下。下一题拓展了本题。]
][
	取 $Poly_3(RR)$ 的基为 $x^3, x^2, x, 1$，$Poly_2(RR)$ 的基为 $3 x^2, 2 x, 1$。则

	$ D x^3 &= 3 x^2 &= 1 dot.c (3 x^2) + 0 dot.c (2 x) + 0 dot.c 1 \
		D x^2 &= 2 x &= 0 dot.c (3 x^2) + 1 dot.c (2 x) + 0 dot.c 1 \
		D x &= 1 &= 0 dot.c (3 x^2) + 0 dot.c (2 x) + 1 dot.c 1 \
		D 1 &= 1 &= 0 dot.c (3 x^2) + 0 dot.c (2 x) + 0 dot.c 1 $

	#tab 故

	$ Matrix(D) = mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0) $
]

#exercise_sol(type: "proof")[
	设 $V$ 和 $W$ 都是有限维向量空间，$T in LinearMap(V, W)$。证明：存在 $V$ 的一组基和 $W$ 的一组基，使得关于这些基的 $Matrix(T)$ 的第 $k$ 行第 $k$ 列元素为 $1$，其余元素为 $0$，其中 $k in {1, dots, dim range T}$。
][
	设向量组 $v_1, dots, v_ell$ 是 $null T$ 的一组基，根据“每个线性无关组都可被扩充成基“（原书2.32），可以找到 $v_(ell + 1), dots, v_m$，使得 $v_1, dots, v_m$ 是 $V$ 的一组基。对于 $j in {1, dots, m}$，令 $w_j = T v_j$，则根据#exercise_ref(<E-domain-span-to-range-span>)，$w_1, dots, w_m$ 张成 $range T$。

	#tab 另一方面，注意到 $w_1 = dots.c = w_ell = 0$，因此根据线性相关性引理（原书2.19），可得 $w_(ell + 1), dots, w_m$ 张成 $range T$。根据线性映射基本定理（原书3.21），

	$ dim range T = dim V - dim null T = m - ell $

	#tab 再根据“长度恰当的张成组是基”（原书2.42），可知 $w_(ell + 1), dots, w_m$ 是 $range T$ 的一组基。

	#tab 现在，将 $w_(ell + 1), dots, w_m$ 扩充为 $W$ 的一组基 $u_1, dots, u_n$，其中 $u_1 = w_(ell + 1), dots, u_(m - ell) = w_m$。现在考虑关于基 $v_(ell + 1), dots, v_m, v_1, dots, v_ell$（注意顺序）和基 $u_1, dots, u_n$ 的 $Matrix(T)$，则对于 $j in {1, dots, m - ell}$，

	$ T v_(ell + j) = u_j = 0 dot.c u_1 + dots.c + 0 dot.c u_(j-1) + 1 dot.c u_j + 0 dot.c u_(j+1) + dots.c + 0 dot.c u_n $

	#tab 而对于 $j in {m - ell + 1, dots, m}$，$T v_j = 0$。因此，关于这些基的 $Matrix(T)$ 的第 $k$ 行第 $k$ 列元素为 $1$，其余元素为 $0$，其中 $k in {1, dots, dim range T}$。
]

#exercise_sol(type: "proof")[
	设 $v_1, dots, v_m$ 是 $V$ 的一组基，$W$ 是有限维向量空间。设 $T in LinearMap(V, W)$。证明：存在 $W$ 的一组基 $w_1, dots, w_n$，使得关于基 $v_1, dots, v_m$ 和 $w_1, dots, w_n$ 的 $Matrix(T)$ 的第一行第一列的元素为 $1$ 或 $0$，且第一列的其余元素均为 $0$。

	#note[不同于@E-mat-of-derivation-of-poly3，在本题中，$V$ 的基是给定的而不是由你给定的。]
][
	分类讨论，当 $T v_1 = 0$ 时，任取 $W$ 的一组基为 $w_1, dots, w_n$，则

	$ T v_1 = 0 = 0 dot.c w_1 + dots.c + 0 dot.c w_n $

	#tab 于是 $Matrix(T)$ 的第一列的元素均为 $0$。

	#tab 当 $T v_1 != 0$ 时，取 $w_1 = T v_1$。根据“每个线性无关组都可被扩充成基”（原书2.32），可以将 $w_1$ 扩充为 $W$ 的一组基 $w_1, dots, w_n$。则

	$ T v_1 = w_1 = 1 dot.c w_1 + 0 dot.c w_2 + dots.c + 0 dot.c w_n $

	#tab 于是 $Matrix(T)$ 的第一行第一列的元素为 $1$，且第一列的其余元素均为 $0$。

	#tab 综上所述，存在 $W$ 的一组基 $w_1, dots, w_n$，使得关于基 $v_1, dots, v_m$ 和 $w_1, dots, w_n$ 的 $Matrix(T)$ 的第一行第一列的元素为 $1$ 或 $0$，且第一列的其余元素均为 $0$。
]
