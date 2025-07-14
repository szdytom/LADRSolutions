#import "../styles.typ": exercise_sol, note, tab
#import "../math.typ": span

#exercise_sol(type: "proof")[
	证明：$RR^2$ 的子空间恰有 ${0}$，$RR^2$ 中所有过原点的直线，以及 $RR^2$ 本身。
][
	设 $U$ 是 $RR^2$ 的子空间，根据子空间的维数性质（原书2.37），有 $dim U in {0, 1, 2}$。

	- 如果 $dim U = 0$，则 $U = span() = {0}$；

	- 如果 $dim U = 1$，则存在一个非零向量 $v$，使得 $U = span(v)$，即 $U$ 是过原点的直线；

	- 如果 $dim U = 2$，则根据满维数的子空间等于整个空间（原书2.39），$U = RR^2$。

	#tab 综上所述，$RR^2$ 的子空间恰有 ${0}$，$RR^2$ 中所有过原点的直线，以及 $RR^2$ 本身。
]
