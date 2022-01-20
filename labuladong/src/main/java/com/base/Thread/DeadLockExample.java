package com.base.Thread;

/**
 * Description: 死锁实现
 *
 * @author Jiang Shuilong 2022-01-18 14:09
 **/
public class DeadLockExample {

    public static void main(String[] args) {
        Thread3301 thread01 = new Thread3301();
        Thread3301 thread02 = new Thread3301();
        Thread t1 = new Thread(thread01,"t1");
        Thread t2 = new Thread(thread01,"t2");
        t1.start();
        t2.start();
    }


}
class Thread3301 implements Runnable{
    private static  int count;
    public Thread3301() {
        count = 0;
    }

    @Override
    public  void run() {
        synchronized(this) {
            for (int i = 0; i < 5; i++) {
                try {
                    System.out.println(Thread.currentThread().getName() + ":" + (count++));
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
