# HttpServletRequest

>   代表客户端的一个请求,代表客户端访问服务器的请求,http协议,
>
>   *   与 **Response** 相对应

## 获取前端参数

```java
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // 设置编码
    req.setCharacterEncoding("UTF-8");
    resp.setCharacterEncoding("UTF-8");

    // 获取一个指定的值
    String username = req.getParameter("username");
    String password = req.getParameter("password");
    // 获取同一个参数的多个值
    String[] cs = req.getParameterValues("c");

    System.out.println("================================");
    System.out.println("username = " + username);
    System.out.println("password = " + password);
    System.out.println("Arrays.toString(cs) = " + Arrays.toString(cs));
    System.out.println("================================");

    // 设置客户端编码为UTF-8
    // 进行转发
    // 此处的 / 代表当前 web 应用
    req.getRequestDispatcher("success.jsp").forward(req, resp);
}
```

## 请求与转发的区别

1.  转发传参: ```getRequestDispatcher(String)```其参数 中的 **/** 代表当前web应用
2.  转发不会进行地址跳转
3.  编码为 307