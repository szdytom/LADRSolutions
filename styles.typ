#import "@preview/showybox:2.0.4": showybox
#import "@preview/tableau-icons:0.1.0" as tbl
#import "@preview/cetz:0.3.2"
#import "@preview/cetz-plot:0.1.1": plot

#let zhfont_sans = ("Noto Sans CJK SC")
#let zhfont_serif = ("Noto Serif CJK SC")
#let zhfont_fangsong = ("Zhuque Fangsong (technical preview)", "Noto Serif CJK SC")
#let monofont = ("Fira Code")

#let theme_color = color.blue

#let tab = h(2em)
#let halftab = h(1em)
#let ee = "e"
#let ii = "i"

#let showy_wrapper(title: "", wrap-border: none, ..args) = {
	let b = if title != "" {
		showybox(title: text(font: zhfont_sans, title), ..args)
	} else {
		showybox(title: title, ..args)
	}

	if wrap-border == none {
		b
	} else {
		set align(center)
		block(inset: (
			left: wrap-border,
		), width: 100%, b)
	}
}

#let simple_box = showy_wrapper.with(
	breakable: true,
	title-style: (
		weight: 900,
		color: theme_color.darken(40%),
		sep-thickness: 0pt,
		font: zhfont_sans
		//align: center
	),
	frame: (
		title-color: theme_color.lighten(80%),
		border-color: theme_color.darken(40%),
		thickness: (left: 1pt),
		radius: 0pt
	),
)

#let problem_box = showy_wrapper.with(
	breakable: false,
	frame: (
		title-color: theme_color.lighten(80%),
		border-color: theme_color.darken(40%),
		thickness: (left: 1pt),
		radius: 0pt,
		align: left,
	),
)

#let unset-list-indent(body) = {
	set list(indent: 0.5em)
	set enum(indent: 0.5em)
	body
}

#let project(title, body) = {
	set document(title: title)
	set text(font: zhfont_serif, lang: "zh")
	set page(
		// 1/16 787 x 1092
		width: 787mm / 4,
		height: 1092mm / 4,
	)

	set par(
		spacing: 1.2em,
		leading: 0.75em,
	)
	set list(marker: (sym.square.filled.small, [--]), indent: 2.5em)
	set enum(indent: 2.5em)
	show heading: set text(font: zhfont_sans, weight: "semibold")
	set par(justify: true)
	set text(11pt)
	show heading.where(level: 3): set text(14pt)
	show figure.caption: set text(9pt, font: zhfont_fangsong)
	show footnote.entry: set text(9pt, font: zhfont_fangsong)
	set table(stroke: 1pt + theme_color, inset: 5pt)
	set grid(stroke: 1pt + theme_color)
	set highlight(fill: none, stroke: (
		bottom: 4pt + theme_color.lighten(80%)
	))

	v(10fr)
	h(2fr)
	[
		#set text(2em, weight: "light", font: zhfont_sans)
		#title <book-title>
	]
	v(3fr)

	body
}

#let note(body) = {
    text(body, 9pt, font: zhfont_fangsong)
}

#let boxed-figure(body, wrap-placed: false, ..args) = {
	// TODO: wrap placed figures: https://github.com/typst/typst/issues/5181
	figure(box(
		inset: 5pt,
		stroke: 1pt + theme_color,
		body
	), ..args)
}

#let fancy_term_box(title, value) = {
	box(baseline: 3pt,{
		box(fill: theme_color.lighten(80%), inset: 3pt, text([#title], fill: theme_color.darken(40%), font: zhfont_sans, weight: "medium"))
		box(fill: theme_color.lighten(20%), inset: 3pt, text([#value], fill: white, font: zhfont_sans, weight: "medium"))},
	)
}

#let setup_main_text(body) = {
	pagebreak(to: "odd")
	counter(page).update(1)
	show heading.where(level: 1): it => {
		counter("chapter_N").step()
		counter("section_N").update(0)
		block(width: 100%, {
			set text(15pt, font: zhfont_sans, weight: "medium")
			grid(
				columns: (auto, 1fr),
				inset: 0.4em,
				stroke: none,
				grid.cell(
					fill: theme_color.lighten(20%),
				{
					set text(fill: white)
					"第"
					context counter("chapter_N").display("1")
					"章"
				}),
				grid.cell(
					fill: theme_color.lighten(80%),
				{
					it.body
				})
			)
			v(0.5em)
		})
	}

	show heading.where(level: 2): it => {
		counter("section_N").step()
		counter(figure.where(kind: "exercise-problem")).update(0)
		block(width: 100%, {
			set text(30pt, font: zhfont_sans, weight: "light")
			block(stroke: (bottom: 10pt + theme_color.lighten(80%),), inset: -2pt)[
				#context{
					counter("chapter_N").display("1")
					counter("section_N").display("A")
				}
				#h(10pt)
				#it.body <section-title>
			]
			v(10pt)
		})
	}

	set page(footer: context {
		let this_page = counter(page).get().at(0)
		let isleft = calc.even(this_page)
		set align(left) if isleft
		set align(right) if not isleft
		set text(9pt, font: zhfont_sans, fill: theme_color.darken(20%))

		let prev_headers = query(selector(<section-title>).before(here()))
		let book_title = query(selector(<book-title>)).first().text
		let footer_content = if isleft {
			book_title
		} else {
		    if prev_headers.len() > 0 {
				prev_headers.last()
			} else {
				""
			}
		}

		stack(dir: if isleft { ltr } else { rtl },
			spacing: 1em,
			str(this_page),
			footer_content,
		)
	})

	show figure.where(kind: "exercise-problem"): it => {
		let cat_display = "习题"
		set align(left)
		problem_box({
			context fancy_term_box(cat_display, it.counter.get().at(0))
			h(0.5em)
			it.body
		})
	}

	body
}

#let exercise_sol(e, s, type: "proof") = {
	figure(e, kind: "exercise-problem", supplement: "习题")
	s
}

#let ploting-styles = (
	mark: (fill: theme_color.lighten(80%), stroke: theme_color),

	nothing: (fill: none, stroke: none),

	s_l20: (stroke: theme_color.lighten(20%)),
	s: (stroke: theme_color),
	s_d20: (stroke: theme_color.darken(20%)),
	s_hl: (stroke: theme_color.darken(20%) + 2pt),
	s_hl_l20: (stroke: theme_color.lighten(20%) + 2pt),
	s_black: (stroke: black),

	f_l80: (stroke: none, fill: theme_color.lighten(80%)),
	f_l90: (stroke: none, fill: theme_color.lighten(90%)),
	f_l95: (stroke: none, fill: theme_color.lighten(95%)),

	axis: cetz.draw.set-style(axes: (stroke: .5pt, tick: (stroke: .5pt))),
)

#let plot-point(x, y) = plot.add(((x, y),), mark: "o", mark-style: ploting-styles.mark, style: ploting-styles.s)
