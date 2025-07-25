#import "styles.typ": zhfont_sans
#import "color.typ": text_color_set, theme_color_set

#{
// Book Cover
set align(right)
set text(font: zhfont_sans, fill: text_color_set.at("100"), weight: "semibold")
v(5fr)
{
	stack(
		dir: ttb,
		spacing: 15pt,
		text([线性代数应该这样学], 22pt),
		text([习题解答], 33pt),
		box(width: 10 * 22pt, {
			line(end: (100%, 0%), stroke: 3pt + theme_color_set.at("100"))
			line(end: (38.2%, 0%), stroke: 3pt + text_color_set.at("100"))
		}),
		text([对应原书第四版], 11pt)
	)
}
v(2fr)

pagebreak(weak: true)

}