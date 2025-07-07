#import "../styles.typ": exercise_sol, ii, note, tab, simple_box

== $RR^n$ 和 $CC^n$

#exercise_sol(type: "proof")[
	证明：$alpha + beta = beta + alpha$ 对所有 $alpha,beta in CC$ 成立。
][
	根据定义，令 $alpha = a + b ii$，$beta = c + d ii$（其中 $a,b,c,d in RR$），则根据实数的加法交换律，有：
	$ alpha + beta &= (a + c) + (b + d) ii \
		&= (c + a) + (d + b) ii \
		&= beta + alpha $
]

#exercise_sol(type: "proof")[
	证明：$(alpha + beta) + lambda = alpha + (beta + lambda)$ 对所有 $alpha,beta,lambda in CC$ 成立。
][
	根据定义，令 $alpha = a + b ii$，$beta = c + d ii$，$lambda = e + f ii$（其中 $a,b,c,d,e,f in RR$），则有：
	$ (alpha + beta) + lambda &= ((a + c) + (b + d) ii) + (e + f ii) \
		&= (a + c + e) + (b + d + f) ii \
		&= alpha + (beta + lambda) $
]

#exercise_sol(type: "proof")[
	证明：$(alpha beta) lambda = alpha (beta lambda)$ 对所有 $alpha,beta,lambda in CC$ 成立。
][
	根据定义，令 $alpha = a + b ii$，$beta = c + d ii$，$lambda = e + f ii$（其中 $a,b,c,d,e,f in RR$），则有：
	$ (alpha beta) lambda &= ((a + b ii)(c + d ii))(e + f ii) \
		&= (a c - b d + (a d + b c) ii)(e + f ii) \
		&= (a c e - b d f - (a d + b c)f + (a d + b c)e) + ((a d + b c)e + (a c - b d)f) ii \
		&= alpha (beta lambda) $
]

#note[复数乘法的交换律由原书例1.4给出。]

#exercise_sol(type: "proof")[
	证明：$lambda (alpha + beta) = lambda alpha + lambda beta$ 对所有 $lambda,alpha,beta in CC$ 成立。
][
	根据定义，令 $alpha = a + b ii$，$beta = c + d ii$，$lambda = e + f ii$（其中 $a,b,c,d,e,f in RR$），则有：
	$ lambda (alpha + beta) &= (e + f ii)((a + c) + (b + d) ii) \
		&= (e(a + c) - f(b + d)) + (f(a + c) + e(b + d)) ii \
		&= (e a - f b + e c - f d) + (f a + e b + f c + e d) ii \
		&= lambda alpha + lambda beta $
]

#exercise_sol(type: "proof")[
	证明：对于任一 $alpha in CC$，都存在唯一的 $beta in CC$ 使得 $alpha + beta = 0$。
][
	根据定义，令 $alpha = a + b ii$（其中 $a,b in RR$），则取 $beta = (-a) + (-b) ii$，则有：
	$ alpha + beta &= (a + b ii) + ((-a) + (-b) ii) \
		&= (a - a) + (b - b) ii \
		&= 0 $
	#tab 因此，这样的 $beta$ 存在。为了说明其唯一性，假设存在另一个 $beta'$，也满足 $alpha + beta' = 0$，则有：
	$ beta = beta + 0 
		= beta + (alpha + beta') 
		= (beta + alpha) + beta' 
		= 0 + beta' 
		= beta' $
]

#exercise_sol(type: "proof")[
	证明：对于任一 $alpha in CC$（$alpha != 0$），都存在唯一的 $beta in CC$ 使得 $alpha beta = 1$。
][
	根据定义，令 $alpha = a + b ii$（其中 $a,b in RR$），则取 $beta = (a / (a^2 + b^2)) - (b / (a^2 + b^2)) ii$，则有：
	$ alpha beta &= (a + b ii)(a/(a^2 + b^2) - b/(a^2 + b^2) ii) \
		&= (a^2 + b^2)(a^2 + b^2) \
		&= 1 $
	#tab 因此，这样的 $beta$ 存在。为了说明其唯一性，我们假设存在另一个 $beta'$，也满足 $alpha beta' = 1$，则有：
	$ beta = beta dot 1 = beta (alpha beta') = (beta alpha) beta' = 1 dot beta' = beta' $
]

#note[上面习题说明，$CC$ 构成一个域。]

#exercise_sol(type: "proof")[
	证明：
	$ (-1+sqrt(3) ii)/2 $
	是 $1$ 的立方根（意即它的立方等于 $1$）。
][
	$ ((-1+sqrt(3) ii)/2)^3 &= (-1+sqrt(3) ii)^3 / 8 \
		&= 1/8 ((-1)^3 + 3(-1)^2(sqrt(3) ii) + 3(-1)(sqrt(3) ii)^2 + (sqrt(3) ii)^3) \
		&= 1/8 (-1 + 3 sqrt(3) ii + 9 - 3 sqrt(3) ii) \
		&= 1 $
]

#exercise_sol(type: "answer")[
	求 $ii$ 的两个向异的平方根。
][
	令 $x = a + b ii$（其中 $a,b in RR$），满足 $x^2 = ii$，即 $a^2 - b^2 + 2 a b ii = 0 + 1 ii$。因此，我们有两个方程：
	$ cases(a^2-b^2=0, 2 a b = 1) $
	#tab 解这两个方程组，我们得到 $a = sqrt(2)/2$ 和 $b = sqrt(2)/2$ 或者 $a = -sqrt(2)/2$ 和 $b = -sqrt(2)/2$。因此，$ii$ 的两个向异的平方根是：
	$ x_1=sqrt(2)/2 + sqrt(2)/2 ii, x_2=-sqrt(2)/2 - sqrt(2)/2 ii $
]

#exercise_sol(type: "answer")[
	求 $x in RR^4$，使得
	$ (4, -3, 1, 7) + 2x = (5, 9, -6, 8) $
][
	根据定义，令 $x = (x_1, x_2, x_3, x_4)$，则
	$ (4, -3, 1, 7) + 2x = (4 + 2 x_1, -3 + 2 x_2, 1 + 2 x_3, 7 + 2 x_4) $
	#tab 令其等于 $(5, 9, -6, 8)$，则我们有四个方程：
	$ cases(4 + 2 x_1 = 5, -3 + 2 x_2 = 9, 1 + 2 x_3 = -6, 7 + 2 x_4 = 8) $
	#tab 解这四个方程，我们得到 $x_1 = 1/2, x_2 = 6, x_3 = -7/2, x_4 = 1/2$。因此，
	$ x = (1/2, 6, -7/2, 1/2) $
]

#exercise_sol(type: "explain")[
	解释为什么不存在 $lambda in CC$，使得
	$ lambda (2 - 3 ii, 5 + 4 ii, -6 + 7 ii) = (12 - 5 ii, 7 + 22 ii, -32 - 9 ii) $
][
	注意到，
	$ (12 - 5 ii)/(2 - 3 ii) = 3 + 2 ii $
	#tab 而
	$ (-32 - 9 ii)/(-6 + 7 ii) != 3 + 2 ii $
	#tab 因此，这样的 $lambda$ 不存在。
]

#exercise_sol(type: "proof")[
	证明：$(x+y)+z=x+(y+z)$ 对所有 $x,y,z in FF^n$ 成立。

	#note[沿用原书记号1.6与记号1.10，即 $FF$ 表示 $RR$ 或 $CC$，$n$ 表示某一固定的正整数。下文不再赘述。]
][
	根据定义，令 $x = (x_1, x_2, dots, x_n)$，$y = (y_1, y_2, dots, y_n)$，$z = (z_1, z_2, dots, z_n)$，则有：
	$ (x+y)+z &= ((x_1+y_1, x_2+y_2, dots, x_n+y_n) + (z_1, z_2, dots, z_n)) \
		&= (x_1+y_1+z_1, x_2+y_2+z_2, dots, x_n+y_n+z_n) \
		&= ((x_1, x_2, dots, x_n) + (y_1+z_1, y_2+z_2, dots, y_n+z_n)) \
		&= x+(y+z) $
]

#note[$FF^n$ 上向量的加法交换律由原书定理1.14给出。]

#exercise_sol(type: "proof")[
	证明：$(a b)x = a(b x)$ 对所有 $x in FF^n$ 和 $a,b in FF$ 成立。
][
	根据定义，令 $x = (x_1, x_2, dots, x_n)$，则有：
	$ (a b)x &= (a b)(x_1, x_2, dots, x_n) \
		&= (a b x_1, a b x_2, dots, a b x_n) \
		&= a(b x_1, b x_2, dots, b x_n)) \
		&= a(b x) $
]

#exercise_sol(type: "proof")[
	证明：$1 x=x$ 对所有 $x in FF^n$ 成立。
][
	根据定义，令 $x = (x_1, x_2, dots, x_n)$，则有：
	$ 1 x &= 1(x_1, x_2, dots, x_n) \
		&= (1 dot x_1, 1 dot x_2, dots, 1 dot x_n) \
		&= (x_1, x_2, dots, x_n) \
		&= x $
]

#exercise_sol(type: "proof")[
	证明：$lambda (x+y) = lambda x + lambda y$ 对所有 $lambda in FF$ 和 $x,y in FF^n$ 成立。
][
	根据定义，令 $x = (x_1, x_2, dots, x_n)$，$y = (y_1, y_2, dots, y_n)$，则有：
	$ lambda (x+y) &= lambda ((x_1+y_1, x_2+y_2, dots, x_n+y_n)) \
		&= (lambda(x_1+y_1), lambda(x_2+y_2), dots, lambda(x_n+y_n)) \
		&= (lambda x_1 + lambda y_1, lambda x_2 + lambda y_2, dots, lambda x_n + lambda y_n) \
		&= lambda x + lambda y $
]

#exercise_sol(type: "proof")[
	证明：$(a+b)x = a x + b x$ 对所有 $a,b in FF$ 和 $x in FF^n$ 成立。
][
	根据定义，令 $x = (x_1, x_2, dots, x_n)$，则有：
	$ (a+b)x &= (a+b)(x_1, x_2, dots, x_n) \
		&= (a x_1 + b x_1, a x_2 + b x_2, dots, a x_n + b x_n) \
		&= (a x_1, a x_2, dots, a x_n) + (b x_1, b x_2, dots, b x_n) \
		&= a x + b x $
]

#simple_box(title: [$FF^n$ 是向量空间])[
	#tab 在原书的下一个小节（1B 向量空间的定义）中，正式给出了向量空间的定义。其实上面的习题就是在引导我们去验证：$FF^n$ 是一个向量空间。具体而言，原书定义1.13和定义1.18分别给出的 $FF^n$ 上的加法和标量乘法的定义，而其所需满足的性质：
	/ 可交换性: \
		原书定理1.14
	/ 可结合性: \
		习题11
	/ 加法单位元: \
		原书记号1.15定义了 $0$，其性质容易验证
	/ 加法逆元: \
		原书定义1.17
	/ 乘法单位元: \
		习题13
	/ 分配性质: \
		习题14和习题15
]
