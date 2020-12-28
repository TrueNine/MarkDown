# TS 简介

Typescript 是微软开发的，开源的，跨平台的编程语言，JavaScript的超集，最终会被编译成 JavaScript代码。

Typescript是微软的 C# 首席架构师：安德斯海尔斯伯格

```shell
# 安装 ts
npm install -g typescript
# 测试 ts
tsc -v
# 编译代码文件
tsc filePath
```

VsCode 自动编译 Ts 代码

*   首先初始化一个配置文件，然后修改 JSON 文件

```shell
tsc --init
```

```json
// 编译目标
"target": "es5"
// js输出目录
"outDir": "filePath"
// 开启严格模式
"strict": true
```

*   终端 -> 运行任务 -> 显示所有任务 -> tsc监视

