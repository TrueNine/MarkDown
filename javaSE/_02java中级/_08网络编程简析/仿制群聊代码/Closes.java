package Test;

import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.net.Socket;

/**
 * 只是用于关闭资源
 *
 * @author TrueNine
 * @version 1.0
 * @date 2020/5/4
 */
public class Closes {
    public static void close(Closeable... c) {
        for (Closeable temp : c) {
            try {
                if (temp != null) {
                    temp.close();
                }
            } catch (IOException e) {
                System.out.println("Closeable.close");
                e.printStackTrace();
            }
        }
    }
}
