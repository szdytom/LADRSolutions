#import "styles.typ": project, setup_main_text

#show: project.with("线性代数应该这样学 习题解答")

#let toc = ((
	title: [向量空间],
	sections: 1
),)

#[
#show: setup_main_text

#{

for i in range(0, toc.len()) {
	let chapter = toc.at(i)
	heading(chapter.title, level: 1)
	for j in range(0, chapter.sections) {
		pagebreak(weak: true)
		include "sections/" + numbering("1A", i + 1, j + 1) + ".typ"
	}
}

}

]