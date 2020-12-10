# Ubuntu 安装 MySQL

>   ### 安装环境:
>
>   OS:  Ubuntu  20.4
>
>   database:  MySQL8.0

## 1 安装过程

1.  使用 apt 进行安装

```shell
apt-get install mysql-server
```

2.  使用  systemctl status mysql  查看是否启动
3.  使用  sudo mysql_secure_installation  进行初步设置
4.  一路回车, 或者 y 即可
5.  在 y 的过程中, 设置一个 ==高强度== 的密码
6.  完成之后, 使用 密码 或者 直接登录 MySQL
7.  在 mysql.user 表内 将 ==需要的 Host== 改为 %,让别的 IP 可以访问, ==刷新权限表==  flush privileges;
8.  修改  /etc/mysql/mysql.conf.d/mysqld.cnf  将:  bind-address = 127.0.0.1  进行注释
9.  执行 /etc/init.d/mysql restart 命令重启mysql服务