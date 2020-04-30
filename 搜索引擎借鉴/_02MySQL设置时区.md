# 设置时区

>   如果时区和系统不对成,则连接不上
>
>   ```sql
>   -- 设置全局时区为 + 8
>   SET GLOBAL time_zone = '+8:00';
>   -- 设置当前会话时间为 + 8
>   SET time_zone = '+8:00';
>   ```

## 在 my.ini 设置默认时区

```ini
# 设置默认时区为 +8 区
default-time-zone='+08:00'
```

