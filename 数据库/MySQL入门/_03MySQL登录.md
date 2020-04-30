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

## 创建用户/给予权限

```mysql
-- 创建用户
create user xxx identified by '*****';

-- 赋予xxx网络登录权限,对所有库,所有表修改的全部权限,密码为 ******
grant all privileges on *.* to xxx@'%' identified by '******';

-- 赋予xxx使用本地命令行方式赋予oooo这个库下的所有表的增删查改权限,密码为******
grant select,insert,delete,update on oooo.* to xxxx@localhost identified by '*******';
```
