# Group

>   group 属于放置节点的容器

*   改变 内 组件的位置,设置组件的位置即可

```java
@Override
    public void start(Stage primaryStage) throws Exception {
        // 创建测试按钮
        Button b1 = new Button("b1");
        Button b2 = new Button("b2");
        Button b3 = new Button("b3");

        // 使按钮的位置偏移
        b3.setLayoutY(300);
        b2.setLayoutY(200);
        b1.setLayoutY(100);

        // 创建节点和容器
        Group group = new Group();
        // 为 Group 添加子组件
        group.getChildren().addAll(b1,b2,b3);
        Scene scene = new Scene(group);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
```

*   设置 group 的样式,子组件也会生效