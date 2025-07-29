#import "../styles.typ": exercise_sol, tab
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

	#tab 对于 (b)，结论是 $T$ 是单射等价于向量组 $v_1, dots, v_m$ 线性无关。首先假设 $T$ 是单射，则根据“单射性 $<==>$ 零空间为 ${0}$”（原书3.15），$null T = {0}$。因此 $z_1 v_1 + dots.c + z_m v_m = 0$ 仅当 $z_1 = dots = z_m = 0$，这说明向量组 $v_1, dots, v_m$ 线性无关。

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
