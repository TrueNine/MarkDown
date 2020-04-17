# Platform

| 方法            | 传参                      | 返回    | 注释                                 |
| --------------- | ------------------------- | ------- | ------------------------------------ |
| setImplicitExit | boolean                   |         | 设置隐式退出,必须调用 exit才能退出   |
| exit            |                           |         | 关闭当前所有窗口,所有线程刹车        |
| runLater        | Runnable                  |         | 用于多任务根性组件,传入一个 Runnable |
| isSupported     | ConditionalFeature 枚举类 | boolean | 查看是否支持一些特性,如3d,fxml       |

