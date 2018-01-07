<h1 align="center">CharlesScripts</h1>
<p align="center">可以配合我的博客：<a href="https://the0demiurge.blogspot.jp/2017/02/ubuntu-gnome.html">Ubuntu Gnome 酷炫完整指南系列</a>使用。</p>


[![Build Status](https://travis-ci.org/the0demiurge/CharlesScripts.svg?branch=master)](https://travis-ci.org/the0demiurge/CharlesScripts)


## 你为什么要安装本项目？ ##

凡是喜欢折腾的朋友肯定经常会遇到下面几个困扰：

1. 操作系统被自己搞烂，需要重装，难受！
2. 换了新电脑 / 工作环境，一切常用工具又需要重新部署，麻烦！
3. 许多插件配置起来太复杂了，缺少自动或版自动化的工具
4. 常用的命令就那么几个，还又长又复杂（说的就是你！`apt`和`git`）


## 内容介绍 ##

最初因为我经常会因为愚蠢的操作把操作系统搞得崩溃，写下了本项目以便减轻重装系统之痛。后来我写了许多方便的小工具和脚本，把它们整合起来就变成了本项目：

#### 1. 备份/恢复 ####

本项目会将所有资料备份到 `$CHARLES_BACKUP` 即 `.local/share/CharlesScripts/charles/packages.list.d`，因此 Fork 本项目之后可以用 git 将这些资料上传到网上。

下面是是相关命令介绍：

- `add-ppa`: 添加 `ppa` 的时候同时备份 `ppa` 列表，在`fish-shell`中运行 `add-ppa (add-ppa)` 可以自动添加列表中全部 ppa
- `inst`: 使用 `apt` 安装软件的时候同时备份软件名，在`fish-shell`中运行 `inst (inst)` 可以自动安装列表中全部软件
- `gnome-shell-extensions-backup` 和 `gnome-shell-extensions-restore`: 备份和恢复 `Gnome` 桌面的插件
- `omf-backup` 和 `omf-restore`: 备份和恢复 `oh-my-fish`(`fish-shell` 的包管理器)的插件列表
- `charles-backup`: 调用上述部分命令备份各种插件（可以放到 `cronjob` 里面实现自动备份）

#### 2. 小工具 ####

通知类：

- `ef` `fifo`： `ef` 相当于一个短时备忘录，可以用来记录笔记，相当于编辑 `fifo` 命令；输入`fifo`即可运行之前写入的内容。
- `notify`： 提醒你一定时间之后做某事 
- `tomato`： 简单的蕃茄钟，定时运行 `fifo` 命令

系统操作：

- `update`： 相当于 `pacman -Syyu --yes`，更新所有软件
- `apt-unlock`： 删除 `apt` 因为异常退出而没有删掉的文件锁
- `get-path`： 获得选定的文件绝对路径，并放到剪贴板内
- `mac-addr-flush`： 重置 MAC 地址（重启失效）
- `wallpaper-earthview`： 更新桌面壁纸（需要先设置好桌面壁纸位置为 `~/.cache/wallpaper/background-image.jpg`）

其他：

- `ssr`： ShadowSocksR 的一键安装、配置、使用客户端
- `aria2c-daemon-start`： 启动 `aria2` 的下载服务
- `gh-md-toc`： Forked from [gh-md-toc](https://github.com/ekalinin/github-markdown-toc), 为 GitHub 的 Markdown 文件加入目录
- `ipgw` `ipgw_py`： 命令行版的东北大学校园网登录器


网页相关：

- `wechat`： 打开微信
- `pocket`： 打开 Pocket
- `shanbay`： 打开扇贝单词

包含在 `.bashrc` 或 `fish-shell config.fish` 中的简便操作：

写在`CharlesScripts/charles/shell.rc.d`中的脚本函数：

- `backup`: 将文件备份（复制一份并添加`.bak`后缀）
- `cls`: `cd` 到指定文件夹然后`ls`
- `dict`: 将 `dict` 查到的单词输出到`less`内，以免单词解释过长显示不完还要再翻回去看
- `g`: 使用`git`一条龙地执行 `git add -A`，`git diff --cached`，`git status`，`git commit -m <commit message>`，`git push`，并检查 push 是否成功，若失败则提醒你检查一下
- `mcd`: 先`mkdir`再`cd`到刚刚创建的文件夹内
- `md5check`: `md5check <file> <md5>`，用`grep`检查md5是否一样
- `viz`: 使用`graphviz`编译为指定格式的图片，用法为`viz source.dot png`

在`CharlesScripts/charles/installation.d/conf.d/config-fish`配置好的命令缩写

- `...` -> `cd ...`
- `c` -> `clear; cd`
- `cl` -> `cd ..;ls`
- `eg` -> `grep -E`
- `ftps` -> `python3 -m http.server 8080`: 快速开启一个简易 ftp 服务器
- `gaa` -> `git add -A`
- `gb` -> `git branch -c`
- `gck` -> `git checkout`
- `gcm` -> `git commit -m`
- `gl` -> `git l`: 显示结构化的 git 日志
- `gm` -> `git merge --no-ff`
- `gp` -> `git push`
- `gpl` -> `git pull`
- `gst` -> `git status`
- `histg` -> `history | grep`
- `i` -> `ipython --no-confirm-exit --no-banner --pprint -i --pylab=auto`
- `l` -> `ls --color=auto`
- `la` -> `ls --almost-all --color=auto`
- `le` -> `ls --almost-all --color=auto|egrep`
- `lg` -> `ls --almost-all --color=auto|grep`
- `ll` -> `ls --almost-all -lh --color=auto`
- `n` -> `xdg-open .`
- `o` -> `xdg-open`
- `p` -> `python`
- `pdb` -> `python -mpowerline.bindings.pdb`
- `su` -> `sudo su`
- `u` -> `update`



#### 3. 安装软件 ####

脚本在 `CharlesScripts/charles/installation.d/get.d`

标 `*` 的是推荐安装的

```
get.d/
├── get-calibre
├── get-docker
├──*get-fasd
├──*get-oh-my-fish
├──*get-powerline
├── get-spacemacs
├── get-spacevim
├── get-sublime-text-3
├──*get-thefuck
└── get-xsh

```

#### 4. 配置软件 ####

脚本在 `CharlesScripts/charles/installation.d/conf.d`

标 `*` 的是推荐安装的

```
conf.d/
├──*config-bash
├──*config-fish
├──*config-git
├──*config-gnome
├──*config-powerline-bash
├── config-powerline-ipython
└──*config-tmux

```

# 安装指南 #
装前必读：

- 本项目并未经过大量测试，需要读者有基本的 Linux 问题处理能力
- 支持的操作系统：Ubuntu Gnome 最新LTS版
- 依赖项（需要用户自行安装）： Nerd Fonts, Google Chrome, git, espeak, cowsay, oneko, sl, fortune
- 可选项：Anaconda, ipython (>=5.0), fortune-zh

逐步安装：

1. 安装依赖
2. 下载本项目：`git clone https://github.com/the0demiurge/CharlesScripts.git ~/.local/share/CharlesScripts`
3. `cd ~/.local/share/CharlesScripts/charles/installation.d`
4. 阅读并运行相关软件安装脚本和配置脚本。

安装脚本（测试中）：

`bash <(curl -L https://git.io/get-charles)`

# 效果图： #

按照[**Ubuntu Gnome 酷炫完整指南系列**](https://the0demiurge.blogspot.jp/2017/02/ubuntu-gnome.html)介绍的内容配置后如下图所示。

![](figs/1.png)
![](figs/2.png)
![](figs/3.png)
