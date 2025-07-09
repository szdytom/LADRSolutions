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

	$ (1, 0, -1)"，" (0, 1, -1)"，" (2, 0, -2)"，" (0, 2, -2) $
]

#exercise_sol(type: "proof")[
	证明或证伪：如果 $v_1$，$v_2$，$v_3$ 和 $v_4$ 张成 $V$，那么向量组

	$ v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4 $

	也张成 $V$。
][
	设 $v_1$，$v_2$，$v_3$ 和 $v_4$ 张成 $V$，则任意 $v in V$ 都可以表示为

	$ v = a_1 v_1 + a_2 v_2 + a_3 v_3 + a_4 v_4 $

	#tab 其中 $a_i in FF$。我们可以将其改写为

	$ v = a_1 (v_1 - v_2) + (a_1 + a_2) (v_2 - v_3) + (a_2 + a_3) (v_3 - v_4) + (a_3 + a_4) v_4 $

	#tab 这说明 $v$ 可以用 $v_1 - v_2$，$v_2 - v_3$，$v_3 - v_4$ 和 $v_4$ 线性表示，这表明 $V subset.eq span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4)$。

	#tab 另一方面，设 $v in span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4)$，则 $v$ 可以表示为

	$ v = b_1 (v_1 - v_2) + b_2 (v_2 - v_3) + b_3 (v_3 - v_4) + b_4 v_4 $

	#tab 其中 $b_i in FF$。我们可以将其改写为

	$ v = (b_1 + b_2) v_1 + (b_2 + b_3) v_2 + (b_3 + b_4) v_3 + b_4 v_4 $

	#tab 这说明 $v$ 可以用 $v_1$，$v_2$，$v_3$ 和 $v_4$ 线性表示，这表明 $span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4) subset.eq V$。

	#tab 综上所述，$V = span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4)$，即向量组 $v_1 - v_2$，$v_2 - v_3$，$v_3 - v_4$ 也张成 $V$。
]

#exercise_sol(type: "proof")[
	设 $v_1, dots, v_m$ 是 $V$ 中的一组向量。对于 $k in {1, dots, m}$，令

	$ w_k = v_1 + dots.c + v_k $

	证明：$span(v_1, dots, v_m) = span(w_1, dots, w_m)$。
][
	设 $u in span(v_1, dots, v_m)$，则 $u$ 可以表示为

	$ u = a_1 v_1 + dots.c + a_m v_m $

	#tab 其中 $a_i in FF$。我们可以将其改写为

	$ u = b_1 w_1 + dots.c + b_m w_m $

	#tab 其中对于 $k in {1, dots, m}$，$b_k = a_k - a_(k + 1)$（方便起见，我们设 $a_(m+1) = 0$。为了验证这一点，我们带入 $b_i$ 和 $w_i$ 的定义，得到

	$ b_1 w_1 + dots.c + b_m w_m
		&= sum_(i=1)^m (a_i - a_(i + 1))sum_(j=1)^i v_j \
		&= sum_(i=1)^m sum_(j=1)^i (a_i - a_(i + 1))v_j \
		&= sum_(j=1)^m sum_(i=j)^m (a_i - a_(i + 1))v_j \
		&= sum_(j=1)^m (sum_(i=j)^m a_i - sum_(i=j)^m a_(i + 1)) v_j \
		&= sum_(j=1)^m a_j v_j = u $
	
	#tab 这说明 $u$ 可以用 $w_1, dots, w_m$ 线性表示，因此 $span(v_1, dots, v_m) subset.eq span(w_1, dots, w_m)$。另一方面，设 $u in span(w_1, dots, w_m)$，则 $u$ 可以表示为

	$ u = a_1 w_1 + dots.c + a_m w_m $

	#tab 其中 $a_i in FF$。我们可以将其改写为

	$ u = b_1 v_1 + dots.c + b_m v_m $

	#tab 其中对于 $k in {1, dots, m}$，$b_k = a_k + dots.c + a_m$。为了验证这一点，我们带入 $b_i$ 和 $w_i$ 的定义，得到

	$ b_1 v_1 + dots.c + b_m v_m 
		&= sum_(i=1)^m (sum_(j=i)^m a_j) v_i \
		&= sum_(i=1)^m sum_(j=i)^m a_j v_i \
		&= sum_(j=1)^m sum_(i=1)^j a_j v_i \
		&= sum_(j=1)^m a_j sum_(i=1)^j v_i \
		&= sum_(j=1)^m a_j w_j = u $

	#tab 这说明 $u$ 可以用 $v_1, dots, v_m$ 线性表示，因此 $span(w_1, dots, w_m) subset.eq span(v_1, dots, v_m)$。
	
	#tab 综上所述，$span(v_1, dots, v_m) = span(w_1, dots, w_m)$。	
]
