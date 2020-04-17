# Application

| 方法            | 传参                             | 返回         | 注释                       |
| --------------- | -------------------------------- | ------------ | -------------------------- |
| launch          | 继承 Application类对象,main args |              | 在 main 中启动程序         |
| init            |                                  |              | 初始化程序执行此方法       |
| stop            |                                  |              | 关闭程序执行此方法         |
| getHostServices |                                  | HostServices | 获取一个 HostServices 连接 |

## HostServices

>   通过 HostServices 类型.showDocument('设置网址');
>
>   程序运行到此处,会使用默认浏览器打开 此网址