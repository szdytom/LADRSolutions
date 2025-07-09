#import "../styles.typ": exercise_sol, tab
#import "../math.typ": span

#exercise_sol(type: "answer")[
	求 $FF^3$ 中的四个不同的向量，其张成空间为

	$ {(x, y, z) in FF^3 : x + y + z = 0} $
][
	取 $u = (1, 0, -1)$，$v = (0, 1, -1)$。根据张成空间的定义，

	$ span(u, v) = {(x, y, -x-y) in FF^3 : x,y in FF} $

	#tab 这已经是题目所要求的张成空间了。为了补足四个不同的向量，我们可以取 $w_1 = 2u$，$w_2 = 2v$。

	#tab 综上所述，题目要求的四个不同的向量可以是

	$ (1, 0, -1)"，" wide (0, 1, -1)"，" wide (2, 0, -2)"，" wide (0, 2, -2) $
]

#exercise_sol(type: "proof")[
	证明或证伪：如果 $v_1$，$v_2$，$v_3$ 和 $v_4$ 张成 $V$，那么向量组

	$ v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4 $

	也张成 $V$。
][
	证明：设 $v_1$，$v_2$，$v_3$ 和 $v_4$ 张成 $V$，则任意 $v in V$ 都可以表示为

	$ v = a_1 v_1 + a_2 v_2 + a_3 v_3 + a_4 v_4 $

	#tab 其中 $a_i in FF$。我们可以将其改写为

	$ v = a_1 (v_1 - v_2) + (a_1 + a_2) (v_2 - v_3) + (a_2 + a_3) (v_3 - v_4) + (a_3 + a_4) v_4 $

	#tab 这说明 $v$ 可以用 $v_1 - v_2$，$v_2 - v_3$，$v_3 - v_4$ 和 $v_4$ 线性表示，因此它们张成 $V$。
]
