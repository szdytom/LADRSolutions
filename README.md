# 《线性代数应该这样学（第四版）》习题解答

## 在线查看 PDF

本仓库使用 GitHub Actions 自动构建 PDF 文档，并部署到 GitHub Pages 上。由 `main` 分支的最新提交触发构建。[查看 PDF 文档](https://szdytom.github.io/LADRSolutions/main.pdf)

## 本地构建 PDF

1. 安装 [Python 3](https://www.python.org/downloads/)，请不要安装过于老旧的版本；
1. 安装 Python 依赖：`pip install -r requirements.txt`；
1. 执行构建脚本：`python3 make.py`；
1. 得到输出文件 `main.pdf`。

如需要使用 `watch` 模式监听 Typst 源代码变化，可以用命令：`python3 make.py --mode w`

另外，在 Linux 下，可以使用 `--mem` 选项，输出生成的 PDF 到 `/dev/shm/main.pdf`（内存模拟文件系统），这对节省磁盘寿命有一定帮助，尤其是在边编写边预览时。
