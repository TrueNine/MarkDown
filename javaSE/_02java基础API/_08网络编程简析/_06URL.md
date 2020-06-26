# URL

>   **U**niform **R**esource **L**ocator  统一资源定位符
>
>   请求协议://主机名:端口号/文件名#片段名?参数列表

## 常用方法

| 方法        | 传参 | 返回   | 注释           |
| ----------- | ---- | ------ | -------------- |
| getProtocol |      | String | 请求协议       |
| getHost     |      | String | 域名或主机名   |
| getPort     |      | int    | 端口号         |
| getPath     |      | String | ur请求资源路径 |
| getFile     |      | String | url请求资源    |
| getQuery    |      | String | 参数           |
| getRef      |      | String | 锚点           |

