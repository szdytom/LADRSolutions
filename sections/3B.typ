#import "../styles.typ": exercise_sol, tab
#import "../math.typ": null, range

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
