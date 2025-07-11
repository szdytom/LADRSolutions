#import "../styles.typ": exercise_sol, note, tab
#import "../math.typ": ii, complexification

#exercise_sol(type: "proof")[
	证明：$-(-v)=v$ 对任一 $v in V$ 都成立。
	
	#note[沿用原书记号1.29，即 $V$ 表示 $FF$ 上的向量空间。下文不再赘述。]
][
	根据定义 $v + (-v) = 0$，由可交换性，得 $(-v) + v = 0$，即 $v$ 是 $-v$ 的加法逆元。由加法逆元的唯一性（原书定理1.27），得 $-(-v) = v$。
]

#exercise_sol(type: "proof", label: "tricky", ref: <1B-vec-zero-product-property>)[
	设 $a in FF$，$v in V$ 且 $a v=0$，证明：$a=0$ 或 $v=0$。
][
	我们使用反证法，假设 $a != 0$ 且 $v != 0$，同时 $a v = 0$。由于 $a != 0$ 故存在 $a^(-1) in FF$（$a^(-1) != 0$），使得 $a^(-1) a = 1$。因此有

	$ 1 v = a^(-1) a v = a^(-1) (a v) = a^(-1) 0 = 0 $

	#tab 这与 $v != 0$ 矛盾，假设不成立。因此，$a=0$ 或 $v=0$。
]

#exercise_sol(type: "explain")[
	设 $u,w in V$，解释为什么存在唯一的 $x in V$ 使得 $v + 3x=w$。
][
	取 $x = 1/3 (w - v)$，则有 $v + 3x = v + 3(1/3 (w - v)) = v + (w - v) = w$。由于向量空间的加法和数乘满足封闭性，因此这样的 $x$ 存在于 $V$ 中。

	#tab 为了说明其唯一性，假设存在另一个 $x' in V$ 使得 $v + 3x' = w$，则有

	$ v + 3x = w = v + 3x' $

	#tab 在等式两边同时加上 $-v$，化简得 $3x = 3x'$，等式两边同时乘以 $1/3$，得 $x = x'$。因此，这样的 $x$ 是唯一的。
]

#exercise_sol(type: "answer")[
	空集不是向量空间。对于在向量空间的定义（原书定义1.20）中列出的要求，空集仅不满足其中的一条。是哪一条？
][
	空集中不存在加法单位元。
]

#exercise_sol(type: "proof")[
	证明：在向量空间的定义（原书定义1.20）中，加法逆元条件可以替换为这一条件——

	#align(center)[$0v=0$ 对所有 $v in V$ 成立。]

	这里，左侧的 $0$ 是数 $0$，而右侧的 $0$ 是 $V$ 中的加法单位元。

	#note(supplement: "提示")[
		在定义中“条件可以替换”，指原来的条件替换成新条件后，满足定义的对象还是原来的那些。
	]
][
	采用原有定义时，新条件成立的证明由原书定理1.30给出。我们现在采用替换后的新定义，并以此证明加法逆元条件，即“对于所有 $v in V$，都存在 $w in V$ 使得 $v+w=0$”。

	#tab 更具体地，我们说明 $v + (-1)v=0$。这是由于

	$ v + (-1)v = 1v + (-1)v = (1 + (-1))v = 0v = 0 $

	#tab 所以对于任意 $v in V$，它的加法逆元都存在，即 $(-1)v$。故两个条件可以相互替换。
]

#note[值得一提的是，习题5的证明和原书定理1.32的证明的核心部分完全一样。]

#exercise_sol(type: "answer")[
	令 $infinity$ 和 $-infinity$ 是不在 $RR$ 中的不同对象。以最符合直觉的方式定义 $RR union {infinity, -infinity}$ 上的加法和标量乘法。具体而言，两个实数的和和积照常定义，而对于 $t in RR$，我们定义

	$ t infinity = cases(
		-infinity wide& "若 " t<0 "，",
		0 &"若 " t=0 "，",
		infinity &"若 " t>0 "；")
		wide
		t (-infinity) = cases(
			infinity wide& "若 " t<0 "，",
			0 &"若 " t=0 "，",
			-infinity &"若 " t>0 "；") $
	
	#tab 以及

	$ t + infinity &= infinity + t = infinity + infinity = infinity "，" \
		t + (-infinity) &= (-infinity) + t = (-infinity) + (-infinity) = -infinity "，" \
		infinity + (-infinity) &= (-infinity) + infinity = 0 $
	
	#tab 具有这样的加法和标量乘法的 $RR union {infinity,  -infinity}$ 是 $RR$ 上的向量空间吗？解释一下。
][
	不是。任取 $t in RR$（$t!=0$），注意到，

	$ (t+infinity)+(-infinity)&=infinity+(-infinity)=0 \
	 t+(infinity+(-infinity))&=t+0=t $

	 #tab 这违背了加法的可结合性要求。因此，$RR union {infinity, -infinity}$ 不是 $RR$ 上的向量空间。
]

#exercise_sol(type: "proof")[
	设 $S$ 是非空集合，令 $V^S$ 表示所有从 $S$ 到 $V$ 的函数构成的集合。请在 $V^S$ 定义一种自然的加法和标量乘法，并证明：具有这些定义的 $V^S$ 是向量空间。
][
	我们按如下方式定义 $V^S$ 上的加法和标量乘法：
	
	- 对于 $f, g in V^S$，和 $f + g in V^S$ 是由下式定义的函数：对于所有 $x in S$，
		$ (f + g)(x) = f(x) + g(x) $
	- 对于 $lambda in FF$ 和 $f in V^S$，乘积 $lambda f in V^S$ 是由下式定义的函数：对于所有 $x in S$，
		$ (lambda f)(x) = lambda f(x) $

	#tab 我们现在证明 $V^S$ 是 $FF$ 上的向量空间。具体而言，我们逐条验证向量空间的定义（原书定义1.20）中的要求：

	/ 可交换性: 对于所有 $f, g in V^S$，都有 $f + g = g + f$。 \
		证明：对于所有 $x in S$，有
		$ (f + g)(x) = f(x) + g(x) = g(x) + f(x) = (g + f)(x) $
		因此 $f + g = g + f $。

	/ 可结合性: 对于所有 $f, g, h in V^S$，都有 $(f + g) + h = f + (g + h)$。 \
		证明：对于所有 $x in S$，有
		$ ((f + g) + h)(x) &= (f + g)(x) + h(x) 、
			&= f(x) + g(x) + h(x) \ 
			&= f(x) + (g + h)(x) \
			&= (f + (g + h))(x) $
		因此 $(f + g) + h = f + (g + h)$。

	/ 加法单位元: 存在 $0 in V^S$ 使得对于所有 $f in V^S$，都有 $f + 0 = f$。 \
		证明：取 $0: x |-> 0$ 为 $V^S$ 中的加法单位元。对于所有 $f in V^S$，都有
		$ (f + 0)(x) = f(x) + 0 = f(x) = (f)(x) $
		因此 $f + 0 = f$。

	/ 加法逆元: 对于所有 $f in V^S$，存在 $g in V^S$ 使得 $f + g = 0$。 \
		证明：取 $g: x |-> -f(x)$ 为 $f$ 的加法逆元。对于所有 $x in S$，都有
		$ (f + g)(x) = f(x) + g(x) = f(x) - f(x) = 0 $
		因此 $f + g = 0$。

	/ 乘法单位元: 对于所有 $f in V^S$，都有 $1f = f$。 \
		证明：对于所有 $x in S$，都有
		$ (1f)(x) = 1 f(x) = f(x) $
		因此 $1f = f$。

	/ 分配性质: 对于所有 $f, g in V^S$ 以及所有 $a, b in FF$，都有 $a(f + g) = a f + a g$ 且 $(a + b)f = a f + b f$。 \
		证明：对于所有 $x in S$，有
		$ (a(f + g))(x) &= a((f + g)(x)) = a(f(x) + g(x)) \
			&= a f(x) + a g(x) = (a f)(x) + (a g)(x) \
			&= (a f + a g)(x) $
		因此 $a(f + g) = a f + a g$。另一方面，有
		$ ((a + b)f)(x) &= (a + b) f(x) \
			&= a f(x) + b f(x) \
			&= (a f)(x) + (b f)(x) \
			&= (a f + b f)(x) $
		因此 $(a + b)f = a f + b f$。
	
	#tab 综上所述，$V^S$ 满足向量空间的所有要求，因此 $V^S$ 是 $FF$ 上的向量空间。
]

#exercise_sol(type: "proof")[
	设 $V$ 是实向量空间。
	
	- $V$ 的*复化（complexification）*记为 $complexification(V)$，等于 $V times V$。$complexification(V)$ 中的所有元素为有序对 $(u,v)$，其中 $u,v in V$，不过我们将其记作 $u + ii v$。

	- $complexification(V)$ 上的加法定义为
		$ (u_1 + ii v_1) + (u_2 + ii v_2) = (u_1 + u_2) + ii (v_1 + v_2) $
		对所有 $u_1,v_1,u_2,v_2 in V$ 都成立。

	- $complexification(V)$ 上的标量乘法定义为
		$ (a + b ii)(u + ii v) = (a u - b v) + ii (a v + b u) $
		对所有 $a,b in RR$ 和所有 $u,v in V$ 都成立。
	
	证明：具有如上加法和标量乘法定义的 $complexification(V)$ 是向量空间。

	#note[将 $u in V$ 等同于 $u + ii 0$，从而将 $V$ 视为 $complexification(V)$ 的一个子集。这样一来，由 $V$ 构造 $complexification(V)$ 就可以视作由 $RR^n$ 构造 $CC^n$ 的推广。]
][
	我们将说明 $complexification(V)$ 是 $CC$ 上的向量空间。具体而言，我们逐条验证向量空间的定义（原书定义1.20）中的要求：

	/ 可交换性: 对于所有 $u_1,v_1,u_2,v_2 in V$，都有 $(u_1 + ii v_1) + (u_2 + ii v_2) = (u_2 + ii v_2) + (u_1 + ii v_1)$。 \
		证明：由加法的可交换性，$u_1 + u_2 = u_2 + u_1$ 且 $v_1 + v_2 = v_2 + v_1$，因此
		$ (u_1 + ii v_1) + (u_2 + ii v_2) &= (u_1 + u_2) + ii (v_1 + v_2) \
			&= (u_2 + u_1) + ii (v_2 + v_1) \
			&= (u_2 + ii v_2) + (u_1 + ii v_1) $

	/ 可结合性: 对于所有 $u_1,v_1,u_2,v_2,u_3,v_3 in V$，都有 $((u_1 + ii v_1) + (u_2 + ii v_2)) + (u_3 + ii v_3) = (u_1 + ii v_1) + ((u_2 + ii v_2) + (u_3 + ii v_3))$。 \
		证明：由加法的可结合性，$(u_1 + u_2) + u_3 = u_1 + (u_2 + u_3)$
		且 $(v_1 + v_2) + v_3 = v_1 + (v_2 + v_3)$，因此
		$ &((u_1 + ii v_1) + (u_2 + ii v_2)) + (u_3 + ii v_3) \
			=& ((u_1 + u_2) + ii (v_1 + v_2)) + (u_3 + ii v_3) \
			=& (u_1 + u_2 + u_3) + ii (v_1 + v_2 + v_3) \
			=& (u_1 + ii v_1) + ((u_2 + ii v_2) + (u_3 + ii v_3)) \
			=& (u_1 + ii v_1) + (u_2 + u_3) + ii (v_2 + v_3) $

	/ 加法单位元: 存在 $0 in complexification(V)$ 使得对于所有 $u,v in V$，都有 $(u + ii v) + 0 = u + ii v$。 \
		证明：取 $0 = 0 + ii 0$ 为 $complexification(V)$ 中的加法单位元。对于所有 $u,v in V$，都有
		$ (u + ii v) + 0 &= (u + ii v) + (0 + ii 0) \
			&= (u + 0) + ii (v + 0) \
			&= u + ii v $

	/ 加法逆元: 对于所有 $u,v in V$，存在 $w in complexification(V)$ 使得 $(u + ii v) + w = 0$。 \
		证明：取 $w = -u + ii (-v)$ 为 $(u + ii v)$ 的加法逆元。对于所有 $u,v in V$，都有
		$ (u + ii v) + w &= (u + ii v) + (-u + ii (-v)) \
			&= (u - u) + ii (v - v) \
			&= 0 + ii 0 \
			&= 0 $

	/ 乘法单位元: 对于所有 $u,v in V$，都有 $(1 + ii 0)(u + ii v) = u + ii v$。 \
		证明：对于所有 $u,v in V$，都有
		$ (1 + ii 0)(u + ii v) = (1 u - 0 v) + ii (1 v + 0 u) = u + ii v $

	/ 分配性质: 对于所有 $u_1,v_1,u_2,v_2 in V$ 以及所有 $a,b in RR$，都有 $(a + b ii)((u_1 + ii v_1) + (u_2 + ii v_2)) = (a + b ii)(u_1 + ii v_1) + (a + b ii)(u_2 + ii v_2)$ 且 $(a + b ii)(u + ii v) = a(u + ii v) + b(u + ii v)$。 \
		证明：对于所有 $u_1,v_1,u_2,v_2 in V$ 和所有 $a,b in RR$，都有
		$ &(a + b ii)((u_1 + ii v_1) + (u_2 + ii v_2)) \
			=& (a + b ii)((u_1 + u_2) + ii (v_1 + v_2)) \
			=& (a(u_1 + u_2) - b(v_1 + v_2)) + ii (a(v_1 + v_2) + b(u_1 + u_2)) \
			=& (a u_1 - b v_1) + ii (a v_1 + b u_1) + (a u_2 - b v_2) + ii (a v_2 + b u_2) \
			=& (a u_1 - b v_1 + a u_2 - b v_2) + ii (a v_1 + b u_1 + a v_2 + b u_2) \
			=& (a + b ii)(u_1 + ii v_1) + (a + b ii)(u_2 + ii v_2) $
		另一方面，对于所有 $u,v in V$ 和所有 $a,b in RR$
		$ (a + b ii)(u + ii v) &= (a u - b v) + ii (a v + b u) \
			&= a(u + ii v) + b(u + ii v) \
			&= (a u + a ii v) + (b u + b ii v) \
			&= a(u + ii v) + b(u + ii v) $
	
	#tab 综上所述，$complexification(V)$ 满足向量空间的所有要求，因此 $complexification(V)$ 是 $CC$ 上的向量空间。
]
