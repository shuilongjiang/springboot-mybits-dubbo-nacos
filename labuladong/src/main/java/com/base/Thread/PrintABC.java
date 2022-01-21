package com.base.Thread;

/**
 * Description: 三个线程轮流打印ABC  还有单例模式
 * https://blog.csdn.net/hefenglian/article/details/82596072
 *
 * @author Jiang Shuilong 2022-01-18 15:50
 **/
public class PrintABC {

    public static void main(String[] args) {
        Object a = new Object();
        Object b = new Object();
        Object c = new Object();
        ThreadPrint tp1 = new ThreadPrint("A", b, c);
        ThreadPrint tp2 = new ThreadPrint("B", c, a);
        ThreadPrint tp3 = new ThreadPrint("C", a, b);
        Thread t1 = new Thread(tp1);
        Thread t2 = new Thread(tp2);
        Thread t3 = new Thread(tp3);
        t1.start();
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        t2.start();
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        t3.start();
    }

}

class ThreadPrint implements Runnable {
    private String name;
    private Object pre;
    private Object sur;

    public ThreadPrint(String name, Object pre, Object sur) {
        this.name = name;
        this.pre = pre;
        this.sur = sur;
    }

    @Override
    public void run() {
        int count = 10;
        while (count > 0) {
            synchronized (pre) {
                synchronized (sur) {
                    System.out.println(name);
                    count--;
                    sur.notifyAll();
                }
                if (count > 0) {
                    try {
                        pre.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                } else {
                    pre.notifyAll();
                }

            }
        }
    }
}
