#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot

#import "../styles.typ": exercise_sol, tab, exercise_ref, math_numbering, ploting-styles
#import "../math.typ": span, ii, Poly

#exercise_sol(type: "answer")[
	求 $FF^3$ 中的四个不同的向量，其张成空间为

	$ {(x, y, z) in FF^3 : x + y + z = 0} $
][
	取 $u = (1, 0, -1)$，$v = (0, 1, -1)$。根据张成空间的定义，

	$ span(u, v) = {(x, y, -x-y) in FF^3 : x,y in FF} $

	#tab 这已经是题目所要求的张成空间了。为了补足四个不同的向量，我们可以取 $w_1 = 2u$，$w_2 = 2v$。

	#tab 综上所述，题目要求的四个不同的向量可以是

	$ (1, 0, -1), (0, 1, -1), (2, 0, -2), (0, 2, -2) $
]

#exercise_sol(type: "proof")[
	证明或证伪：如果向量组 $v_1, v_2, v_3, v_4$ 张成 $V$，那么向量组

	$ v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4 $

	也张成 $V$。
][
	对于任意 $v in V$，可以将其表示为

	$ v = a_1 v_1 + a_2 v_2 + a_3 v_3 + a_4 v_4 $

	#tab 其中 $a_i in FF$。我们可以将其改写为

	$ v = a_1 (v_1 - v_2) + (a_1 + a_2) (v_2 - v_3) + (a_2 + a_3) (v_3 - v_4) + (a_3 + a_4) v_4 $

	#tab 这说明 $v$ 可以用 $v_1 - v_2$，$v_2 - v_3$，$v_3 - v_4$ 和 $v_4$ 线性表示，这表明 $V subset.eq span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4)$。

	#tab 另一方面，设 $v in span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4)$，则 $v$ 可以表示为

	$ v = b_1 (v_1 - v_2) + b_2 (v_2 - v_3) + b_3 (v_3 - v_4) + b_4 v_4 $

	#tab 其中 $b_i in FF$。我们可以将其改写为

	$ v = (b_1 + b_2) v_1 + (b_2 + b_3) v_2 + (b_3 + b_4) v_3 + b_4 v_4 $

	#tab 这说明 $v$ 可以用 $v_1$，$v_2$，$v_3$ 和 $v_4$ 线性表示，这表明 $span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4) subset.eq V$。

	#tab 综上所述，$V = span(v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4)$，即向量组 $v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4$ 也张成 $V$。
]

#exercise_sol(type: "proof", ref: <E-cumulative-sum-span>)[
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

#exercise_sol(type: "proof", ref: <E-when-1-or-2-vectors-indep>)[
	+ 证明：向量空间中长度为 $1$ 的组线性无关，当且仅当组中的该向量不是 $0$；
	+ 证明：向量空间中长度为 $2$ 的组线性无关，当且仅当组中两个向量的任意一个不是另一个的标量倍。
][
	设 $V$ 是向量空间。对于第一个命题，设 $v in V$。首先说明充分性。假设 $v != 0$，根据#exercise_ref(<E-vector-trivial-annihilation>)，使得 $a v = 0$ 成立的 $a in FF$ 的唯一选取方式是 $a = 0$，根据线性无关的定义（原书定义2.15），这表明向量组 $v$ 是线性无关的。

	#tab 然后说明必要性，如果 $v = 0$，则我们有

	$ 0v = 1v = 0 $

	#tab 根据线性无关的定义（原书定义2.15），向量组 $0$ 不是线性无关的。

	#tab 对于第二个命题，设 $v_1, v_2 in V$。首先说明充分性：使用反证法，假设 $v_1$ 和 $v_2$ 不是线性无关的，即存在 $a_1, a_2 in FF$，使得

	$ a_1 v_1 + a_2 v_2 = 0 $

	#tab 其中 $a_1$ 和 $a_2$ 中至少有一个向量不为 $0$。不妨设 $a_1 != 0$，那么，可以整理得

	$ v_1 = - a_2/a_1 v_2 $

	#tab 这表明 $v_1$ 是 $v_2$ 的标量倍，与题目条件矛盾。这说明，$v_1$ 和 $v_2$ 线性无关。

	#tab 然后说明必要性：假设 $v_1$ 和 $v_2$ 线性无关，使用反证法，假设 $v_1$ 和 $v_2$ 中有一个向量是另一个向量的标量倍，不妨设 $v_1 = k v_2$，其中 $k in FF$。注意到，

	$ v_1 + (-k) v_2 = 0 $

	#tab 这与线性无关的定义矛盾。因此，$v_1$ 和 $v_2$ 线性无关当且仅当组中两个向量的任意一个不是另一个的标量倍。
]

#exercise_sol(type: "answer")[
	求一数 $t in RR$，使得向量组

	$ (3, 1, 4), (2, -3, 5), (5, 9, t) $

	在 $RR^3$ 中不是线性无关的。
][
	$t = 2$。为了说明这一点，注意到，

	$ (-3) (3, 1, 4) + 2 (2, -3, 5) + 1 (5, 9, 2) = 0 $

	#tab 根据线性无关的定义（原书定义2.15），这表明向量组 $(3, 1, 4), (2, -3, 5), (5, 9, 2)$ 在 $RR^3$ 中不是线性无关的。
]

#exercise_sol(type: "proof")[
	证明：向量组

	$ (2, 3, 1), (1, -1, 2), (7, 3, c) $

	在 $FF^3$ 中线性相关，当且仅当 $c = 8$。
][
	首先说明充分性：当 $c = 8$ 时，注意到

	$ 16 (2, 3, 1) + 1 (1, -1, 2) + (-5) (7, 3, 8) = 0 $

	#tab 根据线性相关的定义（原书定义2.17），这表明向量组 $(2, 3, 1)$，$(1, -1, 2)$，$(7, 3, 8)$ 在 $FF^3$ 中线性相关。

	#tab 然后说明必要性：使用反证法，假设 $c != 8$ 且向量组 $(2, 3, 1), (1, -1, 2), (7, 3, c)$ 线性相关。根据定义，存在 $a_1, a_2, a_3 in RR$，使得

	$ a_1 (2, 3, 1) + a_2 (1, -1, 2) + a_3 (7, 3, c) = 0 $

	#tab 其中 $a_1, a_2, a_3 in RR$ 中至少有一个不为 $0$。将其展开，得到下面方程组

	$ cases(
		2 &a_1 &+ &a_2 &+ 7 &a_3 &= 0,
		3 &a_1 &- &a_2 &+ 3 &a_3 &= 0,
		&a_1 &+ 2 &a_2 &+ c &a_3 &= 0
	) $

	#tab 由前两个方程，我们可以得到 $a_2 = 3/2 a_1$ 且 $a_3 = -1/2 a_1$，代入第三个方程中，化简得

	$ (c - 8) a_1 = 0 $

	#tab 由于 $c!=8$，只能有 $a_1 = 0$，而这将给出 $a_1 = a_2 = a_3 = 0$，与反证假设矛盾，故假设不成立。

	#tab 综上所述，向量组 $(2, 3, 1), (1, -1, 2), (7, 3, c)$ 在 $RR^3$ 中线性相关当且仅当 $c = 8$。
]

#exercise_sol(type: "proof")[
	+ 证明：如果我们将 $CC$ 视为 $RR$ 上的向量空间，那么向量组 $1 + ii, 1 - ii$ 是线性无关的；
	+ 证明：如果我们将 $CC$ 视为 $CC$ 上的向量空间，那么向量组 $1 + ii, 1 - ii$ 是线性相关的。
][
	利用@E-when-1-or-2-vectors-indep 中的结论，我们只需注意到，

	$ (1 + i) / (1 - i) = ii $

	#tab 考虑到 $ii in CC$ 但是 $ii in.not RR$，因此 $1 + i$ 只在 $CC$ 上是 $1 - ii$ 的标量倍。这表明，如果我们将 $CC$ 视为 $RR$ 上的向量空间，那么向量组 $1 + ii, 1 - ii$ 是线性无关的，而如果我们将 $CC$ 视为 $CC$ 上的向量空间，那么向量组 $1 + ii, 1 - ii$ 是线性相关的。
]

#exercise_sol(type: "proof")[
	设 $v_1, v_2, v_3, v_4$ 是 $V$ 中的线性无关向量组。证明：向量组

	$ v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4 $

	也线性无关。
][
	设 $a_1, a_2, a_3, a_4 in FF$，使得

	$ a_1 (v_1 - v_2) + a_2 (v_2 - v_3) + a_3 (v_3 - v_4) + a_4 v_4 = 0 $

	#tab 整理得到

	$ a_1 v_1 + (a_2 - a_1) v_2 + (a_3 - a_2) v_3 + (a_4 - a_3) v_4 = 0 $

	#tab 由于 $v_1, v_2, v_3, v_4$ 线性无关，根据线性无关的定义（原书定义2.15），只能有

	$ cases(
		a_1 = 0,
		a_2 - a_1 = 0,
		a_3 - a_2 = 0,
		a_4 - a_3 = 0
	) $

	#tab 这说明 $a_1 = a_2 = a_3 = a_4 = 0$。因此，根据线性无关的定义（原书定义2.15），向量组 $v_1 - v_2, v_2 - v_3, v_3 - v_4, v_4$ 线性无关。
]

#exercise_sol(type: "proof")[
	证明或证伪：设 $v_1, dots, v_m$ 与 $V$ 中的线性无关向量组，则向量组

	$ 5v_1 - 4v_2, v_2, v_3, dots, v_m $

	也线性无关。
][
	设 $a_1, dots, a_m in FF$，使得

	$ a_1 (5v_1 - 4v_2) + a_2 v_2 + dots.c + a_m v_m = 0 $

	#tab 整理得到

	$ 5a_1 v_1 + (a_2 - 4a_1) + a_3 v_3 + a_4 v_4 + dots.c + a_m v_m = 0 $

	#tab 由于 $v_1, dots, v_m$ 线性无关，根据线性无关的定义（原书定义2.15），只能有

	$ cases(
		5a_1 = 0,
		a_2 - 4a_1 = 0,
		a_3 = 0,
		a_4 = 0,
		dots.c,
		a_m = 0
	) $

	#tab 这说明 $a_1 = dots.c = a_m = 0$。因此，根据线性无关的定义（原书定义2.15），向量组 $5v_1 - 4v_2, v_2, v_3, dots, v_m$ 线性无关。
]

#exercise_sol(type: "proof")[
	证明或证伪：设 $v_1, dots, v_m$ 是 $V$ 中的线性无关向量组，$lambda in FF$（$lambda != 0$）。则向量组

	$ lambda v_1, dots, lambda v_m $

	也线性无关。
][
	设 $a_1, dots, a_m in FF$，使得

	$ a_1 (lambda v_1) + dots.c + a_m (lambda v_m) = 0 $

	#tab 整理得到

	$ lambda (a_1 v_1 + dots.c + a_m v_m) = 0 $

	#tab 由于 $lambda != 0$，因此 $a_1 v_1 + dots.c + a_m v_m = 0$。由于 $v_1, dots, v_m$ 线性无关，根据线性无关的定义（原书定义2.15），只能有 $a_1 = dots.c = a_m = 0$。因此，根据线性无关的定义（原书定义2.15），向量组 $lambda v_1, dots, lambda v_m$ 线性无关。
]

#exercise_sol(type: "answer")[
	证明或证伪：设 $v_1, dots v_m$ 和 $w_1, dots, w_m$ 都是 $V$ 中的线性无关向量组。则向量组

	$ v_1 + w_1, dots, v_m + w_m $

	也线性无关。
][
	取 $V = RR^2$，并令

	$ v_1 &= (1, 0), wide &v_2 = (0, 1) \
		w_1 &= (0, 1), &w_2 = (1, 0) $

	#tab 容易验证这两个向量组都是 $RR^2$ 中的线性无关向量组。然而，注意到

	$ 1(v_1 + w_1) + (-1)(v_2 + w_2) = 1(1, 1) + (-1)(1, 1) = 0 $

	#tab 根据线性无关的定义（原书定义2.15），这表明向量组 $v_1 + w_1, v_2 + w_2$ 不是线性无关的，因此原命题不成立。
]

#exercise_sol(type: "proof")[
	设 $v_1, dots, v_m$ 是 $V$ 中的线性无关向量组，且 $w in V$。证明：若向量组

	$ v_1 + w, dots, v_m + w $

	线性相关，则 $w in span(v_1, dots, v_m)$。
][
	由于向量组 $v_1 + w, dots, v_m + w$ 线性相关，根据线性相关的定义（原书定义2.17），存在 $a_1, dots, a_m in FF$，使得

	#show: math_numbering(true)
	$ a_1 (v_1 + w) + dots.c + a_m (v_m + w) = 0 $ <2A-vi-plus-w-is-dependent-def>
	#show: math_numbering(false)

	#tab 其中 $a_1, dots, a_m$ 中至少有一个不为 $0$。

	#tab 下面我们说明 $a_1 + dots.c + a_m != 0$。整理@2A-vi-plus-w-is-dependent-def 可得

	$ a_1 v_1 + dots.c + a_m v_m + (a_1 + dots.c + a_m) w = 0 $

	#tab 反证假设 $a_1 + dots.c + a_m = 0$，则 $a_1 v_1 + dots.c + a_m v_m = 0$，而这与线性无关的定义（原书定义2.15）矛盾。因此，我们只能有 $a_1 + dots.c + a_m != 0$。

	#tab 所以，我们可以将@2A-vi-plus-w-is-dependent-def 改写为

	$ w = -(a_1 v_1 + dots.c + a_m v_m) / (a_1 + dots.c + a_m) $

	#tab 更进一步地，对于 $k in {1, dots, m}$，令

	$ b_k = -a_k / (a_1 + dots.c + a_m) $

	#tab 则有

	$ w = b_1 v_1 + dots.c + b_m v_m $

	#tab 根据张成空间的定义（原书定义2.4），这表明 $w in span(v_1, dots, v_m)$。
]

#exercise_sol(type: "proof", ref: <E-when-vector-list-append-remains-indep>)[
	设 $v_1, dots, v_m$ 是 $V$ 中的线性无关向量组，且 $w in V$。证明：

	$ v_1, dots, v_m, w "线性无关" quad <==> quad w in.not span(v_1, dots, v_m) $
][
	首先说明充分性：现在 $v_1, dots, v_m, w$ 线性无关。反证假设 $w in span(v_1, dots, v_m)$，则根据张成空间的定义（原书定义2.4），存在 $a_1, dots, a_m in FF$，使得

	$ w = a_1 v_1 + dots.c + a_m v_m $

	#tab 整理得到

	$ a_1 v_1 + dots.c + a_m v_m + (-1)w = 0 $

	#tab 根据线性无关的定义（原书定义2.15），这与 $v_1, dots, v_m, w$ 线性无关矛盾，因此，$w in.not span(v_1, dots, v_m)$。

	#tab 然后说明必要性：现在 $w in.not span(v_1, dots, v_m)$。反证假设 $v_1, dots, v_m, w$ 线性相关。根据线性相关的定义（原书定义2.17），存在 $a_1, dots, a_(m+1) in FF$，使得

	#show: math_numbering(true)
	$ a_1 v_1 + dots.c + a_m v_m + a_(m+1) w = 0 $ <2A-v-union-w-is-dependent-def>
	#show: math_numbering(false)

	#tab 其中 $a_1, dots, a_(m+1)$ 中至少有一个不为 $0$。我们有 $a_(m+1) != 0$。这是因为，如果 $a_(m+1) = 0$，则我们可以将@2A-v-union-w-is-dependent-def 改写为

	$ a_1 v_1 + dots.c + a_m v_m = 0 $

	#tab 这与题目条件中 $v_1, dots, v_m$ 线性无关矛盾。因此，$a_(m+1) != 0$。

	#tab 所以，我们可以将@2A-v-union-w-is-dependent-def 改写为

	$ w = -(a_1 v_1 + dots.c + a_m v_m) / a_(m+1) $

	#tab 更进一步地，对于 $k in {1, dots, m}$，令

	$ b_k = -a_k / a_(m+1) $

	#tab 则有

	$ w = b_1 v_1 + dots.c + b_m v_m $

	#tab 这表明 $w in span(v_1, dots, v_m)$，与反证假设 $w in.not span(v_1, dots, v_m)$ 矛盾。因此，$v_1, dots, v_m, w$ 线性无关。

	#tab 综上所述，$v_1, dots, v_m, w$ 线性无关当且仅当 $w in.not span(v_1, dots, v_m)$。
]

#exercise_sol(type: "proof", ref: <E-cumulative-sum-independence>)[
	设 $v_1, dots, v_m$ 是 $V$ 中的向量组。对于 $k in {1, dots, m}$，令

	$ w_k = v_1 + dots.c + v_k $

	证明：如果向量组 $v_1, dots, v_m$ 线性无关，当且仅当向量组 $w_1, dots, w_m$ 线性无关。
][
	#tab 首先说明充分性：现在 $w_1, dots, w_m$ 线性无关。设 $a_1, dots, a_m in FF$ 使得

	$ a_1 v_1 + dots.c + a_m v_m = 0 $

	#tab 我们可以将其改写为

	$ b_1 w_1 + dots.c + b_m w_m = 0 $

	#tab 其中对于 $k in {1, dots, m}$，$b_k = a_k - a_(k + 1)$（方便起见，我们令 $a_(m+1) = 0$）。为了验证这一点，我们带入 $b_i$ 和 $w_i$ 的定义，得到

	$ b_1 w_1 + dots.c + b_m w_m
		&= sum_(i=1)^m (a_i - a_(i + 1))sum_(j=1)^i v_j \
		&= sum_(i=1)^m sum_(j=1)^i (a_i - a_(i + 1))v_j \
		&= sum_(j=1)^m sum_(i=j)^m (a_i - a_(i + 1))v_j \
		&= sum_(j=1)^m (sum_(i=j)^m a_i - sum_(i=j)^m a_(i + 1)) v_j \
		&= sum_(j=1)^m a_j v_j = 0 $

	#tab 这说明 $b_1 = dots.c = b_m = 0$，也即

	$ cases(
		a_1 - a_2 = 0,
		dots.c,
		a_(m-1) - a_m = 0,
		a_m = 0
	) $

	#tab 这解得 $a_1 = dots.c = a_m = 0$，于是根据线性无关的定义（原书定义2.15），向量组 $v_1, dots, v_m$ 线性无关。

	#tab 然后说明必要性：现在 $v_1, dots, v_m$ 线性无关。设 $a_1, dots, a_m in FF$ 使得

	$ a_1 w_1 + dots.c + a_m w_m = 0 $

	#tab 我们可以将其改写为

	$ b_1 v_1 + dots.c + b_m v_m = 0 $

	#tab 其中对于 $k in {1, dots, m}$，$b_k = a_k + dots.c + a_m$。为了验证这一点，我们带入 $b_i$ 和 $w_i$ 的定义，得到

	$ b_1 v_1 + dots.c + b_m v_m
		&= sum_(i=1)^m (sum_(j=i)^m a_j) v_i \
		&= sum_(i=1)^m sum_(j=i)^m a_j v_i \
		&= sum_(j=1)^m sum_(i=1)^j a_j v_i \
		&= sum_(j=1)^m a_j sum_(i=1)^j v_i \
		&= sum_(j=1)^m a_j w_j = 0 $

	#tab 这说明 $b_1 = dots.c = b_m = 0$，也即

	$ cases(
		a_1 + dots.c + a_m = 0,
		a_2 + dots.c + a_m = 0,
		dots.c,
		a_(m-1) + a_m = 0,
		a_m = 0
	) $

	#tab 这解得 $a_1 = dots.c = a_m = 0$，于是根据线性无关的定义（原书定义2.15），向量组 $w_1, dots, w_m$ 线性无关。

	#tab 综上所述，向量组 $v_1, dots, v_m$ 线性无关当且仅当向量组 $w_1, dots, w_m$ 线性无关。
]

#exercise_sol(type: "explain")[
	解释为什么在 $Poly_4(FF)$ 上不存在由六个多项式组成的线性无关组。
][
	对于 $k in {0, dots, 4}$，令

	$ p_k:& FF -> FF \ &z |-> z^k $

	#tab 我们现在论证向量组 $p_0, dots, p_4$ 张成 $Poly_4(FF)$：对于任意 $p in Poly_4(FF)$，设对于任意 $z in FF$，$p(z) = a_0 + a_1 z + a_2 z^2 + a_3 z^3 + a_4 z^4$，则可以将其表示为

	$ p = a_0 p_0 + a_1 p_1 + a_2 p_2 + a_3 p_3 + a_4 p_4 $

	#tab 这说明 $Poly_4(FF) = span(p_0, p_1, p_2, p_3, p_4)$。因此，根据“线性无关组的长度 $<=$ 张成组的长度”（原书定理2.22），我们可以得出结论，$Poly_4(FF)$ 上的线性无关组的长度不能超过 $5$。

	#tab 所以，在 $Poly_4(FF)$ 上不存在由六个多项式组成的线性无关组。
]

#exercise_sol(type: "explain")[
	解释为什么由四个多项式构成的向量组不可能张成 $Poly_4(FF)$。
][
	对于 $k in {0, dots, 4}$，令

	$ p_k:& FF -> FF \ &z |-> z^k $

	#tab 我们现在论证向量组 $p_0, dots, p_4$ 是线性无关的：设 $a_0, dots, a_4 in FF$，满足

	$ a_0 p_0 + a_1 p_1 + a_2 p_2 + a_3 p_3 + a_4 p_4 = 0 $

	#tab 即对于任意 $z in FF$，有

	$ a_0 + a_1 z + a_2 z^2 + a_3 z^3 + a_4 z^4 = 0 $

	#tab 分别取 $z in {0, dots, 4}$，得到方程组

	$ cases(
		a_0 = 0,
		a_0 + a_1 + a_2 + a_3 + a_4 = 0,
		a_0 + 2a_1 + 4a_2 + 8a_3 + 16a_4 = 0,
		a_0 + 3a_1 + 9a_2 + 27a_3 + 81a_4 = 0,
		a_0 + 4a_1 + 16a_2 + 64a_3 + 256a_4 = 0
	) $

	#tab 解得 $a_0 = a_1 = a_2 = a_3 = a_4 = 0$，因此向量组 $p_0, dots, p_4$ 是线性无关的。

	#tab 因此，根据“线性无关组的长度 $<=$ 张成组的长度”（原书定理2.22），$Poly_4(FF)$ 上的张成组的长度不少于 $5$。因此，由四个多项式构成的向量组不可能张成 $Poly_4(FF)$。
]

#exercise_sol(type: "proof", ref: <E-inf-dim-space-seq-characterization>)[
	证明：$V$ 是无限维的，当且仅当 $V$ 中存在一个序列 $v_1, v_2, dots$ 使得对于任意正整数 $m$，均有向量组 $v_1, dots, v_m$ 线性无关。
][
	首先说明充分性：现在假设 $V$ 中存在一个序列 $v_1, v_2, dots$ 使得对于任意正整数 $m$，均有向量组 $v_1, dots, v_m$ 线性无关。反证假设 $V$ 是有限维的，即存在一个向量组 $u_1, dots, u_ell$ 张成 $V$。根据“线性无关组的长度 $<=$ 张成组的长度”（原书定理2.22），必然有向量组 $v_1, dots, v_(ell + 1)$ 线性相关，这与条件矛盾。因此，$V$ 是无限维的。

	#tab 然后说明必要性：现在假设 $V$ 是无限维的。我们现在构造题目所要求的序列 $v_1, v_2, dots$ 如下

	/ 第 $1$ 步: \
		任取 $v_1 in V$，使得 $v_1 != 0$。根据@E-when-1-or-2-vectors-indep 中的结论，向量组 $v_1$ 是线性无关的。

	/ 第 $k$ 步: \
		由于 $V$ 是无限维的，存在一个向量 $v_k in V$，使得 $v_k in.not span(v_1, dots, v_(k-1))$。根据@E-when-vector-list-append-remains-indep 中的结论，向量组 $v_1, dots, v_k$ 线性无关。

	#tab 所以，$V$ 中存在一个序列 $v_1, v_2, dots$ 使得对于任意正整数 $m$，均有向量组 $v_1, dots, v_m$ 线性无关。必要性得证。

	#tab 综上所述，$V$ 是无限维的，当且仅当 $V$ 中存在一个序列 $v_1, v_2, dots$ 使得对于任意正整数 $m$，均有向量组 $v_1, dots, v_m$ 线性无关。
]

#exercise_sol(type: "proof")[
	证明：$FF^infinity$ 是无限维的。
][
	对于 $k in NN^+$，我们令

	$ v_k = "("underbrace(0 comma dots comma 0, k - 1 "个" 0), 1, 0, dots")" $

	#tab 其中 $v_k in FF^infinity$。我们现在论证，对于任意正整数 $m$，向量组 $v_1, dots, v_m$ 是线性无关的。设 $a_1, dots a_m in FF$，使得

	$ a_1 v_1 + dots.c + a_m v_m = 0 $

	#tab 这立即给出 $a_1 = dots.c = a_m = 0$，于是根据线性无关的定义（原书定义2.15），向量组 $v_1, dots, v_m$ 是线性无关的。

	#tab 所以，根据@E-inf-dim-space-seq-characterization 中的结论，$FF^infinity$ 是无限维的。
]

#exercise_sol(type: "proof")[
	证明：由区间 $[0, 1]$ 上的所有连续实值函数构成的 $RR$ 上的向量空间是无限维的。
][
	#let fun-notation = $RR^[0, 1]_cancel(arrow.dotted)$
	记 #fun-notation 为由区间 $[0, 1]$ 上的所有连续实值函数构成的 $RR$ 上的向量空间。

	#tab 对于 $k in NN^+$，我们令函数

	$ f_k:& [0, 1] -> RR \ &x |-> max{0, (k^2 - k^4) x^2 + 2 k^3 x - k^2} $

	#figure(
		kind: image,
		caption: [$k = 1, 2, 3, 4$ 时，$f$ 的图像。],
	table(
		columns: 4,
		stroke: none,
		align: top + left,
	..for k in range(1, 5) {
		(box(cetz.canvas({
			import cetz.draw: *
			ploting-styles.axis
			let domain = (0, 1)
			plot.plot(
				size: (2, 2),
				x-ticks: if k == 1 { () } else {((1 / k, $1 slash #k$),)},
				x-tick-step: 1,
				y-tick-step: 1,
				axis-style: "scientific",
				x-min: domain.at(0),
				x-max: domain.at(1),
				y-min: -0.2,
				y-max: 1.2,
				x-grid: true,
				y-grid: true,
				x-label: none,
				y-label: none,
			{
				plot.add(
					x => calc.max(
						0,
						(calc.pow(k, 2) - calc.pow(k, 4)) * calc.pow(x, 2) + 2 * calc.pow(k, 3) * x - calc.pow(k, 2)
					),
					domain: domain,
					samples: 200,
					style: ploting-styles.s,
				)
			})
		})),)
	}))

	#tab 注意到，$f_k (1/k) = 1$。另一方面 $f_k$ 定义中 $max$ 运算内的二次函数恰在 $x = 1/(k+1)$ 和 $x = 1/ (k-1)$（$k=1$ 时除外）时值为 $0$。因此，$f_k in #fun-notation$。更进一步，我们得到，对于 $i, j in NN^+$，

	$ f_i (1 / j) = cases(
		1 wide &i = j,
		0 &i != j
	) $

	#tab 设 $a_1, dots a_m in RR$，使得

	$ a_1 f_1 + dots.c + a_m f_m = 0 $

	#tab 即对于任意 $x in [0, 1]$，有

	$ a_1 f_1 (x) + dots.c + a_m f_m (x) = 0 $

	#tab 对于 $k in {1, dots, m}$，我们代入 $x = 1/k$ 即可说明 $a_k = 0$，于是根据线性无关的定义（原书定义2.15），向量组 $f_1, dots, f_m$ 是线性无关的。

	#tab 所以，根据@E-inf-dim-space-seq-characterization 中的结论，#fun-notation 是无限维的。
]

#exercise_sol(type: "proof")[
	设 $p_0, dots, p_m$ 是 $Poly_m (FF)$ 中的多项式，其满足对任意 $k in {0, dots, m}$ 都有 $p_k (2) = 0$。证明：$p_0, dots, p_m$ 在 $Poly_m (FF)$ 中不是线性无关的。
][
	对于 $k in {0, dots, m}$，令

	$ q_k:& FF -> FF \ &z |-> z^k $

	#tab 根据多项式的次数定义（原书定义2.11），有

	$ Poly_m (FF) = span(q_0, dots, q_m) $

	#tab 现在反证假设 $p_0, dots, p_m$ 在 $Poly_m (FF)$ 中线性无关。令函数

	#let b1 = math.bold("1")
	$ b1:& FF -> FF \ &z |-> 1 $

	#tab 有 $b1 in Poly_m (FF)$。同时，注意到 $b1(2) != 0$，因此 $b1 in.not span(v_1, dots, v_m)$。根据@E-when-vector-list-append-remains-indep 中的结论，向量组 $p_0, dots, p_m, b1$ 线性无关。然而，根据“线性无关组的长度 $<=$ 张成组的长度”（原书定理2.22），$q_0, dots, q_m$ 这一张成向量组的长度为 $m + 1$，而向量组 $p_0, dots, p_m, b1$ 的长度为 $m + 2$，不可能是线性无关的。矛盾，故假设不成立。

	#tab 综上所述，$p_0, dots, p_m$ 在 $Poly_m (FF)$ 中不是线性无关的。
]
