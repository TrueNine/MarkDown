# 操作

```
	往远程库推送,可以创建一个 以 url 为主题的别名
	从远程库克隆:
		完整地从远程库下载到本地
		创建 origin 地址别名
		初始化本地库
```

## 命令

| 命令 | 作用 |
|---|---|
| git remote | 查看保存的远程库地址 |
| git remote add name url | 保存一个名为 name 的 url 地址 |
| git push name branchName | 将指定分支推送到指定别名的仓库 |
| git clone urlName/url | 以远程库别名或 url 克隆 |

# 拉取

```
		fetch:
		并不会进行合并操作
	pull:
		同时进行 fetch 和 merge
			!!: 结果发现还是要 merge
```

## 命令

| 命令 | 作用 |
|---|---|
| git fetch rulName urlbranchName | 从远程库的指定分支先拉取(不进行合并操作) |
| git merge urlName/urlbranch | 从当前分支合并远程分支 |
| git pull urlName/urlbranch | 直接 fetch + merge ??? |

# 解决远程冲突简析

* 如果不是基于 github 远程库的最新版远程库的修改,不能推送
> 必须先拉取,如果进入冲突装填则按照 分支冲突 解决即可

# 团队协作流程

1. 协作者找到项目并 fork
2. 协作者 clone 到本地 (此项目协作者并没有推送权限)
3. 协作者开始开发完成(进行本地合并)
4. 协作者在 Github 点击 pull Requests ,Github 列出想做的修改
5. 协作者 点击 create pull Requests ,与开发者通信接接洽,至此协作者完成
6. 开发者进入 pull Requests ,并点击协作者的请求
7. 开发者亦可以继续和协作者接洽通信,同时也可以点击 Files changed 查看协作者的修改(对代码进行审查)
8. 开发者 如果确定修改,则回到 conversation 点击 merge pull Requests 合并代码(同时添加合并信息),至此远程库代码合并完成
9. 开发者将修改后的代码拉取到本地,至此协同开发完成

# SSH免密登录

* 在 ~ 目录下 生成 ssh 文件
> 一直 enter...

* 打开 id_rsa.pub
> 复制其中的内容

* 打开 GitHub 的用户 --> ssh and GPGkeys --> New ssh key
> 将内容粘贴到 key, title 填写随意

* 点击 add ssh key
* 使用 git remote add 添加远程地址别名
> 从 github 点击 clone or download , 选择 SSH,并复制地址,粘贴到别名

* 提交时 yes

## 命令

| 命令 | 作用 |
|---|---|
| ssh-keygen -t rsa -C GitHubEmailIndex | 生成 ssh 文件 |