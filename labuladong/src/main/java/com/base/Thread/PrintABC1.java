package com.base.Thread;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Description: 换种方式实现  还有单例
 * https://blog.csdn.net/u010953880/article/details/87933621
 *
 * @author Jiang Shuilong 2022-01-20 18:02
 **/
public class PrintABC1 {
    private static Lock lock = new ReentrantLock();
    private static int a = 0;

    static class Thread002 extends Thread {
        public void run() {
            for (int i = 0; i < 10; ) {
                try {
                    lock.lock();
                    while (a % 3 == 0) {
                        System.out.println("A");
                        a++;
                        i++;
                    }
                } finally {
                    lock.unlock();
                }
            }
        }
    }
    static class Thread003 extends Thread {
        public void run() {
            for (int i = 0; i < 10; ) {
                try {
                    lock.lock();
                    while (a % 3 == 2) {
                        System.out.println("B");
                        a++;
                        i++;
                    }
                } finally {
                    lock.unlock();
                }
            }
        }
    }
    static class Thread004 extends Thread {
        public void run() {
            for (int i = 0; i < 10; ) {
                try {
                    lock.lock();
                    while (a % 3 == 1) {
                        System.out.println("C");
                        a++;
                        i++;
                    }
                } finally {
                    lock.unlock();
                }
            }
        }
    }

    public static void main(String[] args) {
        new Thread002().start();
        new Thread003().start();
        new Thread004().start();
    }
}
