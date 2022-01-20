package com.base.Thread;

import java.util.concurrent.*;

/**
 * Description: 实现线程的第一个方法
 *
 * @author Jiang Shuilong 2022-01-18 14:17
 **/
public class method01 {
    public static void main(String[] args) {
        Thread t1 = new Thread(new Thread01());
        t1.start();
        Thread02 t2 =new Thread02();
        t2.start();
        Thread03 thread03 = new Thread03();
        FutureTask futureTask = new FutureTask(thread03);
        Thread t3 = new Thread(futureTask);
        t3.start();
        //线程池 https://www.cnblogs.com/pcheng/p/13540619.html
        ExecutorService executorService = new ThreadPoolExecutor(2, 10,
                                1, TimeUnit.MINUTES, new ArrayBlockingQueue<>(5, true),
                                Executors.defaultThreadFactory(), new ThreadPoolExecutor.AbortPolicy());
        executorService.execute(()->{
            System.out.println("线程池");
        });
    }
}

class Thread01 implements Runnable {
    @Override
    public void run() {
        System.out.println("tread01");
    }}

    class Thread02 extends Thread {
        public void run() {
            System.out.println("thread02");
        }
    }
   class Thread03 implements Callable {

       @Override
       public Object call() throws Exception {
           System.out.println("thread03");
           return null;
       }
   }

