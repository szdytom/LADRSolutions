#import "styles.typ": tab, monofont, zhfont_fangsong, zhfont_sans, note
#import "color.typ": text_color_set, theme_color_set
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/tiaoma:0.3.0"

#[
#show link: set text(font: monofont, fill: text_color_set.at("100"))
#set grid(stroke: none)
#show heading.where(level: 1): set text(22pt)
= 写在前面的话

#v(10pt)

#tab 你好！很高兴你打开了这份习题解答集。

#tab 这份文档记录了我个人学习 Sheldon Axler 教授那本备受推崇的教材《线性代数应该这样学》第四版（请确认你的版本）时，一点一滴思考和解答习题的过程。它初衷很简单：就是想通过亲手解决每一道题，来真正吃透线性代数那些精妙的概念和证明，锻炼自己的数学思维。把它整理成册并放在 GitHub 上，是希望它能成为其他也在啃这本教材的同学的一个学习伙伴，或者说，一个思路的参考。

#tab 这份解答集大多是我完全独立思考得出的，也有一些比较困难的题目是在和他人讨论或上网搜索才得到了答案。值得指出的是，这份解答集没有任何官方背景——它不是 Axler 教授或出版社认可的“标准答案”，纯粹是我在学习过程中对习题的理解和尝试。这就意味着，里面的解答可能不是最优的，甚至可能存在错误或不够严谨的地方。

#tab 正因如此，请一定要带着批判的眼光去看待其中的解答！我的理解可能有局限、方法可能绕了远路、甚至可能是错的。如果你发现了问题，或者有更清晰、更优美的解法，欢迎你通过 GitHub 仓库或邮件（链接在下面）告诉我！

#tab 另外，这份解答集目前还是一个“进行中的作品”。我还在继续学习，也会在时间和精力允许的情况下，努力更新后面的章节。进度会在 GitHub 仓库里更新，欢迎你关注。

#tab 首先由衷感谢 Sheldon Axler 教授，是他写出了这本视角独特、强调理解本质的杰作，让线性代数的学习如此引人入胜。感谢中文版译者吴俊达、何阳。他们的翻译让这本经典教材更贴近中文读者。书中习题的表述基本上都参考并采用了他们的中文译本。特别感谢我的好友 LCW 和 ZRY，他们帮助我排查逻辑错误、计算失误、表述不清等各种错误。

#tab 最后，也是最想说的，是感谢正在阅读这份解答集的你！无论是偶尔参考一下思路，还是认真提出指正，你的关注和使用都让这个原本是个人学习记录的项目有了更丰富的意义。能和这么多同样热爱或正在学习线性代数的伙伴成为“同路人”，是件非常开心的事。

#v(10pt)
#align(right)[
	#set text(fill: theme_color_set.at("100"), font: zhfont_sans)
	方而静 \
	2025年7月
]

#v(1fr)

#wrap-content[
	#tiaoma.qrcode("https://github.com/szdytom/LADRSolutions")
][
	#set text(9pt)
	#set align(horizon)
	#stack(dir: ttb, 
		table(
			stroke: none,
			inset: (right: 9pt, bottom: 6pt, left: 0pt, top: 0pt),
			columns: (auto, auto),
			strong[邮箱], link("mailto:szdytom@qq.com")[szdytom\@qq.com],
			strong[GitHub], [https://github.com/szdytom/LADRSolutions]
		),
		v(3pt),
		note(supplement: none)[扫描二维码亦可访问 GitHub 仓库。],
	)
]

]

#pagebreak(weak: true)
