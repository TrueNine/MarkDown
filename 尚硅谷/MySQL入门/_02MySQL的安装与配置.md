# MySQL的安装与配置

>   基于win10的环境进行,还是有不少坑的,防止连接挂掉,重新补充

## 1. MySQL的下载

>   进入: [官网]() 下载最新版,或者[下载5.7](mysql5.7)

## 下载注意

1.  我建议使用zip包,虽然需要自己配置
2.  根据自己的电脑下载对应的版本

## 配置安装

1.  将下载的zip包解压,放置到想要的文件

>   ![image-20200408135247093](_02MySQL%E7%9A%84%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AE/image/image-20200408135247093.png)

2.  在根目录创建并配置 my.ini

>   ```ini
>   [client] 
>   # 设置mysql客户端默认字符集
>   default-character-set=utf8 
>   [mysqld]
>   #设置3306端口
>   port = 3306 
>   # 设置mysql的安装目录 这块换成自己解压的路径
>   basedir=D:\\softnew\\MYSQL\\mysql-5.7.20-winx64
>   # 允许最大连接数
>   max_connections=200
>   # 服务端使用的字符集默认为8比特编码的latin1字符集
>   character-set-server=utf8
>   # 创建新表时将使用的默认存储引擎
>   default-storage-engine=INNODB
>   ```

3.  初始化 mysql

>   1.  以```管理员身份打开cmd```,进入MySQL/bin目录,进行初始化
>
>       >   ```cmd
>       >   # 进入目录
>       >   cd D:\mysql根目录\MySQLbin
>       >   
>       >   # 运行 mysql initialize,帮助创建 data 文件
>       >   mysqld --initialize
>       >   
>       >   # 安装 mysql 服务
>       >   mysqld --install
>       >   
>       >   # 启动服务
>       >   net start mysql
>       >   
>       >   ```

4.  环境变量,登录,登录密码

>   1.  环境变量: 在 系统的 Path 下添加 mysql 的 bin 目录
>   2.  root 密码: 会在 mysqld --initialize 初始化时,给予密码
>
>   >   *   密码在: ```data/任意名称.err内```,搜索 password

5.  登录并修改密码

>   1.  登录
>
>   >   ```cmd
>   >   mysql -u root -p
>   >   # 输入密码
>   >   ```
>
>   2.  修改 root 密码
>
>   >   ```cmd
>   >   ALERT USER 'root'@'localhost' IDENTIFIED BY '新密码';
>   >   ```

# 如果没问题就可以退出了

>   ```my
>   quit
>   ```

[mysql官网]:https://www.mysql.com/
[mysql5.7]:https://dev.mysql.com/download/5.7.html

