#import "color.typ": text_color_set, theme_color_set
#import "@preview/cetz:0.4.0"

#{

set align(right)
v(1fr)
set text(22pt, fill: text_color_set.at("100"))
box($ F_n = 1/(sqrt(5))[((1+sqrt(5))/2)^n-((1-sqrt(5))/2)^n] $)
layout(ly => cetz.canvas(length: ly.width, {
	import cetz.draw: *
	line((0, 0), (1, 0), stroke: 3pt + theme_color_set.at("100"))
	line((0, 0), (.25, 0), stroke: 3pt + text_color_set.at("100"))
}))

}