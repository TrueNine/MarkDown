# TS 简介

Typescript 是微软开发的，开源的，跨平台的编程语言，JavaScript的超集，最终会被编译成 JavaScript代码。

Typescript是微软的 C# 首席架构师：安德斯海尔斯伯格

```shell
# 安装 ts
npm install -g typescript
# 测试 ts 安装
tsc -v
# 编译 ts 文件为 js 文件
tsc filepath
```

## VsCode 自动编译 Ts 代码

*   首先初始化一个配置文件，然后修改 JSON 文件

```shell
# ts 初始化配置文件
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

# TS 类型

声明 （变量，形参，方法返回值……）时，再次为变量赋值，编译器则会进行检查

## 声明

如果在一开始就给变量赋值，是不需要在其后继续声明的

```typescript
let variable: number;
let variable: number = 1;
function fn(arg1: number, arg2: string): number {
  return arg1 + arg2;
}
```



| 类型    | 描述             | 举例                                       |
| ------- | ---------------- | ------------------------------------------ |
| number  | 任意数值         | 1、3.14                                    |
| string  | 任意字符，字符串 | 'str'、"str"                               |
| boolean | 布尔值           | true、false                                |
| 字面量  | 其本身           | 限制变量只能是其中的一种，或者其中任意一种 |
| any     | *                | 任意类型                                   |
| unknown | *                | 类型安全的 any                             |
| void    | 空值 (undefined) | 没有值或者 undefined                       |
| never   | 没有值           | 不能是任何值                               |
| object  | {is : true}      | 任意 js 对象                               |
| array   | [1,2,3]          | 任意 js 数组                               |
| tuple   | [4,5]            | 固定长度数组                               |
| enum    | enum{A,B,C}      | 枚举类型                                   |

* 变量只声明不赋值，不指定类型，则为 any

* ==any 如果被别的变量引用，会将该变量转换为 any==

* ==unknown 和 any 都是任意类型，但不能直接给别的变量赋值==

  * 借此可以使用类型断言

  ```typescript
  let a: unknown = 1234;
  // 使用 as
  let b: number = a as number;
  // 使用 <>
  let c: number = <number>a;
  ```

  

## 联合类型

只能是类型规定的值，或者之中的值

只能是规定的类型，或者之中的类型

```typescript
// 只能是 10
let variable: 10;
// 只能是 10 20 30
let variable1: 10 | 20 | 30;
// 只能是 number
let variable2: number;
// 只能是 number string
let varibale3: number | string;
```

## object

```typescript
let a: object;
let b = {};
let c = function(){};
```

对象中可以直接指定属性

```typescript
// 声明
let a: {
  name: string,
  age: number,
  sex: boolean
};

// 错误的指向方式
// a = {aa: number};
// 正确的方式应该是对应赋值
```

### 可选属性

在尾部加上?，表示该属性是可选可（可有可无）

```typescript
let a: {name: string, age: number, sex?: boolean};
```

### 任意属性

假设一种场景，除了一个属性需要，其他属性都可选，则可以按照以下的写法进行

```typescript
// 除了 name 属性，其他属性可选
let c3: {
  name: string,
  [propName: string]: unknown
}
c3 = {name: "张三", age: "233", see: true};
```

### 方法返回值

```typescript
// 指定函数，ab参数都是 number，返回值是 number
let d: (a: number, b: number) => number;
```

## Array

ts 的数组只能存储同一类型

```typescript
// 声明数组
let a: string[];
// 另一种声明方式，泛型方式的写法
// let a: Array<string>;
a = ["1", "2", "3"];
```

## tuple

元组：固定长度的数组

```typescript
let a: [string, string];
```

## Enum

枚举：ts中新增的类型，如同Java一般使用即可

```typescript
enum Enum {
    a,
    r,
    f
}
```

# TS 编译选项

使用 ```tsc --init``` 在当前文件生成一个 tsconfig.json 文件

```json
{
  "compilerOptions": {
    /* Visit https://aka.ms/tsconfig.json to read more about this file */

    /* Basic Options */
    // "incremental": true,                   /* Enable incremental compilation */
    "target": "es5",                          /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019', 'ES2020', or 'ESNEXT'. */
    "module": "commonjs",                     /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', 'es2020', or 'ESNext'. */
    // "lib": [],                             /* Specify library files to be included in the compilation. */
    // "allowJs": true,                       /* Allow javascript files to be compiled. */
    // "checkJs": true,                       /* Report errors in .js files. */
    // "jsx": "preserve",                     /* Specify JSX code generation: 'preserve', 'react-native', or 'react'. */
    // "declaration": true,                   /* Generates corresponding '.d.ts' file. */
    // "declarationMap": true,                /* Generates a sourcemap for each corresponding '.d.ts' file. */
    // "sourceMap": true,                     /* Generates corresponding '.map' file. */
    // "outFile": "./",                       /* Concatenate and emit output to single file. */
    // "outDir": "./",                        /* Redirect output structure to the directory. */
    // "rootDir": "./",                       /* Specify the root directory of input files. Use to control the output directory structure with --outDir. */
    // "composite": true,                     /* Enable project compilation */
    // "tsBuildInfoFile": "./",               /* Specify file to store incremental compilation information */
    // "removeComments": true,                /* Do not emit comments to output. */
    // "noEmit": true,                        /* Do not emit outputs. */
    // "importHelpers": true,                 /* Import emit helpers from 'tslib'. */
    // "downlevelIteration": true,            /* Provide full support for iterables in 'for-of', spread, and destructuring when targeting 'ES5' or 'ES3'. */
    // "isolatedModules": true,               /* Transpile each file as a separate module (similar to 'ts.transpileModule'). */

    /* Strict Type-Checking Options */
    "strict": true,                           /* Enable all strict type-checking options. */
    // "noImplicitAny": true,                 /* Raise error on expressions and declarations with an implied 'any' type. */
    // "strictNullChecks": true,              /* Enable strict null checks. */
    // "strictFunctionTypes": true,           /* Enable strict checking of function types. */
    // "strictBindCallApply": true,           /* Enable strict 'bind', 'call', and 'apply' methods on functions. */
    // "strictPropertyInitialization": true,  /* Enable strict checking of property initialization in classes. */
    // "noImplicitThis": true,                /* Raise error on 'this' expressions with an implied 'any' type. */
    // "alwaysStrict": true,                  /* Parse in strict mode and emit "use strict" for each source file. */

    /* Additional Checks */
    // "noUnusedLocals": true,                /* Report errors on unused locals. */
    // "noUnusedParameters": true,            /* Report errors on unused parameters. */
    // "noImplicitReturns": true,             /* Report error when not all code paths in function return a value. */
    // "noFallthroughCasesInSwitch": true,    /* Report errors for fallthrough cases in switch statement. */
    // "noUncheckedIndexedAccess": true,      /* Include 'undefined' in index signature results */

    /* Module Resolution Options */
    // "moduleResolution": "node",            /* Specify module resolution strategy: 'node' (Node.js) or 'classic' (TypeScript pre-1.6). */
    // "baseUrl": "./",                       /* Base directory to resolve non-absolute module names. */
    // "paths": {},                           /* A series of entries which re-map imports to lookup locations relative to the 'baseUrl'. */
    // "rootDirs": [],                        /* List of root folders whose combined content represents the structure of the project at runtime. */
    // "typeRoots": [],                       /* List of folders to include type definitions from. */
    // "types": [],                           /* Type declaration files to be included in compilation. */
    // "allowSyntheticDefaultImports": true,  /* Allow default imports from modules with no default export. This does not affect code emit, just typechecking. */
    "esModuleInterop": true,                  /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
    // "preserveSymlinks": true,              /* Do not resolve the real path of symlinks. */
    // "allowUmdGlobalAccess": true,          /* Allow accessing UMD globals from modules. */

    /* Source Map Options */
    // "sourceRoot": "",                      /* Specify the location where debugger should locate TypeScript files instead of source locations. */
    // "mapRoot": "",                         /* Specify the location where debugger should locate map files instead of generated locations. */
    // "inlineSourceMap": true,               /* Emit a single file with source maps instead of having a separate file. */
    // "inlineSources": true,                 /* Emit the source alongside the sourcemaps within a single file; requires '--inlineSourceMap' or '--sourceMap' to be set. */

    /* Experimental Options */
    // "experimentalDecorators": true,        /* Enables experimental support for ES7 decorators. */
    // "emitDecoratorMetadata": true,         /* Enables experimental support for emitting type metadata for decorators. */

    /* Advanced Options */
    "skipLibCheck": true,                     /* Skip type checking of declaration files. */
    "forceConsistentCasingInFileNames": true  /* Disallow inconsistently-cased references to the same file. */
  }
}

```

# Vue 安装

1. 安装脚手架 ```npm install -g @vue/cli```
2. 开启脚本支持
3. 启动即可

# Vue 新特性

