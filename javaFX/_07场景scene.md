# Scene

>   *   大部分组件的父类是 node,少部分是 Object 或其他
>   *   所有的 node 必须放在 场景 scene 上,scene 放置于 stage
>
>   ```mermaid
>   graph RL
>   node --> scene --> stage
>   ```
>
>   *   在根节点上的 Node,会被约束大小,为Stage大小,一般放置布局类