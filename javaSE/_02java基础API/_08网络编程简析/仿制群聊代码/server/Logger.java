package Test.server;

import java.util.Date;

/**
 * 用于在服务器打印日志
 *
 * @author TrueNine
 * @version 1.0
 * @date 2020/5/5
 */
public class Logger {

    public static void print(String description, String content) {
        System.out.println("time: " + new Date(System.currentTimeMillis()) + "Server: " + description + ": news: " + content);
    }
}
