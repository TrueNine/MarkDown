# 容器相关

## 组件注册

### @Configuration & @Bean

configuration：用于将一个 java 类变为配置类，使用此注解。

bean：在配置类内，为方法注解上，之后方法名为 bean id，返回值为该bean 的值，此注解的 value 值 可以指定 bean id

```java
@Configuration
public class ConfigurationAnnotationTestClass {

  @Bean(value = "p")
  public Person person() {
    Person person = new Person();
    person.setAge(1);
    person.setFirstName("张");
    person.setLastName("三");
    person.setBirthday(new Date(System.currentTimeMillis()));
    return null;
  }
}
```

### @ComponentScan

ComponetScan：用于在配置类 @Configuration 类中配置扫描包，在类上，value 指定扫描的包

```java
@ComponentScan(value = "org.truenine")
```

*   也可以使用 exclude 排除，include引入
*   给定固定的规则排除，排除指定的注解

```java
@ComponentScan(value = "org.truenine", excludeFilters = {
  @Filter(type = FilterType.ANNOTATION, classes = Controller.class)
})
```

*   引入指定的类型，包括其中的子类，实现类

```java
@ComponentScan(value = "org.truenine", excludeFilters = {
  @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = {
    ArrayList.class,
    LinkedList.class,
    Queue.class
      })
})
```

*   可以指定 useDefaultFilters 禁用或者启动默认过滤规则，让以只扫描 Controller，service……
*   也可以使用 AspectJ 表达式，正则表达式……
*   JDK8可使用重复注解来指定不同规则，其他可使用 @ComponentScans

#### 自定义规则

*   将规则设置为 CUSTOM
*   给定的规则必须是 Filter 的实现类

```java
public class MyTypeFilter implements TypeFilter {
  /**
     * Determine whether this filter matches for the class described by
     * the given metadata.
     *
     * @param metadataReader        当前正在扫描的类信息
     * @param metadataReaderFactory 可以获取到其他任何类的信息
     *                              for other classes (such as superclasses and interfaces)
     * @return whether this filter matches
     * @throws IOException in case of I/O failure when reading metadata
     */
  @Override
  public boolean match(MetadataReader metadataReader, MetadataReaderFactory metadataReaderFactory) throws IOException {
    // 获取类注解信息
    AnnotationMetadata annotationMetadata = metadataReader.getAnnotationMetadata();
    // 获取正在扫描的类信息
    ClassMetadata classMetadata = metadataReader.getClassMetadata();

    return false;
  }
}
```

### @Scope

 可以使用ConfigurableBeanFactory和WebApplicationContext接口中可用的SCOPE_*常量，来定义该 bean 的类型

*   prototype：容器创建时不会创建，每次获取重新创建一遍
*   singleton：容器创建时创建，每次获取都是同一个对象
*   request：每次请求
*   session：每次 session 
*   application：整个 web 

### @Lazy

注解于 @Bean 方法上，让其不立即装配，而是使用时进行创建

### @Conditional

指定 @Bean 注入时，需要达成条件才能注册；这些条件必须是 实现了 Condition 接口的 类

```java
public class ConditionT implements Condition {

  /**
     * @param context  判断条件能使用的上下文环境
     * @param metadata 注解信息
     * @return 条件是否成立
     */
  @Override
  public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
    // 可以获取当前的 bean 工厂
    ConfigurableListableBeanFactory beanFactory = context.getBeanFactory();
    // 可以获取类加载器
    ClassLoader classLoader = context.getClassLoader();
    // 可以获取环境信息
    Environment environment = context.getEnvironment();
    // 获取 bean 定义的注册类
    context.getRegistry();
    return false;
  }
}
```

如果此注解在类上，则代表只有满足条件，整个类中的 bean 才会被注册

### @Import

快速的注册一个组件到容器中，也可以使用多个组件，以数组的形式，注册后默认的类名则为id

```java
@Import(Object.class)
```

*   也可以传入一个重写了 ImportSelector 接口的类

```java
public class MyImportSelector implements ImportSelector {

  /**
     * @param importingClassMetadata 当前标注 @Import 注解类的所有注解信息
     * @return 全类名数组
     */
  @Override
  public String[] selectImports(AnnotationMetadata importingClassMetadata) {
    return new String[]{
      "com.truenine.spring.annotationdev.MainConfig",
      "java.lang.String",
      "java.util.ArrayList"
    };
  }
}
```

*   也可以传入一个 ImportBeanDefinitionRegistrar 接口实现类的类，手动注册 bean 到容器中

```java
public class MyImportBeanDefinitionRegistrar implements ImportBeanDefinitionRegistrar {

  /**
     * @param importingClassMetadata @Import 标记类的注解信息
     * @param registry               BeanDefinition 注册类
     */
  @Override
  public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry) {
    // 指定 bean 的名称，bean 定义信息（类型）
    registry.registerBeanDefinition("a", new RootBeanDefinition(Person.class));
  }
}
```

### 使用 BeanFacotry 注册的 Bean

实现了接口 BeanFactory 接口的 类，会被注册到容器当中，但在获取时

```java
public class FactoryBeanI implements FactoryBean<Annotation> {


  // 注册到容器当中的 value
  @Override
  public Annotation getObject() throws Exception {
    // 注册为 null
    return () -> null;
  }

  // 返回的类型
  @Override
  public Class<?> getObjectType() {
    return Annotation.class;
  }

  // 是否为单例
  @Override
  public boolean isSingleton() {
    return false;
  }
}
```

>   getBean() 就可以直接获取出来，如果在前缀加上 & ，则可以直接取出当前 FactoryBean 的原始类型
>
>   ```text
>   例如：ABeanFactory 的返回类型是 A
>   则 直接 get 返回的是：A
>   如果在最前拼接上 &，则取出的是 ABeanFactory
>   ```

## 生命周期

bean 创建 -> 初始化 -> 销毁的过程，此生命周期由容器进行管理。

由容器管理 bean 的生命周期。

bean 在经历相应生命周期的时候，会调用 bean 指定的初始化或者销毁方法方法。

### 指定 bean 的初始化和销毁方法

在 xml 中，bean 标签 可以配置 init-method 和 destroy-method。

在使用注解时，可以在 bean 注解上进行声明，调用该bean 指定的方法

这些方法必须没有任何参数，但是可以抛任何异常

```java
public class ComponentScanT {
  @Bean(initMethod = "init", destroyMethod = "close")
  public Person person() {
    return new Person();
  }
}
```

### 通过实现接口的方式进行初始化和销毁

实现 InitalizingBean 进行初始化方法

实现 DisposableBean 进行销毁方法

容器会在 对 bean 赋值好之后，回过来调用 初始化

同时在销毁之前，调用 销毁方法

```java
public class Smzq implements InitializingBean, DisposableBean {
  @Override
  public void afterPropertiesSet() throws Exception {
    // 进行初始化
  }

  @Override
  public void destroy() throws Exception {
    // 进行销毁
  }
}

```

### 使用 JSR250 注解进行初始化和销毁

1.  @PostConstruct：在初始化属性赋值完成后，调用此注解的方法
2.  @PreDestroy：在 bean 销毁前，调用此方法

```java
@Component
public class newBean {

  @PostConstruct
  public void t() {
		// 初始化方法
  }

  @PreDestroy
  public void t2() {
		// 销毁方法
  }
}
```

### 实现 BeanPostProcessor 接口

此接口会在 bean 初始化之前，立即调用before，初始化后，调用后after

```java
// 初始化前后进行处理工作
@Component
public class MyBeanPostProcessor implements BeanPostProcessor {

  /**
     * @param bean     容器刚创建好的实例
     * @param beanName 此 bean 的在容器中的名称
     * @return 后来回使用的实例对象
     */
  @Override
  public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
    // 进行包装处理
    return bean;
  }

  /**
     * @param bean     包装好后的 bean
     * @param beanName bean 在容器中的名称
     * @return 之后使用的 实例
     */
  @Override
  public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
    // 包装处理
    return bean;
  }
}
```

### 底层对 Process 的使用

bean 赋值、注入其他组件、@AutoWired、生命周期注解功能、都会用到 PostProcessor 进行处理

## 属性赋值

### @Value

*   可以直接进行赋值
*   可以使用 SpEL 表达式
*   可以使用 ${}取出配置文件（环境变量）中的值

### PropertySource

注解于配置类，用以加载一组配置文件，将配置文件中的值加载到环境变量，以便于使用 ${} 表达式取值

## 自动装配

### @Autowired

1.  默认先在容器内按照类型进行查找，找到则赋值。
2.  多个同时存在，则按照属性进行赋值
3.  如果容器中没有此组件，则会异常

>   默认一定是要赋值好的

4.  可以使用 required 属性，指定为 false 之后，则即使没有找到 bean，就留在那里不会进行装配
5.  autowired 可以注解于：属性，方法，构造器
    *   方法：spring容器创建对象就会调用方法完成赋值，方法使用的参数值从ICO容器进行获取
    *   构造器：构造器使用的参数就是就会从容器中获取

明确指定要装配的组件 id，而不是使用默认属性名称

### @Primary

注解于组件之上，自动装配时，会首选此组件进行装配

### JSR250 @Resource & JSR330 @Inject 规范注解

这两个注解是java规范注解

#### @Resource

可以和 autowarid 一样进行自动注入，默认是按照组件名称进行装配的，可以通过name属性进行指定名称

但和 autowired 相比，没有 required ，没有 Primary

#### @Inject

需要 javax.inject 包，和 autowired 功能一样

### @Profile

注入 @Bean 时，为每个环境加入环境标识，只有处于特定的环境，才会激活固定的环境，不标识则是 default 环境

注解于配置类时，只有在特定环境下，这个配置类才会生效

# AOP

因为是使用 aspectj 的原因，故不作笔记

# 事务



## @Transactional

给方法标记上此注解，标识这是一个事务方法，但需要开启事务管理功能

## @EnableTransactionManagement

开启基于注解的事务管理功能，**但容器内必须有事务控制管理器的实现类**

