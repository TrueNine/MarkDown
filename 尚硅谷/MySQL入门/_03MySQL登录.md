# MySQL 登录操作

1.  直接进入 MySQL自带的终端,输入密码即可

>   但具有局限性,```只能root用户使用```

2.  使用 cmd:

```cmd
# 简单的登录方式
mysql -u name -p;
# -u 用户 -p,然后输入密码

# 连接远程登录方式
mysql -h loaclhost -P 3306 -u name -p
# -h host主机; -P 端口 -u 用户名 -p,然后输入密码
```

>   可以在 -p 之后直接追加密码

## 退出 MySQL

>   建议在 cmd 下执行

```cmd
# 在 MySQL 中输入
exit
# 或者 quit
```

