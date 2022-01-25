package com.base.Thread;

/**
 * Description: 单例模式
 *
 * @author Jiang Shuilong 2022-01-21 10:09
 **/
public class Singleton {
    public static void main(String[] args) {
        //饿汉模式====线程不安全

        Thread thread01 = new Thread(new Runnable() {
            @Override
            public void run() {
                SingletonA singletonE = SingletonA.getSingletonA();
                System.out.println(singletonE);
            }
        });
        Thread thread02 = new Thread(new Runnable() {
            @Override
            public void run() {
                SingletonA singletonE = SingletonA.getSingletonA();
                System.out.println(singletonE);
            }
        });
        thread01.start();
        thread02.start();
        //懒汉模式====线程不安全
        Thread thread03 = new Thread(new Runnable() {
            @Override
            public void run() {
                SingletonB singletonB = SingletonB.getSingletonB();
                System.out.println(singletonB);
            }
        });
        Thread thread04 = new Thread(new Runnable() {
            @Override
            public void run() {
                SingletonB singletonB = SingletonB.getSingletonB();
                System.out.println(singletonB);
            }
        });
        thread03.start();
        thread04.start();

    }
}

//饿汉模式====线程不安全
class SingletonA {
    private static SingletonA singletonA = new SingletonA();

    private SingletonA() {
    }

    public static SingletonA getSingletonA() {
        return singletonA;
    }

    public void Message() {
        System.out.println("Hello SingletonA!!");
    }
}

//懒汉模式====线程不安全
class SingletonB {
    private static SingletonB singletonB;

    private SingletonB() {
    }

    public static SingletonB getSingletonB() {
        if (null == singletonB) {
            singletonB = new SingletonB();
        }
        return singletonB;
    }

    public void Message() {
        System.out.println("Hello SingletonB!!");
    }
}

//懒汉模式====线程不安全
class SingletonBSafe01 {
    private static SingletonBSafe01 singletonBSafe01;

    private SingletonBSafe01() {
    }

    public static synchronized SingletonBSafe01 getSingletonBSafe01() {
        if (null == singletonBSafe01) {
            singletonBSafe01 = new SingletonBSafe01();
        }
        return singletonBSafe01;
    }

    public void Message() {
        System.out.println("Hello SingletonBSafe01!!");
    }
}

//懒汉模式====线程不安全
class SingletonBSafe02 {
    private static SingletonBSafe02 singletonBSafe02;

    private SingletonBSafe02() {
    }

    public static SingletonBSafe02 getSingletonBSafe02() {
        if (null == singletonBSafe02) {
            synchronized (SingletonBSafe02.class) {
                singletonBSafe02 = new SingletonBSafe02();
            }
        }
        return singletonBSafe02;
    }

    public void Message() {
        System.out.println("Hello singletonBSafe02!!");
    }
}
