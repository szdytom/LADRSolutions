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
