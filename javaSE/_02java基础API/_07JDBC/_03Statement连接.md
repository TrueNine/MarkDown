# Statement

>   不推荐使用的一种操作数据库的方式
>
>   使用明文进行查询,**有SQL注入的风险**
>
>   千万不能使用此种方式
>
>   *   使用 **PreparedStatement(Statement子接口)** 来取代 statement