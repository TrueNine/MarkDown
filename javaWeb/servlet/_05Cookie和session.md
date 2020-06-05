# Cookie

>   是一种客户端技术
>
>   *   通过相应发送给客户端
>   *   通过请求拿取Cookie

## 常用的一些方法

```java
// 向响应添加 Cookie
resp.addCookie(cookie);

// 从请求获得 Cookie 数组
req.getCookies();

// 获得 Cookie 的名称
cookie.getName();

// 获得 Cookie 的值
cookie.getValue(String name);

// 设置 Cookie 的有效时间 / 秒单位
cookie.setMaxAge(int second)
```

>   一个 Cookie 只能保存一个信息
>
>   **一个 web 站点可以给浏览器发送多个 Cookie**
>
>   浏览器上线为 **300** 个 Cookie
>
>   Cookie 上限为 4KB

## 删除 Cookie

1.  不设置有效期,关闭浏览器即自动失效
2.  设置有效期为 **0**,也会立即没有,**手动删除效率比较高**

## 中文问题

>   尽量使用编码

# Session

>   服务器技术,**会话**
>
>   ```text
>   服务器会为每一个用户(浏览器)创建一个 Session对象
>   
>   一个 Session 独占一个浏览器,只要客户端没有关闭,Session 就存在
>   
>   用户登录之后,整个网站都可以访问
>   
>   主要用于保存信息
>   ```
>
>   *   可以保存用户会话信息
>   *   可以把信息和数据放进 Session

## 与 Cookie 的区别

| Cookie                        | Session                       |
| ----------------------------- | ----------------------------- |
| 数据写给用户浏览器,浏览器保存 | 写到用户独占数据中,服务器保存 |
| 可以保存多个                  | 保存重要信息,**减少浪费**     |
| 客户端保存                    | 由服务器创建                  |

## Session 常用使用场景

1.  用户登录信息
2.  购物车信息
3.  在整个网站中,经常会使用的数据

## Session 常用方法

```java
// 得到 Session
req.getSession();

// 得到指定属性
session.getAttribute(String key);

// 移出指定属性
session.remove(String name);

// 注销 Session
session.invalidate();
```

### 配置 Session 过期时间(以分钟为单位)

```xml
<!--尝试设置 Session 的 存留时间  以 分钟为单位-->
<session-config>
    <session-timeout>1</session-timeout>
</session-config>
```