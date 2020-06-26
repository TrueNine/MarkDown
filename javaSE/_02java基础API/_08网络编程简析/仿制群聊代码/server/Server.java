package Test.server;

import Test.Closes;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @author TrueNine
 * @version 1.0
 * @date 2020/5/4
 */
public class Server {

    /**
     * <h1>核心容器</h1>
     * 用于存储每个用户的 tcp 任务
     */
    public static final List<Task> TASK_LIST = new CopyOnWriteArrayList<>();

    public static void main(String[] args) throws IOException {
        System.out.println("Server.main");
        ServerSocket server = new ServerSocket(1521);

        while (true) {
            try {
                Socket socket = server.accept();
                System.out.println(socket.getLocalAddress() + " 建立连接,开始处理");

                // 将此任务添加至容器
                Task t = new Task(socket);
                TASK_LIST.add(t);

                // 执行任务
                new Thread(t).start();
                System.out.println("已经执行: " + socket.getLocalAddress() + " 任务");
            } catch (Exception e) {
                System.out.println("Server.main");
                e.printStackTrace();
                break;
            }
        }
    }
}


/**
 * 用于处理数据,单独开辟线程
 */
class Task implements Runnable {

    private DataInputStream dis;
    private DataOutputStream dos;
    private boolean isRunning;
    private String name;
    private Socket socket;

    /**
     * 用于初始化一条线程的属性
     *
     * @param client 套接字
     */
    public Task(Socket client) {
        try {
            this.dis = new DataInputStream(client.getInputStream());
            this.dos = new DataOutputStream(client.getOutputStream());
            this.isRunning = true;
            this.socket = client;
            this.name = String.valueOf(client.getLocalSocketAddress());
        } catch (IOException e) {
            System.out.println("Task.Task");
            e.printStackTrace();
        }
    }

    /**
     * 用于发送消息
     *
     * @param str 字符串
     */
    private void send(String str) {
        try {
            dos.writeUTF(str);
            Logger.print(this.socket.getInetAddress().toString(), str);
        } catch (IOException e) {
            System.out.println("Task.send");
            close();
        }
    }

    /**
     * <h1>重点</h1>
     * 群聊功能,可以选择性发送
     *
     * @param str   字符串
     * @param isAll 是否为系统消息
     */
    private void send(String str, boolean isAll) {
        // 以指定格式开头的为私聊
        boolean isPrivateNews = str.startsWith("@");
        if (isPrivateNews) {
            // 截取名称
            int subIndex = str.indexOf(':') + 1;
            String userName = str.substring(subIndex);
            // 此处不建议,复杂度为 o(n) ?
            for (Task temp : Server.TASK_LIST) {
                if (temp.name.equals(userName)) {
                    temp.send(this.name + ">>>: " + str);
                    break;
                }
            }
        } else {
            for (Task t : Server.TASK_LIST) {
                // 不对自身发送
                if (this.equals(t)) {
                    continue;
                }
                // 是系统消息
                if (isAll) {
                    t.send("系统通知: " + str);
                } else {
                    // 不是系统消息
                    t.send(this.name + " 公开说: " + str);
                }
            }
        }
    }

    /**
     * 用于接受消息
     *
     * @return 字符串
     */
    @SuppressWarnings("all")
    private String receive() {
        String str = null;
        try {
            str = dis.readUTF();
        } catch (IOException e) {
            System.out.println("Task.receive");
            close();
        }
        return str;
    }

    /**
     * 从用户读取,然后进行分发
     */
    @Override
    public void run() {
        while (isRunning) {
            String str = receive();
            // 日志
            Logger.print(socket.getInetAddress().toString(), str);
            if (!"".equals(str)) {
                send(str, false);
            }
        }
    }

    /**
     * 用于关闭资源
     */
    private void close() {
        // 从任务容器取出
        this.isRunning = false;
        Server.TASK_LIST.remove(this);
        Closes.close(dis, dos, socket);
        // 发送消息给通知
        send(this.name + "离开... ", true);
    }
}