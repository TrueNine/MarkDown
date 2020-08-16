# 1 概述

```html
<!DOCTYPE html>
<html lang="zh-CN">

  <head>
    <!-- 开发环境版本，包含了有帮助的命令行警告 -->
    <meta charset="UTF-8"/>
    <!--引入 vue.js-->
    <script src="../vue/vue.js"></script>
    <title>没有标题</title>
  </head>

  <body>
    <h1 id="app">{{message}}</h1>
    <h1 class="app">{{message}}</h1>

  </body>

</html>
<script type="text/javascript">
  // 创建 vue 对象
  let vm = new Vue({
    // 设置挂载点
    /*
        * 挂载点可以是 #id,也可以是类. , 但建议使用 #id
        * 不可以挂载在 body head html 上
        * 同时也不可以挂载于单标签
        * */
    el: ".app",
    // 传入数据
    data: {
      message: "hello"
    }
  });
</script>
```

## MVVM

![Vue-MVVM](../../img/vue%E7%AD%89%E6%A1%86%E6%9E%B6/Vue-MVVM.gif)

# 2 插值操作

如何将 data 中的值,插入DOM 进行显示

## Mustache {{}}

```vue
<!--可以直接取值-->
{{variable}}
<!--也可进行拼接操作-->
{{variableA + variableB}}
<!--同样可以进行简单运算操作-->
{{variable + 1}}
```

# 3 Vue 指令

## 不太常用指令

### v-once

​	当只希望使用一次变量时,就可以使用此指令

```html
<p v-once>
  <!--其中数据赋值一次之后,就不会进行改变-->
  {{message}}
</p>
```

### v-html

​	被渲染的值,会被解析为 html文档进行显示

```html
<div v-html="variable">

</div>
```



v-text

​	被渲染的值,会以 文本 形式进行渲染,==但会覆盖所有的文本值==

```html
<p v-text="variable">

</p>
```

### v-pre

​	原封不动地显示某些特定的值

```html
<div v-pre>
  <!--会原封不动地输出{{message}}-->
  {{message}}
</div>
```

### v-cloack

​	html自上而下进行解析网页,但vue留下了一些标记,使得==可能会出现一些一闪而过的情况(**数据没有及时进行渲染**)==,此时就可以使用 v-cloak  进行标记,vue加载完成后,会将此标记去除

#### 示例: 隐藏闪烁

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>VUE</title>
    <script src="./vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">
      [v-cloak] {
        display: none;
      }
    </style>
  </head>
  <body>
    <div id="vueApp" v-cloak>
      <p>{{message}}</p>
    </div>
    <script type="text/javascript">
      const vm = new Vue({
        el: "#vueApp",
        data: {
          message: "hello"
        },
        methods: {}
      });
    </script>
  </body>
</html>
```

## v-bind

​	动态地对属性进行绑定,==属性不能使用 mustache 语法==

```html
<a v-bind:href="variable">动态绑定了href属性的连接</a>
```

也可以使用简写

```html
<a :href="variable">动态绑定了href属性的连接</a>
```

### 动态绑定class

在绑定传入的对象,传入一个对象即可控制

*   **如果存在原生的 class,则会进行合并**

```html
<h1 v-bind:class="{a: isActiveBorder,b: isActiveColor}"></h1>
```

#### 示例 . 切换显示

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>VUE</title>
    <script src="./vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">
      .a {
        border: solid 2px blue;
      }

      .b {
        color: red;
      }
    </style>
  </head>
  <body>
    <div id="vueApp" v-cloak>
      <h1 :class="{a: isActiveBorder,b:isActiveColor}"
          v-on:click="cutOver">这是一段文字</h1>
    </div>
    <script type="text/javascript">
      const vm = new Vue({
        el: "#vueApp",
        data: {
          isActiveBorder: true,
          isActiveColor: true,
        },
        methods: {
          cutOver: function () {
            this.isActiveBorder = !this.isActiveBorder;
          }
        }
      });
    </script>
  </body>
</html>
```

#### 数组语法

​	用的不多,但可以很灵活的使用

#### 示例 . 随机样式的按钮

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>VUE</title>
    <script src="./vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">
      .a {
        color: red;
      }

      .b {
        background-color: aqua;
      }

      .c {
        border-color: yellow;
      }
    </style>
  </head>
  <body>
    <div id="vueApp">
      <!--动态赋值给数组-->
      <button :class="randomClassName"
              @click="randomMethod">骚气的按钮
      </button>
    </div>
    <script type="text/javascript">
      const vm = new Vue({
        el: "#vueApp",
        data: {
          randomClassName: [],
          className: ["a", "b", "c"]
        },
        methods: {
          /*每次进入,清空值组
      * 然后随机判断是否赋值*/
          randomMethod: function () {
            this.randomClassName = [];
            for (let i = 0; i < this.className.length; i++) {
              if (Math.random() > 0.8) {
                this.randomClassName.push(this.className[i]);
              }
            }
          }
        }
      });
    </script>
  </body>
</html>
```

#### 示例 . 点击事件动态添加样式

>   初始化为0,点击哪个条目,哪个条目为显示条目

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8"/>
    <title>VUE</title>
    <script src="./vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">
      .col {

        /*background-color: red;*/
        color: yellow;
      }

      .twoRow {
        background-color: #00000011;
      }
    </style>
  </head>
  <body>
    <div id="vueApp">
      <ul>
        <li v-for="(value,index) in datas"
            :class="{col: index === indexOf,twoRow: (index + 1) % 2 === 0}"
            @click="changeIndex(index)">{{value}}
        </li>
      </ul>
    </div>
  </body>
</html>
<script type="text/javascript">
  const vue = new Vue({
    el: "#vueApp",
    data: {
      indexOf: 0,
      datas: [
        "数据1",
        "数据2",
        "数据3",
        "数据4",
        "数据5",
        "数据6"
      ]
    },
    methods: {
      changeIndex: function (currentIndex) {
        this.indexOf = currentIndex;
      }
    }
  });
</script>
```

### 动态绑定 style

​	样式需要单独抽离,动态改变,则可以使用 动态绑定样式

#### 对象语法

1.  key 如果是类似 font-size 之类,可以使用驼峰命名替代,或者以 '' 将其包裹
2.  value 某些情况必须以 '' 包裹,使其能够正常解析

```html
<h2 :style="{fontSize: '50px',backgroundColor: 'red'}">测试动态绑定样式</h2>
```

#### 数组语法

​	某些情况下可能会使用,数组内的元素可以使用对象替代

```html
<h2 :style="[{'font-size': '50px'},{'background-color': 'red'}]">测试动态绑定样式</h2>
```

## 计算属性

​	通常一个值,在取值前需要进行处理,如: 双值相加得到一个值,对对象内的值进行改变

```html
<body>
  <div id="vueApp">
    <!--最原始的获取方式-->
    <h1>{{firstName}}&nbsp;{{lastName}}</h1>
    <!--使用getter方式-->
    <h1>{{getFullName()}}</h1>
    <!--使用计算属性方式,可简写不需要()-->
    <h1>{{getFullNameByComputed}}</h1>
  </div>
</body>
</html>
<script type="text/javascript">
  const vue = new Vue({
    el: "#vueApp",
    data: {
      firstName: "java",
      lastName: "Script"
    },
    methods: {
      /*getter方式*/
      getFullName: function () {
        return this.firstName + "" + this.lastName;
      }
    },
    computed: {
      /*计算属性方式*/
      getFullNameByComputed: function () {
        return this.firstName + "" + this.lastName;
      }
    }
  });
</script>
```

​	完全的写法: computed 内的每个属性都是对象,而每个对象都规定有 set(可以省略),get, 获取值的同时会给予某个对象的 get,如果对此属性,进行赋值操作,则会调用其中的 set 方法,但绝大多数情况下,都只会使用 get

```vue
getFullNameByComputed: {
        set: function (newValue) {
          let split = newValue.split(" ");
          this.firstName = split[0];
          this.lastName = split[1];
        },
        get: function () {
          return this.firstName + " " + this.lastName;
        }
      }
```

​	**计算属性的最大价值是其本身的缓存机制**,如果两次调用,传入的参数为相同的,则会直接返回结果,==不会进行重复调用==

## v-on

​	绑定一定是事件于内容之上

```html
<body>
<div id="vueApp">
  <button v-on:click="increment">+</button>
  {{count}}
  <button v-on:click="decrement">-</button>
</div>
</body>
</html>
<script type="text/javascript">
  const vue = new Vue({
    el: "#vueApp",
    data: {
      count: 0
    },
    methods: {
      increment() {
        this.count++;
      },
      decrement() {
        this.count--;
      }
    }
  });
</script>
```

### 语法糖形式

```html
<button @click="increment">+</button>
{{count}}
<button @click="decrement">-</button>
```

### 参数传递

*   如果一个事件调用的方法没有参数,则可以省略 ()
*   如果方法有形参,而没有传递实参(),==形参的值为undefined==
*   如果方法有形参,而没有传递实参,同时省略 (),==vue默认会将 Event 事件对象传递到参数列表==
*   如果方法形参,同时需要event,其他参数,而不传递参数,则会报错
    *   **必须使用 $event 传入事件**,

### 事件修饰符

*   .stop 调用 event.stopPropagation() 阻止事件冒泡
*   .prevent 调用 event.preventDefault() 阻止默认事件(比如submit的自动提交)
*   .keyCode .keyAlias keyDown,keyUp,事件监听特定的按键的键代码或键别名
*   .navtie 监听自定义组件
*   .once 只执行一次

#### 事件冒泡

​	一个页面中的dom存在父子关系,并且都绑定了相同事件,就会存在事件冒泡的情况并发生

## 判断指令

​	没啥好说的

*   v-if
*   v-else
*   v-else-if

### vue 虚拟DOM复用问题

​	如果需要替换DOM时,VUE会将要替换的元素进行对比,发现可复用组件并不会进行直接替换,而是直接使用原先的DOM并替换其中的属性,如果不希望发生此种情况,则可以使用 key 属性进行标识,不同的 key 并不会进行复用

### v-if 与 v-show 的区别

​	v-if 操作DOM,v-show 操作样式(display: nomo)

## v-for

​	循环遍历元素的指令

```html
<ul>
  <li v-for="取值 in 数组">{{取值}}</li>
</ul>
```

### 带索引的取值方式

```html
<ul>
  <li v-for="(取值,索引) in 数组">{{索引}},{{取值}}</li>
</ul>
```

### 遍历对象

​	如果按照以上方式进行遍历,则 **第一个为value,第二个为key**

### 性能问题

​	向数组内插入元素(splice或者其他),会向后挨个进行替换操作(diff算法),所以建议为每一个元素绑定不同的key

==但绑定的 key 会存在重复问题,尽量避免此问题的出现,如同Map结构的 Key一般==

```html
<li v-for="(item,index) in mea" :key="item">{{item}}</li>
```

### 数组的响应式

​	在渲染后,**直接修改数组索引的值,是不会进行渲染的**

#### 常见的响应式方法

| 方法                               | 说明                        |
| ---------------------------------- | --------------------------- |
| push                               | 向数组最后追加元素          |
| pop                                | 删除数组最后一个元素        |
| unshift                            | 在数组的最前方增加元素      |
| shift                              | 删除数组最前方的元素        |
| splice(start)                      | 从开始位置删除元素,直到最后 |
| splice(start,count)                | 从 start 删除指定数量的元素 |
| splice(start,count,Object... args) | 删除指定位置后,插入元素     |
| sort                               | 排序                        |
| reverse                            | 反转                        |

#### 修改索引的解决

1.  通过 splice 解决

```javascript
function(index,element) {
  this.arrays.splice(index,1,element);
}
```

2.  通过 vue 的 set 方式进行操作

```javascript
Vue.set(Object,index,element);
```

## v-model

​	用于动态绑定 form 表单的值

### 对比

1.  普通写法

```html
<input type="text" v-bind:value="message" v-on:input="message = $event.target.value"/>
```

2.  model写法

```html
<input type="text" v-model="message"/>
```

### 结合 radio 与 selected

​	单选为布尔值或字符串(select),多选则为数组型

### 修饰符

.lazy  只在失去焦点或回车进行提交

.number  使得处理的为数值类型

.trim  去除字符串首尾空格

# 4 ES6新特性

## 数组的高阶函数

```javascript
function ar() {
  let array = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  return array.filter(function (n) {
    return n % 2;
  }).map(function (n) {
    return n * 2;
  }).reduce(function (preValue, n) {
    return n += preValue;
  });
}
```

## 箭头函数

​	当需要把函数作为参数传递的时候哦,就可以使用箭头函数,类似于 **Lambda 表达式** ?

### 定义函数的方式

```javascript
// 1. 定义函数的方式
const f = function() {
  ...
}
  
// 2. 在对象字面量中定义函数
const obj = {
  f: function() {
    
  },
  // 含义相同的定义
  f() {
    
  }
}

// 箭头函数
let a = () => {...};
  
let a = (参数列表) => {
  ...
};
  
// 如果参数只有一个,可以不写 ()
let f = sum = {......};
               
// 函数只有一句语句的写法,而且不需要return,如果没有返回,则返回值为 undefined
let sum = (num1,num2) => num1 + num2;
```

### 箭头函数中的 this

​	当中的 this 取的是作用域最近的 this



## Promiss

​	js 中,一种**异步编程**的解决方案

​		网络请求:  不能立即得到结果,平常代理自上而下执行,但网络请求不能立即得到内容

### then 和 catch

​	resolve == then,reject == catch, 不同的调用,则会执行不同的方法

```javascript
new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("拿到的数据");
  }, 1000);
}).then((data) => {
  document.write(data.toString());
}).catch(() => {
  document.write("捕获异常,处理另一种情况和错误");
});
```

### 直接在 then 调用

```javascript
new Promise((resolve, reject) => {
  setTimeout(() => {
    //resolve("233");
    reject("发生错误");
  }, 1000);
}).then(data => {
  console.log(data);
}, err => {
  console.log(err);
});
```

### 链式调用

​	有时候需要进行进一步处理

```javascript
// 如果不需要 reject,可以不写
new Promise(resolve => {
  console.log("进入调用");
  resolve("数据");
}).then((res) => {
  // 进行了操作

  // 将数据拼接
  return new Promise(resolve => {
    resolve(res + "第二次进行处理");
  });
}).then((res) => {
  console.log("第三次接受到的数据" + res);
});
```

### 链式调用的简写方式

```javascript
// 链式调用的简写方式
new Promise(resolve => {
  console.log("进入调用");
  resolve("传入数据,");
}).then((res) => {
  return Promise.resolve(res + "第二次调用,");
}).then((res) => {
  return Promise.resolve(res + "第三次调用,");
}).then((res) => {
  return Promise.resolve(res + "第四次调用,调用结束");
}).then(res => {
  console.log(res);
});
```

>   更简洁的写法是,直接返回,如果是 reject 则直接 throw 抛出即可

### all 方法

​	传入一个数组,该数组内包含一系列的异步任务,只有所有的请求完成,then 方法统一进行回调,给予一个数组,包含所有的值

```javascript
Promise.all([
  new Promise(resolve => {
    setTimeout(() => {
      resolve("第一个请求");
    }, 1000);
  }),
  new Promise(resolve => {
    setTimeout(() => {
      resolve("第二个请求");
    }, 5000);
  })
]).then(args => console.log(args));
```



# 5 vue 组件化

​	简单的注册一个组件,只需要:

1.  创建构造对象,写入template
2.  注册模板

```html
<body>
  <div id="vueApp">
    <v_em></v_em>
    <v_em></v_em>
  </div>
</body>
</html>
<script type="text/javascript">
  // 创建构造对象
  let constructor = Vue.extend({
    template: `
<div>
<h1>测试的显示内容</h1>
<form>
<input type="text" name="description"/>
  </form>
  </div>`
  });
  // 注册组件
  Vue.component("v_em", constructor);

  const vue = new Vue({
    el: "#vueApp",
    data: {},
    methods: {}
  });
</script>
```

## 全局组件与局部组件

​	上述注册方式则为全局组件,任何 Vue 实例都可以使用,但开发中大多数都是使用局部组件,局部组件则直接挂在于Vue实例

```javascript
// 创建构造对象
let constructor = Vue.extend({
  template: `
<div>
<h1>测试的显示内容</h1>
<form>
<input type="text" name="description"/>
</form>
</div>`
});

const vue = new Vue({
  el: "#vueApp",
  data: {},
  methods: {},
  components: {
    c: constructor
  }
});
```

## 父组件和子组件

​	组件之间可以互相嵌套使用,只在组件内声明 **components** 即可

```javascript
const subassembly = Vue.extend({
  template: `
<div>
<span>这是子组件的内容</span>
</div>`
});
const constructor = Vue.extend({
  template: `
<div>
<h1>这是父组件的内容</h1>
<sr></sr>
</div>`,
  // 使用子组件
  components: {
    sr: subassembly
  }
});
const vue = new Vue({
  el: "#vueApp",
  data: {},
  methods: {},
  components: {
    con: constructor
  }
});
```

## 注册组件的简写形式

```javascript
// 全局组件简写形式,底层还是调用 extend
const constructor = Vue.component("acg", {
  template: `<h1>vue的简写形式</h1>`
});

const vue = new Vue({
  el: "#vueApp",
  data: {},
  methods: {},
  // 注册局部组件的形式
  components: {
    "acgr": {
      template: `
<h1>局部组件简写形式</h1>
`
    }
  }
});
```

## 组件模板分离

1. 使用 script 标签 ,类型为: ```text/x-template```?,然后 template 通过id进行查找渲染

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8"/>
    <title>VUE</title>
    <script src="../vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">

    </style>
  </head>
  <body>
    <div id="vueApp">
      <templates></templates>
    </div>
  </body>
</html>
<script type="text/x-template" id="t">
  <div>
    <h1>测试text/x-template</h1>
    <hr/>
    <video src="https://www.bilibili.com/video/BV15741177Eh?p=56"></video>
  </div>
</script>
<script type="text/javascript">
  const l = Vue.component("templates", {
    template: "#t"
  });
  const vue = new Vue({
    el: "#vueApp",
    data: {},
    methods: {}
  });
</script>
```

2.  将script 替换为 template 进行抽离,效果同上

```html
<template id="t">
  <div>
    <h1>测试text/x-template</h1>
    <hr/>
    <video src="https://www.bilibili.com/video/BV15741177Eh?p=56"></video>
  </div>
</template>
```

## 组件自身的数据存储

​	组件本身也有 data,methods..... 只是 data 必须是一个函数,而且这个函数返回一个对象,==该对象存储相应数据==

​		假设是对象: 所有实例化的模板都会指向同一对象(你懂的)

​		如果需要全局受到影响:  则可以直接返回一个全局对象

```javascript
const obj = {
  message: "3",
  counter: 0
};

Vue.component("acg", {
  template: "#a",
  data() {
    return obj;
  },
```

## 父子组件通信

*   通过 props 向子组件传递数据
*   通过 事件传递,向父组件发送信息

### 父组件向子组件传递

​	通过 props 进行声明,使用模板时,==使用 v-bind进行赋值==

```html
<!--使用时必须以 v-bind 赋值,否则为当前字面量-->
<cpn :a="arrays" :b="$attrs"></cpn>
```

1.  数组声明式

```javascript
components: {
  "cpn": {
    template: "#cpn",
      props: ["a", "b"]
  }
}
```

2.  对象限制类型声明式

```javascript
components: {
  "cpn": {
    template: "#cpn",
      props: {
        a: Array,
          b: String
      }
  }
}
```

3.  对象声明式增强写法

```javascript
components: {
  "cpn": {
    template: "#cpn",
      props: {
        a: {
          type: Array,
            default: [1, 2, 3],
              required: true
        },
          b: {
            type: String,
              default: "我是真的强",
                required: false
          }
      }
  }
}
```

>   *   type: 限制的类型
>   *   default: 默认值
>   *   required: 此值不能为空

在新版的 Vue 中,如果默认值是 Object 或者 Array,==default 必须是函数,然后返回此值==

```javascript
components: {
  "cpn": {
    template: "#cpn",
      props: {
        a: {
          type: Array,
            default() {
              return [1, 2, 3];
            },
              required: true
        },
          b: {
            type: String,
              default: "我是真的强",
                required: false
          }
      }
  }
}
```

4.  也可以是自定义类型

### 驼峰命名问题

​	如果声明的引用名是驼峰形式,在 绑定数据时,**如果写为原名则会报错**,正确的写法如下,==以-进行分割==

```html
<!--变量名为: myEmployeesTable-->
<cpn :my-employees-table="xxx"></cpn>
```

### 子组件向父组件发送数据

​	核心是通过 $emit 进行发送

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8"/>
    <title>VUE</title>
    <script src="../vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">

    </style>
  </head>
  <body>
    <div id="vueApp">
      <!--将事件绑定-->
      <cpn @item-click="parentF"></cpn>
    </div>
  </body>
</html>
<template id="cpn">
  <div>
    <!--子组件调用事件-->
    <button v-for="(item,index) in categories"
            @click="btnClick(item)">{{item.name}}
    </button>
  </div>
</template>
<script type="text/javascript">

  const vue = new Vue({
    el: "#vueApp",
    data: {},
    methods: {
      // 父组件接受数据
      parentF(item) {
        console.log(item);
      }
    },
    components: {
      cpn: {
        template: "#cpn",
        data() {
          return {
            categories: [
              {id: "aaa", name: "热门推荐"},
              {id: "bbb", name: "手机数码"},
              {id: "ccc", name: "家用家电"},
              {id: "ddd", name: "电脑办公"},
            ]
          }
        },
        methods: {
          // 子组件通过 $emit 发送数据
          btnClick(item) {
            console.log("子组件" + item);
            // 自定义事件名称,并携带参数
            this.$emit("item-click", item);
          }
        }
      }
    }
  });
</script>
```

### 父组件访问子组件对象

#### $children

​	通过此属性,获取一个包含所有子组件的数组对象,通过遍历此数组,可以找到所有的子组件. 但此种方式不推荐使用,除非需要对所有组件进行作用

#### $refs

​	此对象本身是没有值的,必须在组件之上 **加上ref属性,指定一个key,只有指定了ref属性的组件才会呗加入到对象当中**,获取此对象只需通过```$refs.key```即可获得指定子组件

### 子组件访问父组件对象

#### $parent

​	通过此属性,可以直接访问父组件,但耦合度很高(万一不存在父组件???)

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8"/>
    <title>VUE</title>
    <script src="../vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">

    </style>
  </head>
  <body>
    <div id="vueApp">
      <cpn></cpn>
    </div>
  </body>
</html>
<template id="cpn">
  <div>
    <button @click="btnClick">按钮</button>
    // 组件内使用子组件
    <cpn2></cpn2>
  </div>
</template>
<template id="cpn2">
  <div>
    <button @click="btnClick">按钮</button>
  </div>
</template>
<script type="text/javascript">
  // 根组件
  const vue = new Vue({
    el: "#vueApp",
    data: {},
    methods: {},
    // 组件
    components: {
      cpn: {
        template: "#cpn",
        data() {
          return {
            name: "233"
          }
        },
        methods: {
          btnClick() {
            console.log(this.$parent);
          }
        },
        // 组件内的子组件
        components: {
          cpn2: {
            template: "#cpn2",
            methods: {
              btnClick() {
                console.log(this.$parent.name);
              }
            }
          }
        }
      }
    }
  });
</script>
```

#### $root

​	直接访问根组件(Vue)

## 插槽 slot

​	让封装的组件更具有扩展性,让使用者决定组件中的一些内容

1.  定义插槽,使用 slot 标签
2.  在使用组件时,将需要填充的内容放置于组件标签内即可(不指定name属性)
3.  插槽内存在内容,则会呗 **默认渲染**
4.  如果有多个插槽,**插槽本身指定 name 属性**,在使用组件时,内容标签 **指定slot属性**,即会呗渲染到指定的插槽内

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8"/>
    <title>VUE</title>
    <script src="../vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">

    </style>
  </head>
  <body>
    <div id="vueApp">
      <!--覆盖插槽内的值-->
      <cpn><h1>替换插槽内的内容</h1></cpn>
      <!--替换带有名称的插槽-->
      <cpn><span slot="left">替换后的文本,span</span></cpn>
    </div>
  </body>
</html>
<template id="cpn">
  <div>
    <slot>
      <!--插槽内的默认值,全部替换-->
      <button>按钮</button>
    </slot>
    <slot name="left"><p>默认文本</p></slot>
  </div>
</template>
<script type="text/javascript">
  const vue = new Vue({
    el: "#vueApp",
    data: {},
    methods: {},
    components: {
      cpn: {
        template: "#cpn"
      }
    }
  });
</script>
```



### 编译作用域

​	总结一点: 在某个组件内,作用域就是该组件(模板,指定ID 的 uveapp....)

### 作用域插槽

​	父组件替换插槽内的标签,但内容由子组件提供

1.  在子组件模板的插槽内声明一个引用(```:name="variable"```),绑定于当前组件的某个对象
2.  在使用数据时,定义 template(vue2.5.x后可以任意??),使用(```slot-scope="slot"```)属性,绑定到slot
3.  获取值时,使用: (```slot.variable```) 进行获取

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8"/>
    <title>VUE</title>
    <script src="../vue/vue.js" type="text/javascript" charset="UTF-8"></script>
    <style type="text/css">

    </style>
  </head>
  <body>
    <div id="vueApp">
      <cpn>
        <!--此处获取子组件中的数据,vue2.5.x,之后支持不使用 template-->
        <template slot-scope="slot">
          <!--使用子组件的数据-->
          <span>{{slot.data.join(" - ")}}</span>
        </template>
      </cpn>
    </div>
  </body>
</html>
<template id="cpn">
  <div>
    <h1>开头</h1>
    <!--子组件定义作用域插槽,同时指定绑定数据-->
    <slot :data="names">
      <ul>
        <li v-for="(item,index) in names"></li>
      </ul>
    </slot>
    <h4>结尾</h4>
  </div>
</template>
<script type="text/javascript">
  const vue = new Vue({
    el: "#vueApp",
    data: {},
    methods: {},
    components: {
      cpn: {
        template: "#cpn",

        data() {
          return {
            names: ["1", "2", "3", "4", "5"]
          };
        }
      }
    }
  });
</script>
```

# 6 模块化开发(ES6)

在 html 引入 type **必须是 module**

```html
<script src="path" type="module"></script>
```

```javascript
// 从暴露的module导入
import {variable,...} from "path";

// 导入全部的属性
import * as name form "path";
name.xxx;
name.xxx;

// 向外暴露
export export {variable,...};

// 导出,导入时不需要命名
export default variable;
export name form "path";
let a = name;


// 同上可以直接导出声明
export var a = 1024;
export var b = 2048;

// 也可以直接导出函数
export function f(num1,num2) {
  ...
}

// 也可以直接导出一个类 (ES6)
export class Person {
  run() {
    ...
  }
}
```

export default ```可以在别的 module 时不进行强制命名,但每个module只能使用一次```

# 7 webpack

​	类似于 maven 的打包工具???,将所有不能识别的代码转换为浏览器可以执行的代码

## 环境搭建

1.  node.js webpack必须依赖于node
2.  npm / cnpm:  node packages manager

### 设置为淘宝镜像

```powershell
npm config set registry https://registry.npm.taobao.org

// 查看是否配置完成
npm config get registry
```



### 安装 webpack 全局

```powershell
npm install webpack@3.6.0 -g
```

### 在项目内编写 webpack.config.js

```javascript
// 引用 node 的 path
const path = require("path");

// 编写入口与出口
module.exports = {
  // 程序入口
  entry: "./src/main.js",
  // 出口,必须为绝对路径
  output: {
    // 使用此函数获取当前文件夹的绝对路径
    path: path.resolve(__dirname, "dist"),
    // 输出到的文件 
    filename: "bundle.js"
  }
};
```

### 初始化 npm

```powershell
npm init
```

### 修改 package.json

```json
{
  "name": "mywebpack",
  "version": "1.0.0",
  "description": "没有描述",
  "main": "index.js",
  // 映射命令,以供给 npm run xxx 使用
  // 会先从本地执行,如果本地没有,则从全局获取
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "build": "webpack"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "webpack": "^3.6.0"
  }
}
```

### 安装本地webpack 为开发时依赖

```powershell
npm install webpack@3.6.0 --save-dev
```

## wepack Loader

​	webpack中一个核心的概念,加载css.less.sass,es6转es5......

 	1. 通过 npm 安装对应loader
 	2. 在web.config.js中,modules关键字下进行配置

>   use 读取多个 loader 时,按照从右向左的顺序进行读取

### css 配置

1.  安装css loader,style loader (**建议cssloader为 2.0.2,styleloader为 0.23.1**)

```shell
npm --save-dev css-loader
```

2.  配置webpack.config.js,在依赖内加入

```javascript
module: {
  rules: [
    // css,style
    {
      test: /\.css$/,
      // 从右向左读取
      use: ["Style-loader","css-loader"]
    }
  ]
}
```

### less配置

1.  安装lessloader(建议4.0.1) 和 less

```shell
npm install --save-dev less-loader less
```

### 图片配置

1.  安装 urlloader,建议为1.1.2

```shell
npm install --save-dev url-loader
```

2.  配置loader

```javascript
// 图片配置
{
  // 匹配的图片格式
  test: /\.(jpg|jpeg|png|gif)/,
    use: [
      {
        loader: "url-loader",
        // 超过此大小(B),会直接将图片转换为base64
        options: {
          limit: 1024,
          // 图片打包后命名规范 :
          // [name]原先图片的名字
          // [hash:8] 8位hash值
          // [ext] 扩展名
          // . - 连接字符
          name: "image/[name]-[hash:8].[ext]"
        },
      }
    ]
}
```

3.  安装fileloader,建议3.1.1

```shell
npm install --save-dev file-loader
```

4.  暂时性地配置一个publicpath,**output**

```javascript
publicPath: "dist/"
```

### 转换为ES5

1.  安装babe-loader,babel-core,babel-preset-es2015,(babel建议为7)

```shell
npm install --save-dev babel-loader@7 babel-core babel-preset-es2015
```

2.  进行配置

```javascript
{
  test: /\.js$/,
    // 排除某些目录不做转换
    exclude: /(node_modules|bower_components)/,
      use: {
        loader: "babel-loader",
          options: {
            presets: ["es2015"]
          }
      }
}
```

## vue

1.  安装vue,建议使用2.5.21 

```shell
npm install --save vue
```

2.  在项目内导入 vue,然后可以使用

```javascript
import Vue from "vue";
```

3.  配置webpack.config,添加 resolve,**暂时使用,为了能挂载**

```javascript
resolve: {
  alias: {
    "vue$": "vue/dist/vue.esm.js"
  }
}
```

### template 与 el 的关系

```javascript
new Vue({
  el: "#app",
  data: {
    message: "this is for everyOne"
  },
  methods: {},
  template: `
<div>
<h1>{{message}}</h1>
</div>
`
});
```

>   一旦定义 template,**vue在编译时会将源码替换到挂在组件内**,

### 进行二次封装,抽离到单独的组件

```javascript
// 引入vue,并使用
import Vue from "vue";

const app = {
  template: `
<div>
<h1>{{message}}</h1>
<button @click="btnClick">按钮</button>
</div>
`,
  data() {
    return {
      message: "this is for everyOne"
    }
  },
  methods: {
    btnClick() {

    }
  }
}
new Vue({
  el: "#app",
  template: `
<app/>`,
  components: {
    app
  }
});
```

### 进行第三次封装,抽离到单独的js文件

​	将组件写到特定的文件,然后该组件进行导出

```javascript
export default {
  template: `
<div>
<h1>{{message}}</h1>
<button @click="btnClick">按钮</button>
</div>
`,
  data() {
    return {
      message: "this is for everyOne"
    }
  },
  methods: {
    btnClick() {

    }
  }
}
```

​	然后在需要使用的地方进行导入,**但模板和 js 并没有进行分离**

```javascript
/ 引入vue,并使用
import Vue from "vue";

// 导入组件进行使用
import App from "./js/App";
new Vue({
  el: "#app",
  template: `
<app/>`,
  components: {
    App
  }
});
```

### 进行第四次封装,使用vue文件

```javascript
// 引入vue,并使用
import Vue from "vue";

// 导入 vue 文件类的组件进行使用
import App from "./js/App.vue";

new Vue({
  el: "#app",
  template: `
    <app/>`,
  components: {
    App
  }
});
```

​	在 vue 文件内书写

```vue
<template>
<div>
  <h1 class=".b">{{message}}</h1>
  <button @click="btnClick">按钮</button>
  </div>
</template>

<script>
  export default {
    name: "App",
    data() {
      return {
        message: "this is for everyOne"
      }
    },
    methods: {
      btnClick() {

      }
    }
  }
</script>

<style scoped>
  .b {
    color: greenyellow;
  }
</style>
```

## 配置Vue

​	在书写为 vue 文件时,就需要此配置了

### 配置对应 loader

1.  安装 vue-loader,vue-template-compiler,(vue-loader建议13.0.0,因为高版本需要插件,**vue-compiler 必须和 vue 版本一致**)

```shell
npm install vue-loader vue-template-compiler --save-dev
```

2.  进行webpack配置

```javascript
{
  test: /\.vue$/,
    use: [
      {loader: "vue-loader"}
    ]
}
```

3.  如果想省略.vue,可以在webpack进行配置

```javascript
resolve: {
  extensions: [".js", ".css", ".vue"],
    alias: {
      "vue$": "vue/dist/vue.esm.js"
    }
}
```

## webpack插件

### 横幅插件

​	webpack自带,在每个文件页头增加一句话

​		在和出入口同级别的位置

```javascript
plugins: [
  new BannerPlugin("最终版权归 True_Nine 所有")
]
```

### 打包html插件

​	可以做

>   *   打包html文件
>   *   根据模板生成 index.html
>   *   自动向html内插入script标签,到 body当中

1.  安装此插件 建议3.0.2

```shell
npm install html-webpack-plugin --save-dev
```

2.  配置插件,并将index.html模板引入

```javascript
new htmlWebpackPlugin({
  template: "index.html"
})
```

3.  清除一些配置(非必要,如果没有配置)

```javascript
// 暂时性地配置
// publicPath: "dist/"
```

​	html  index模板

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>index</title>
  </head>
  <body>
    <div id="app">
    </div>
  </body>
</html>
```

### 压缩代码插件

​	将代码压缩到一定程度,以减小文件大小,**但不能与横幅插件一起使用**

1.  安装 uglifyjs-webpack-plugin (建议版本1.1.1)

```shell
npm install html-webpack-plugin --save-dev
```

2.  在 plugins 引入插件,并绑定模板

```
const uglifyJsPlugin = require("uglifyjs-webpack-plugin");
```

### 本地服务器

​	让代码实时编译到内存,然后监听修改,就不用修改一次编译一次

1.  安装此插件 建议版本2.9.3

```shell
npm install webpack-dev-server --save-dev
```

2.  配置webpack,在出入口同级

```javascript
devServer: {
  // 服务对象文件夹
  contentBase: "./dist"
  // 是否需要实时进行监听
  inline: true,
    // 指定端口
    port: 80
}
```

3.  package.json 配置一条命令,在后加上参数,即表明立即打开浏览器

```json
"dev": "webpack-dev-server --open"
```

4.  启动即可

## webpack配置分离

1.  安装 webpack-merge,建议版本为 4.1.5

```shell
npm install webpack-merge@4.1.5 --save-dev
```

2.  抽离配置文件,将公共部分放置一处,将开发和打包放置一处

>   *   公共部分
>
>   ```javascript
>   const path = require("path");
>   const htmlWebpackPlugin = require("html-webpack-plugin");
>   
>   module.exports = {
>     entry: "./src/main.js",
>     output: {
>       path: path.resolve(__dirname, "../dist"),
>       filename: "bundle.js",
>     },
>     module: {
>       rules: [
>         {
>           test: /\.css$/,
>           use: ["style-loader", "css-loader"]
>         },
>         {
>           test: /\.less$/,
>           use: [
>             {loader: "style-loader"},
>             {loader: "css-loader"},
>             {loader: "less-loader"}]
>         },
>         {
>           test: /\.(jpg|jpeg|png|gif)/,
>           use: [
>             {
>               loader: "url-loader",
>               options: {
>                 limit: 1024,
>                 name: "image/[name]-[hash:8].[ext]"
>               },
>             }
>           ]
>         },
>         {
>           test: /\.js$/,
>           exclude: /(node_modules|bower_components)/,
>           use: {
>             loader: "babel-loader",
>             options: {
>               presets: ["es2015"]
>             }
>           }
>         },
>         {
>           test: /\.vue$/,
>           use: {
>             loader: "vue-loader"
>           }
>         }
>       ]
>     },
>     resolve: {
>       extensions: [".js", ".css", ".vue"],
>       alias: {
>         "vue$": "vue/dist/vue.esm.js"
>       }
>     },
>     plugins: [
>       new htmlWebpackPlugin({template: "index.html"}),
>     ]
>   };
>   ```
>
>   *   开发部分
>
>   ```javascript
>   const webpackMerge = require("webpack-merge");
>   const baseConfig = require("./base.config");
>   
>   module.exports = webpackMerge(baseConfig, {
>     devServer: {
>       contentBase: "./dist",
>       inline: true,
>       port: 80
>     }
>   });
>   ```
>
>   *   打包部分
>
>   ```javascript
>   const UglifyJsWebpackPlugin = require("uglifyjs-webpack-plugin");
>   const webpackMerger = require("webpack-merge");
>   const baseConfig = require("./base.config");
>   
>   module.exports = webpackMerger(baseConfig, {
>     plugins: [
>       new UglifyJsWebpackPlugin()
>     ]
>   });
>   ```

3.  修改 package.json,使得命令,指向自身的配置文件

```json
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "compiler": "webpack --config ./config/producetion.config.js",
  "development": "webpack-dev-server --open --config ./config/development.config.js"
}
```

4.  修改 输出路径,让其指向可行的(顶级)路径

```javascript
output: {
  path: path.resolve(__dirname, "../dist"),
    filename: "bundle.js",
}
```

## 请求路径封装

​	为某个文件夹取别名,以达到可以直接跳转到该文件夹

### vue-cli4 配置

​	新建 vue.config.js

```javascript
module.exports = {
  configureWebpack: {
    resolve: {
      extensions: [".vue", ".js", ".css", ".less", ".sass"],
      alias: {
        "assets": "@/assets",
        "components": "@/components",
        "views": "@/views"
      }
    }
  }
}
```



# 8 VUE - **C**ommand-**L**ine **I**nterface

​	是一个官方发布的 vue 脚手架,可以快速搭建vue开发环境,以及对webpack的配置

所依赖的环境

*   nodejs
*   npm
*   webpack

## vue-cli安装

1.  npm全局安装脚手架

```shell
npm install @vue/cli -g
```

2.  以防万一,安装个 2 的模板

```shell
npm install @vue/cli-init -g
```

## 初始化项目

​	此处是基于2的笔记

1.  ```vue init webpack projectName```
2.  进行选择

>   1.  项目名称
>   2.  描述
>   3.  作者
>   4.  .....

## cli2目录分析

```file
|-build  项目配置 webpack
|-config  项目配置 webpack
|-static  静态资源
...
```

## vue-cli3配置

>   与2的区别在于
>
>   1.  基于 webpack4,2还是webpack3
>   2.  0 配置,移除了一些配置文件.....
>   3.  提供了 vue ui 可视化配置
>   4.  移除了 static 新增了 public 文件夹,index.html移动到了 public 当中

### 构建项目

1.  ```vue create porjectName(不能大写)```
2.  选择对应需要的项目即可

### 配置项目

1.  可通过  ```vue ui``` 进行图形化配置
2.  在根目录创建 ```vue.config.js``` 使用 ```module.export = {}``` 进行配置
3.  可以在隐藏的目录内找到配置

# 9 前端路由 vue-router

​	要改变url让网页并不会刷新

	1. 改变url.hash

```javascript
location.hash = "lo";
```

2.  history

```javascript
// 向栈内压入一个地址,总是显示最后一个
history.pushState({},"",'uri');

// 移除之前栈顶的地址
history.back();

// 替换之前栈内的地址
history.replaceState({},"","about");

// 向前一个位置,下语句等价于 back
history.go(-1);

// 向前一个位置
histroy.forward();
```

## vue-router 配置

1.  安装路由

```shell
npm install vue-router --save
```

2.  导入调用

```javascript
// 导入路由
import Vue from "Vue";
import VueRouter from "vue-router";

// 1. 通过 vue.use 传入路由插件,安装插件
Vue.use(VueRouter);


// 2. 创建路由对象
const routes = [];
const router = new VueRouter({
  // 配置组件和映射关系
  routes
});

// 导出
export default router;
```

3.  创建路由实例,配置映射关系
4.  将路由实例挂在到vue实例

```javascript
import Vue from 'vue';
import App from './App.vue';
import router from './router/index';

Vue.config.productionTip = false;

new Vue({
  // 挂载 vue 实例
  router,
  render: h => h(App)
}).$mount('#app');

```

## 配置路由映射关系

```javascript
// 1. 通过 vue.use 传入路由插件,安装插件
Vue.use(VueRouter);


// 2. 创建路由对象
const routes = [
  // 空白路径重定向
  {
    path: "",
    redirect: "/about"
  },
  // 普通映射
  {
    path: "/home",
    component: home
  },
  {
    path: "/about",
    component: about
  }
];
```

>   使用 router-link 进行映射,**改变 to 属性使其映射到某个组件**
>
>   使用 router-view 进行显示

### 配置 history 模式

​	因为之前的模式都是 hash,会在链接后跟随 **/#/**

```javascript
const router = new VueRouter({
  // 配置组件和映射关系
  routes,
  // 改变路由模式
  mode: "history"
});

export default router;
```

## router-link 的其他属性

*   to 跳转到的地址
*   tag 指定要渲染的标签
*   replace 不会留下 history 记录 **没有属性**
*   active-class 活动时的 class,**替代原生的 class:  router-link-active**
    *   如果频繁修改,可以在路由内增加属性: ```linkActiveClass: "className"```

## 通过代码实现路由

```html
<script>
  export default {
    name: "App",
    methods: {
      btClick() {
        // 拿到当前组件,的 router 属性
        // vue-router源码内为每一个组件都加上了 此属性
        this.$router.push("/home");
      },
      btnClick2() {
        this.$router.replace("/about");
      }
    }
  }
</script>
```

## 动态路由

​	在某些情况下,一个path路径可能是不确定的 **/admin/user/info**

*   $router  整个路由对象
*   $route  谁处于活跃状态,拿到的就是哪个路由对象

动态获取可以采取**绑定的方式**对 router-link 的属性进行绑定,达到动态修改的效果

如果想获取值,则可以使用 **$route**的params.名称进行获取

### path的配置

```javascript
{
    path: "/user/:userId",
    component: user
  }
```

#### 取出参数

```vue
<template>
<div>
  <h1>哈哈哈</h1>
  <h2>{{userId}}</h2>
  </div>
</template>

<script>
  export default {
    name: "user",
    computed: {
      userId() {
        // 通过 route.params.参数名,获取对应参数
        return this.$route.params.userId
      }
    }
  }
</script>
```

## 路由懒加载

​	当打包时,所有的js代码,都打包到了一个文件,这样会导致性能下降,因而需要懒加载,**也强烈建议使用懒加载**

### 懒加载的方式

1.  结合 Vue 的异步组件和 webpack 的代码分析

```javascript
const name = resolve => {
  require.ensure(["path/path/path/component.vue"]),
  () => {resolve("path/path/path/path")}
};
```

2.  AMD 写法

```javascript
const name = resolve => require(["path/path/component.vue"],resolve);
```

3.  es6 中,来组织 Vue 异步组件和 webpack 的代码分割

```javascript
const home = () => import("path/path/component.vue");
```

## 路由嵌套

​	在路由的组件内嵌套路由即可

1.  在一个路由内声明属性```children[]```,在其内部声明即可

```javascript
{
  path: "/home",
    component: home,
      // 配置子路由
      children: [
        {
          // 不能加上 /
          path: "news",
          component: news
        },
        {
          path: "message",
          component: message
        }
      ]
}
```

## 参数传递

1.  使用之前的动态路由方式进行

2.  传递一个对象

    **需要将其绑定**,然后传入一个对象

    ```javascript
    {
      path: "/path",
        query: {
          name: "张三",
            age: 10
        }
    }
    ```

    3.  使用 **代码路由** 也可以传入对象

## router & route 的追溯

​	vue 有个原型 **prototype**,往上挂载方法即可,所以可以使用 router 和 route,类似于反射机制 ==纯属个人理解==

## 守卫

​	用于监听跳转的过程

### 生命周期

*   created 组件被创建后嗲用
*   mounted 组件被创建好后会调用
*   pudated 页面渲染刷新时会调用
*   destoryed 被销毁时调用

### 前置狗子使用

​	在跳转之前进行回调

```javascript
router.beforeEach((to, from, next) => {
  // 从 from 到 to
  document.title = to.matched[0].meta.title;
  // 必须调用 next 函数,才会执行下一步
  next();
});
```

​	上的 meta 是在 路由内定义

```javascript
{
  path: "/home",
    component: home,
      meta: {
        title: "首页"
      }
}
```

### 后置狗子

​	跳转完之后执行的函数, **afterEach**,没有next

### 其他狗子

​	路由独享守卫: 进入某个路由内才会被调用

​	组件内守卫: 进入某个组件才会被调用,具体可以查询官网

## keep-alive

​	一个内置组件,可以使被包含的组件保留状态,或避免被重新喜欢然

​	vue-router 也是一个组件,如果放在keep-alive内,所有路径匹配到的试图组件都会被缓存

​	==这样就避免了组件被频繁销毁,或者缓存一部分组件==

```html
<keep-alive>
  <router-view></router-view>
</keep-alive>
```

#### 保存状态

```javascript
activated() {
  // 处于活跃状态时,重新拼接路径
  this.$router.push(this.path);
},
  // 离开时保存路径
  beforeRouteLeave(to, from, next) {
    console.log("路由之前");
    this.path = this.$route.path;
    console.log(this.path);
    next();
  }
```

### keep-alive 标签的属性

指定包含或不包含哪些组件,不同的组件之间以 , 进行分割(**不能进行空格**)

*   include 包含哪些组件: (组件 name 属性)
*   exclude 不包含哪些组件,(组件name属性)
