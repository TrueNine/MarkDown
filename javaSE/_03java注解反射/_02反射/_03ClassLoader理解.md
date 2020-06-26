# 类加载与 ClassLoader理解

![image-20200423175350353](../../../../img/_03ClassLoader%E7%90%86%E8%A7%A3/image-20200423175350353.png)

*   自定义类: 使用系统加载器进行加载
*   调用 getParent() 获取扩展类加载器
*   引导加载器,无法获取,用于加载 java 自身类库

## 使用 ClassLoader 加载配置文件

>   properties: 用于读取配置文件
>
>   **一定注意书写路径的格式**
>
>   

### 普通的加载方式

```java
/**
 * 使用 ClassLoader 读取配置文件测试
 */
@Test
public void test1() throws IOException {
    Properties p = new Properties();;
    FileInputStream is = new FileInputStream(
        new File("src/cn/how2j/_03Java高级/_02反射/_03ClassLoader/test.properties")
    );
    // 读取配置文件
    p.load(is);

    // 读取

    String name = p.getProperty("name");
    String password = p.getProperty("password");

    System.out.println("name = " + name);
    System.out.println("password = " + password);
}
```

### 使用 类加载器加载

```java
/**
 * 测试第二种读取方式
 */
@Test
public void test2() {
    ClassLoader classLoader = ClassLoaderTest.class.getClassLoader();
    // 以流的方式获取资源,使用 try with resources
    // 此处配置文件路径,相对路径默认识别为当前 module 下的 src
    try (InputStream is = classLoader.getResourceAsStream("cn/how2j/_03Java高级/_02反射/_03ClassLoader/test.properties")) {
        Properties p = new Properties();
        p.load(is);

        // 尝试获取
        String name = p.getProperty("name");
        String password = p.getProperty("password");

        System.out.println("name = " + name);
        System.out.println("password = " + password);
    } catch (IOException e) {
        e.printStackTrace();
    }
}
```



