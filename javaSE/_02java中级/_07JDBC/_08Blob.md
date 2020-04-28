# Blob

>   在数据库内存储的二进制文件

## 操作

预编译好 SQL 语句,使用 **setBolb** 传入数据库,参数可以是InputStream,也可以是Bold.取出则需要一个 Bolb 接取

## MySQL 设置

>   进入 my.ini: 添加
>
>   ```ini
>   max_allowed_packet=16M
>   ```
>
>   重启服务



