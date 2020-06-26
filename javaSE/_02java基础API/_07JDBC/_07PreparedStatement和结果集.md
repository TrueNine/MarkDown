# 查询操作

具体步骤如下:

1.  获取连接
2.  预编译SQL语句
3.  执行 **executeQuery()** 返回一个 **ResultSet** 结果集
4.  **处理结果集**
5.  关闭资源, **结果集也需要关闭**

```text
具体操作与 增删改 差别不大,但是 查询会返回一个结果集
需要处理该结果集
	而 增删改 则直接: 预编译,然后执行即可
```

## ORM 对象关系映射

>   将表内的关系,与 Java 对象相互映射
>
>   对应对照表,MySQL
>
>   | SQL                      | Java               |
>   | ------------------------ | ------------------ |
>   | BIT                      | boolean            |
>   | TINYINT                  | byte               |
>   | SMALLINT                 | short              |
>   | INTEGER                  | int                |
>   | BIGINT                   | long               |
>   | CHAR,VARCHAR,LONGVARCHAR | String             |
>   | BINARY,VAR BINARY        | byte array         |
>   | DATE                     | java.sql.date      |
>   | TIME                     | java.sql.time      |
>   | TIMESTAMP                | java.sql.Timestamp |

## 处理结果集

​	在查询过程中,会返回一个 ResultSet 结果集,通过 该结果集进行筛选数据,但是会遇到一些问题: **```不知道哪列,对应什么,尽管有了ORM思想```**,这时就可以使用 ResultSEtMetaData ,来获取**这个结果集的元数据**(就像元注解一样),进行一系列操作,最后将值取出,然后将字段名称/**别名,一定使用别名**,与Java中的对象一一对应

*   通过 ResultSet 的 ResultSet.getMetaData 方法,得到 ResultSetMetaData
*   然后就可以进行一系列的操作

## 方法(PreparedStatement,ResultSEt,ResultSetMetaData)

| 方法                        | 传参       | 返回              | 注释                                                         |
| --------------------------- | ---------- | ----------------- | ------------------------------------------------------------ |
| setObject(int index,Object) | int,Object |                   | 填充占位符                                                   |
| execute                     |            | boolean           | 进行提交,,增删改操作返回 false,查询操作返回 true,说明是一个结果集 |
| executeUpdata               |            | int               | 执行SQL,返回操作的行数                                       |
| executeQuery                |            | PreparedStatement | 执行SQL,并返回结果集                                         |
| ResultSet.getMetaData       |            | ResultSetMateData | 返回结果集的元数据                                           |
| ---                         | ---        | ---               | ---                                                          |
| next                        |            | boolean           | 返回是否有一行,然后行的指针下移到下一行                      |
| ---                         | ---        | ---               | ---                                                          |
| getColumnCount              |            | int               | 获得列数                                                     |
| getColumnName               |            | String            | 获得列名                                                     |
| getColumnLabel              |            | String            | **获取别名,没有则是列名**                                    |
| getObject                   | String     |                   | 输入列名,直接返回类型                                        |

