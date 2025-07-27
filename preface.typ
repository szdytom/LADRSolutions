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

#tab 你好！欢迎你翻开这份习题解答集。

#tab 这份文档记录了我个人学习 Sheldon Axler 教授那本备受推崇的教材《线性代数应该这样学》（第四版，请确认你的版本）时，一点一滴思考和解答习题的过程。初衷很简单：希望通过亲手解决每一道题，真正吃透线性代数那些精妙的概念与证明，锻炼自己的数学思维。将其整理成册并发布于 GitHub，是希望它能成为其他也在研习这本教材的学友的一个参考伙伴，或者说，一份思路上的借鉴。

#tab 这些解答主要源于我的独立思考，部分较困难的题目则是在与他人讨论或查阅资料后完成的。需要明确指出的是，这份解答集并非官方出品——它不是 Axler 教授或出版社认可的“标准答案”，纯粹是我个人学习过程中的理解与尝试。这意味着其中的解答可能并非最优解，甚至可能存在错误或不够严谨之处。

#tab 因此，恳请读者带着批判性思维看待其中的解答！我的理解或有局限，方法或显繁琐，甚至可能出错。若你发现任何问题，或有更清晰、更优美的解法，非常欢迎你通过 GitHub 仓库或邮件（链接见下方）告知我！

#tab 此外，这份解答集目前仍是一个“进行中的作品”。我还在继续学习，并将于时间和精力允许时，努力更新后续章节。进度会在 GitHub 仓库中同步，欢迎关注。

#tab 首先，由衷感谢 Sheldon Axler 教授，是他撰写了这本视角独特、强调理解本质的杰作，让线性代数的学习如此引人入胜。感谢中文版译者吴俊达、何阳同学，他们的译笔使这本经典教材更贴近中文读者。书中习题的表述基本参考并采用了他们的中文译本。特别感谢我的好友 LCW 和 ZRY，他们帮助我排查了逻辑错误、计算失误、表述不清等各类问题。

#tab 最后，也是最想说的，是感谢正在阅读这份解答集的你！无论是偶尔参考思路，还是认真提出指正，你的关注和使用都让这个原本是个人学习记录的项目有了更丰富的意义。能与众多同样热爱或正在学习线性代数的伙伴成为“同路人”，是一件非常开心的事。

#v(10pt)
#align(right)[
	#set text(fill: text_color_set.at("100"), font: zhfont_fangsong)
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
		note(supplement: none)[扫描左侧二维码亦可访问 GitHub 仓库。],
	)
]

]

#pagebreak(weak: true)
