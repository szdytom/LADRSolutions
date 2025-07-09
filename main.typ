#import "styles.typ": project, setup_main_text, margin-wrapper, zhfont_sans
#import "toc.typ": toc
#import "color.typ": text_color_set, theme_color_set

#show: project.with("线性代数应该这样学 习题解答")

#include "cover.typ"

#[
#show heading.where(level: 1): set text(22pt)
= 目录
#v(1em)
#margin-wrapper(
	margin: 2em,
	context for i in range(0, toc.len()) {
		set text(font: zhfont_sans)
		let chapter = toc.at(i)
		let nc = numbering("1", i + 1)
		let clabel = label("chapter-heading" + nc)
		let cloc = query(selector(clabel)).first().location()
		link(cloc, {
			set text(15pt, fill: text_color_set.at("100"))
			numbering("第1章", i + 1)
			h(1em)
			chapter.title

			h(10pt)
			box(width: 1fr, repeat(sym.dot))
			h(10pt)

			str(counter(page).at(cloc).at(0))
		})
		margin-wrapper(
			margin: 2em,
			for j in range(0, chapter.sections.len()) {
				let ns = numbering("1A", i + 1, j + 1)
				let slabel = label("section-heading" + ns)
				let sloc = query(selector(slabel)).first().location()
				link(sloc, {
					set text(11pt)
					ns
					h(1em)
					chapter.sections.at(j)

					h(10pt)
					box(width: 1fr, repeat(sym.dot))
					h(10pt)

					str(counter(page).at(sloc).at(0))
				})
				linebreak()
			}
		)
	}
)
]

#{
show: setup_main_text
for i in range(0, toc.len()) {
	pagebreak(weak: true)
	let chapter = toc.at(i)
	[#heading(chapter.title, level: 1) #label("chapter-heading" + numbering("1", i + 1))]
	for j in range(0, chapter.sections.len()) {
		if j > 0 {
			pagebreak(weak: true)
		}
		let n = numbering("1A", i + 1, j + 1)
		[#heading(chapter.sections.at(j), level: 2) #label("section-heading" + n)]
		include "sections/" + n + ".typ"
	}
}
} // main text

#{

pagebreak(weak: true, to: "even")
include "back-cover.typ"

} // back cover