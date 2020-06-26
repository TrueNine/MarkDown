# PreparedStatement

## 预编译的概念

>   在使用 preparedStatement 时,会进行预编译,意思就是,先执行一遍SQL,关系已经确定,不会出现SQL注入问题

## PreparedStatement比较

1.  可以防止SQL注入
2.  因为占位符的关系,可以传入文件
3.  可以实现更高效的批量操作

## 增加,删除,修改使用流程

1.  获取数据库连接
2.  预编译SQL语句,返回 preparedStatement 实例
3.  填充SQL中的占位符 ?
4.  执行
5.  关闭资源

```java
public class Tests {

    @Test
    public void t1() throws SQLException, IOException, ClassNotFoundException {
        // 0. 提升变量作用域
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // 1. 获取数据库连接
            conn = JDBCUtils.getConnection("cn\\how2j\\_02java中级\\_07JDBC尝试_尚硅谷\\sqlplus.properties");

            // 2. 预编译SQL语句,返回 preparedStatement 实例
            String sql = "UPDATE customers SET `name` = ? WHERE `id` = ?";
            // 获得 Connection 的 preparedStatement
            ps = conn.prepareStatement(sql);

            // 3. 填充SQL中的占位符 ?
            ps.setObject(1,"莫扎特");
            ps.setObject(2,18);

            // 4. 执行
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 5. 关闭资源
            JDBCUtils.closeResource(conn,ps);
        }
    }
}
```

## 尝试封装通用的语句

>   删除,增加,修改套路都差不多
>
>   1.  传入一句SQL语句,以及对应的参数列表
>   2.  使用 **setObject** 统一处理

```java
/**
 * 用于传入SQL语句,进行通用方法处理
 * 每次操作都需要
 *
 * @param path 配置文件路径,不需要src
 * @param SQL  传入的SQL语句
 * @param args 指定的参数
 */
public static void update(String path, String SQL, Object... args) {
    // 0. 提升变量作用域
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // 1. 获取数据库连接
        conn = JDBCUtils.getConnection(path);

        // 2. 预编译SQL语句,返回 preparedStatement 实例
        // 获得 Connection 的 preparedStatement
        // 此处获得传入的SQL
        ps = conn.prepareStatement(SQL);

        // 3. 填充SQL中的占位符 ?
        // 此处在循环内逐个添加
        for (int i = 0; i < args.length; i++) {
            ps.setObject(i + 1, args[i]);
        }

        // 4. 执行
        ps.execute();

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 5. 关闭资源
        JDBCUtils.closeResource(conn, ps);
    }
}
```

