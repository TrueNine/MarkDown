# PreparedStatement

>   Statement 的子接口
>
>   **预编译SQL语句**

## 增加数据的示例

>   写的实在是太繁杂了

```java
package cn.how2j._02java中级._07JDBC尝试_尚硅谷._03PreparedStatement;

import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;

/**
 * 测试 preparedStatement 替换 Statement
 * 测试增删改
 *
 * @author TrueNine
 * @version 1.0
 * @date 2020/4/26
 */
public class Tests {

    /**
     * 像数据库增加记录
     */
    @Test
    public void t1() {

        Connection connection = null;
        PreparedStatement ps = null;
        try (
                InputStream is = ClassLoader.getSystemClassLoader().getResourceAsStream("cn/how2j/_02java中级/_07JDBC尝试_尚硅谷/sqlplus.properties")
        ) {
            // 加载配置文件
            Properties info = new Properties();
            info.load(is);

            // 获取配置文件内对应的配置信息
            String driverClass = info.getProperty("DriverClass");
            String url = info.getProperty("url");
            String user = info.getProperty("user");
            String password = info.getProperty("password");

            // 通过 Class.forName() 加载驱动
            Class.forName(driverClass);
            // 获取连接
            connection = DriverManager.getConnection(url, user, password);

            /* 开始操作SQL
            预编译 SQL 语句
             */
            /// 此处的 ? 为占位符
            String sql = "insert into customers(name,email,birth) values(?,?,?)";

            ps = connection.prepareStatement(sql);
            // 填充占位符
            ps.setString(1,"哪吒");
            ps.setString(2,"nezha@gmail.com");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date time = sdf.parse("1000-01-10");
            ps.setDate(3,new Date(time.getTime()));

            // 执行 SQL
            ps.execute();
        } catch (IOException e) {
            System.out.println("加载配置文件失败");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("加载驱动失败");
            e.printStackTrace();
        } catch (SQLException throwables) {
            System.out.println("获取连接失败");
            throwables.printStackTrace();
        } catch (ParseException e) {
            System.out.println("时间解析异常");
            e.printStackTrace();
        } finally {
            // 资源关闭
            if (null != ps) {
                try {
                    ps.close();
                } catch (SQLException throwables) {
                    System.out.println("preparedStatement 关闭异常");
                    throwables.printStackTrace();
                }
            }
            if (null != connection) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    System.out.println("连接关闭异常");
                    throwables.printStackTrace();
                }
            }
        }
    }
}
```



