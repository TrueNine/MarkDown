# Stage

| 方法                                              | 传参    | 返回   | 注释                  |
| ------------------------------------------------- | ------- | ------ | --------------------- |
| show                                              |         |        | 显示该窗口            |
| setScene                                          | Scene   |        | 设置或关联场景 Scene  |
| setTitle                                          | String  |        | 设置窗口的标题名称    |
| getIcons().add                                    |         |        | 设置窗口图标          |
| setIconified                                      | boolean |        | 设置最小化            |
| setMaximized                                      | boolean |        | 设置最大化            |
| close                                             | boolean |        | 关闭窗口              |
| setWidth,setHeight                                | double  |        | 设置窗口              |
| getWidth,getHeight                                |         | double | 获得宽高              |
| setResizable                                      | boolean |        | 不可改变大小          |
| setMaxWidth,setMinWidth,setMaxHeight,SetMinHeight | double  |        | 设置最大最小宽高      |
| setFullScreen                                     | boolean |        | 设置全屏,必须拥有布局 |
| setOpacity                                        | double  |        | 设置透明度,0 - 1      |
| setAlwaysOnTop                                    | boolean |        | 设置窗口置顶          |
| setX,setY                                         | double  |        | 设置初始窗口坐标      |
| initOwner                                         | Stage   |        | 关联另一个 Stage      |

## 设置窗口类型

>   使用 initStyle() , 传入StageStyle 常量

| 常量        | 作用           |
| ----------- | -------------- |
| DECORATED   | 带装饰的窗口   |
| UNIFIED     | 默认统一类型   |
| UTILITY     | 简约对话框窗口 |
| UNDECORATED | 未装饰窗口     |
| TRANSPARENT | 透明窗口       |

## 模态窗口常量

>   使用方法 initModality(),传入常量,设置不同的模态类型

| 常量              | 作用                                 |
| ----------------- | ------------------------------------ |
| WINDOW_MODAL      | 设置与之关联着的模态 initOwner()关联 |
| APPLICATION_MODAL | 设置为全局模态                       |
| NONE              | 不是任何模态窗口,不受限制            |

