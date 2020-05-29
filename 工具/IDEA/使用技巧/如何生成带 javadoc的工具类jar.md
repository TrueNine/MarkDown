# 如何生成带 javadoc的工具类jar
> 只是暂时解决,建议使用 maven

***IDEA版本: 2019.3.2***

## 遇到问题

```text
在想生成工具类 jar 包时
只生成了 class 文件(编译后的)
	导致问题: 鼠标悬停在类,对象,方法上时,不会显示写的 javadoc 注释
推测可能原因:
	编译后的 class 文件打开,是 idea 反编译后的结果
		因此无法查看注释,(编译时编译器忽略)
```

## 暂时解决方式
> 在生成 jar 结构时,添加源码到 jar 内

```text
按照正常步骤:
	File -> project Structure -> Artifacts
	左侧 + 添加: JAR -> From modules with dependencies (此处可以什么都不写)
	选择添加项目: 中间 Output Layout(左侧) -> + -> 加入: Modules cources
	应用 -> 确定
build:
	Build Artifacts -> 选择需要的 -> build
```

## 存在问题

1. 会将源码和 class 放在一起
2. 这样会导致文件结构复杂
3. 但问题不大