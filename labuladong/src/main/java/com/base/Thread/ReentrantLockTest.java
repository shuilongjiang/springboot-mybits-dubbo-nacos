package com.base.Thread;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Description: ReentrantLock的mode
 *
 * @author Jiang Shuilong 2022-01-18 17:42
 **/
public class ReentrantLockTest {
    Lock lock = new ReentrantLock();

    public void method(Thread thread) {

        lock.lock();
        try {
            System.out.println("线程名" + thread.getName() + "获得了锁");
            Thread.sleep(1000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("线程名" + thread.getName() + "释放了锁");
            lock.unlock();
        }
    }

    public static void main(String[] args) {
        ReentrantLockTest reentrantLockTest = new ReentrantLockTest();
        Thread thread01 = new Thread(new Runnable() {
            @Override
            public void run() {
                reentrantLockTest.method(Thread.currentThread());
            }
        }, "t1");
        Thread thread02 = new Thread(new Runnable() {
            @Override
            public void run() {
                reentrantLockTest.method(Thread.currentThread());
            }
        }, "t2");

        thread01.start();
        thread02.start();

    }

}
