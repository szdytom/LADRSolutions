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
