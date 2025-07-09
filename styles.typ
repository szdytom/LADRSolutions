#import "@preview/showybox:2.0.4": showybox
#import "@preview/tableau-icons:0.1.0" as tbl
#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": plot

#import "color.typ": theme_color_set, text_color_set, aux_color_set

#let zhfont_sans = ("Noto Sans CJK SC",)
#let zhfont_serif = ("Noto Serif CJK SC",)
#let zhfont_fangsong = ("Zhuque Fangsong (technical preview)", "Noto Serif CJK SC")
#let monofont = ("Fira Code",)
#let mathfont = ("Concrete Math", ..zhfont_serif)

#let tab = h(2em)
#let halftab = h(1em)

#let margin-wrapper(margin: 2.5em, body) = {
	// set align(center)
	block(inset: (
		left: margin,
	), width: 100%, body)
}

#let showy_wrapper(title: "", margin: none, ..args) = {
	let b = if title != "" {
		showybox(title: text(font: zhfont_sans, title, weight: "regular"), ..args)
	} else {
		showybox(title: title, ..args)
	}

	if margin == none {
		b
	} else {
		margin-wrapper(b)
	}
}

#let simple_box = showy_wrapper.with(
	breakable: true,
	title-style: (
		weight: 900,
		color: text_color_set.at("100"),
		sep-thickness: 0pt,
		font: zhfont_sans,
	),
	frame: (
		title-color: theme_color_set.at("20"),
		border-color: theme_color_set.at("100"),
		body-color: aux_color_set.at("10"),
		thickness: (left: 3pt),
		radius: 0pt
	),
)

#let problem_box = showy_wrapper.with(
	breakable: false,
	frame: (
		body-color: aux_color_set.at("10"),
		border-color: theme_color_set.at("100"),
		thickness: (left: 3pt),
		radius: 0pt,
		align: left,
	),
)

#let unset-list-indent(body) = {
	set list(indent: 0.5em)
	set enum(indent: 0.5em)
	set terms(indent: 0.5em)
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
	set list(marker: (text(sym.square.filled.small, fill: theme_color_set.at("100")), text([--], fill: theme_color_set.at("100"))), indent: 2.5em)
	set enum(indent: 2.5em)
	set terms(indent: 2.5em)
	show heading: set text(font: zhfont_sans, weight: "semibold", text_color_set.at("100"))
	show strong: set text(fill: theme_color_set.at("100"))
	set par(justify: true)
	set text(11pt)
	show figure.caption: set text(9pt, font: zhfont_fangsong)
	show footnote.entry: set text(9pt, font: zhfont_fangsong)
	set table(stroke: 1pt + theme_color_set.at("100"), inset: 5pt)
	set grid(stroke: 1pt + theme_color_set.at("100"))
	set highlight(fill: none, stroke: (
		bottom: 4pt + theme_color_set.at("10")
	))
	set footnote(numbering: "注1")
	show math.equation: set text(font: mathfont)

	hide[#title <book-title>]

	body
}

#let note(body, supplement: "注") = {
	if supplement != none {
		text(supplement, 9pt, font: zhfont_sans, weight: "medium", fill: theme_color_set.at("100"))
		h(0.5em)
	}
    text(body, 9pt, font: zhfont_fangsong)
}

#let boxed-figure(body, wrap-placed: false, ..args) = {
	// TODO: wrap placed figures: https://github.com/typst/typst/issues/5181
	figure(box(
		inset: 5pt,
		stroke: 1pt + theme_color_set.at("100"),
		body
	), ..args)
}

#let fancy_term_box(title, value) = {
	box(baseline: 3pt, {
		box(fill: theme_color_set.at("30"), inset: 3pt, text([#title], fill: text_color_set.at("100"), font: zhfont_sans, weight: "medium"))
		box(fill: theme_color_set.at("80"), inset: 3pt, text([#value], fill: white, font: zhfont_sans, weight: "medium"))},
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
					fill: theme_color_set.at("80"),
				{
					set text(fill: white)
					"第"
					context counter("chapter_N").display("1")
					"章"
				}),
				grid.cell(
					fill: theme_color_set.at("20"),
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
			set text(30pt, font: zhfont_sans, weight: "regular")
			block(stroke: (bottom: 10pt + theme_color_set.at("20"),), inset: -2pt)[
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
		set text(9pt, font: zhfont_sans, fill: text_color_set.at("100"), weight: "semibold")

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

#let math_numbering(flag) = {
	if flag {
		return body => {
			set math.equation(numbering: "（式1）")
			body
		}
	} else {
		return body => {
			set math.equation(numbering: none)
			body
		}
	}
}

#let exercise_sol(e, s, type: "proof", label: none, ref: none) = {
	counter(math.equation).update(0)
	if ref == none {
		figure(e, kind: "exercise-problem", supplement: "习题")
	} else [
		#figure(e, kind: "exercise-problem", supplement: "习题") #ref
	]
	let splt = (
		"proof": "证明",
		"answer": "解答",
		"explain": "解释",
	)
	tab
	text(splt.at(type), font: zhfont_sans, weight: "medium", fill: text_color_set.at("100"))
	h(0.5em)
	s
	if type == "proof" {
		h(1fr)
		text(sym.square.filled, fill: theme_color_set.at("80"))
	}
	place.flush()
}

#let ploting-styles = (
	mark: (fill: theme_color_set.at("10"), stroke: theme_color_set.at("80")),

	nothing: (fill: none, stroke: none),

	s: (stroke: theme_color_set.at("100")),
	s_20: (stroke: theme_color_set.at("20")),

	axis: cetz.draw.set-style(axes: (grid: (stroke: 1pt + aux_color_set.at("100")))),
)

#let plot-point(x, y) = plot.add(((x, y),), mark: "o", mark-style: ploting-styles.mark, style: ploting-styles.s)
