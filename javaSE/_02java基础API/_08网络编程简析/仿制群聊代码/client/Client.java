package Test.client;

import java.io.*;
import java.net.Socket;

import Test.Closes;

/**
 * @author TrueNine
 * @version 1.0
 * @date 2020/5/4
 */
public class Client {
    /**
     * 测试方法,可以直接删除
     * 从别的方法取值
     * 或者将此方法改为 main
     */
    public static void main(String[] args) {
        System.out.println("Client.Main");

        try {
            Socket socket = new Socket("localhost", 1521);

            // 建立线程
            new Thread(new Send(socket, String.valueOf(socket.getLocalSocketAddress()))).start();
            new Thread(new Receive(socket)).start();
        } catch (IOException e) {
            System.out.println("服务器关闭................");
        }
    }
}

/**
 * 用于发送消息的线程类
 */
class Receive implements Runnable {
    private DataInputStream dis;
    private Socket socket;
    private boolean isRunning;

    public Receive(Socket socket) {
        this.socket = socket;
        this.isRunning = true;
        try {
            this.dis = new DataInputStream(socket.getInputStream());
        } catch (IOException e) {
            System.out.println("Receive.Receive");
            close();
        }
    }

    /**
     * 用于从服务器接收消息
     *
     * @return 字符串
     */
    private String receive() {
        String str = null;
        try {
            str = dis.readUTF();
        } catch (IOException e) {
            System.out.println("Receive.receive");
            close();
        }
        return null == str ? "" : str;
    }

    /**
     * <h1>重点,从此处取值渲染在 listView</h1>
     */
    @Override
    public void run() {
        while (isRunning) {
            String str = receive();
            if (!"".equals(str)) {
                System.out.println("向服务器发送: " + str);
                // 从此处取值
            }
        }
    }

    /**
     * 用于关闭资源
     */
    private void close() {
        this.isRunning = false;
        Closes.close(dis, socket);
    }
}

class Send implements Runnable {

    private BufferedReader br;
    private DataOutputStream dos;
    private Socket socket;
    private boolean isRunning;
    private String name;

    /**
     * 初始化
     *
     * @param client 套接字
     * @param name   名称
     */
    public Send(Socket client, String name) {
        this.socket = client;

        // 此处改为 listView,现在是控制台
        br = new BufferedReader(new InputStreamReader(System.in));

        this.isRunning = true;
        this.name = name;
        try {
            dos = new DataOutputStream(client.getOutputStream());
        } catch (IOException e) {
            System.out.println("Send.Send");
            close();
        }
    }

    @Override
    public void run() {
        while (isRunning) {
            String str = getStrFromConsole();
            if (!str.equals("")) {
                send(str);
            }
        }
    }

    /**
     * 向外发送字符串
     *
     * @param str 字符串
     */
    private void send(String str) {
        try {
            dos.writeUTF(str);
        } catch (IOException e) {
            System.out.println("Send.send");
            e.printStackTrace();
            close();
        }
    }

    /**
     * 从控制台获取消息
     * <h1>此方法改为从 图形界面获取值</h1>
     *
     * @return 字符串
     */
    private String getStrFromConsole() {
        try {
            return br.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 释放资源
     */
    private void close() {
        this.isRunning = false;
        Closes.close(dos, socket);
    }
}