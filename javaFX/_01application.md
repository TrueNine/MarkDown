# Application

## 启动流程

1.  继承 Application,实现 start()
2.  使用一个 Stage 设置 show 显示窗口(可以使用传入的primaryStage)
3.  在 main 中调用 本类的 launch(传入 main 的 args)
4.  也可以使用: Application.launch(args) 直接启动

```java
package _01Application;

import javafx.application.Application;
import javafx.stage.Stage;

/**
 * 启动 Application 的固定流程
 *
 * @author TrueNine
 * @version 1.0
 * @time 2020/4/17
 */
public class Test0 extends Application {
    public static void main(String[] args) {
        launch(args);
    }

    /**
     * 实现父类的方法,使用传入的 Stage 进行显示
     *
     * @param primaryStage 传入的 Stage
     * @throws Exception 来自朱磊
     */
    @Override
    public void start(Stage primaryStage) throws Exception {
        // 设置窗口名称
        primaryStage.setTitle("测试窗口");

        // 显示该窗口
        primaryStage.show();
    }
}

```

### 调用其他 继承了 Application 的类启动

1.  直接使用 Application.launch() 传入一个类对象,并且传入 main 的 args 参数

```java
Application.launch(clazz.class,args);
```



## 生命周期

1.  init 初始化.并没有继承
2.  start 开始.定义图形,显示图形
3.  stop 结束.程序结束

## 