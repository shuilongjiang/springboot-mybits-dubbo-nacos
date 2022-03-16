package com.base.Thread;

import java.util.ArrayList;

public class Test {

    public static void main(String[] args) {
        Atest atest = new Atest();
        System.out.println("1");
        try {
            atest.doIt();
        }catch (Exception e){
            System.out.println("9");
        }


        System.out.println("10");
    }
}
class Atest{
    public void doIt(){
        System.out.println("2");
        try {
            System.out.println("3");
            int i = 10/0;
            System.out.println("4");
        }catch (Exception x){
            System.out.println("5");
            throw x;
        }finally {
            System.out.println("6");
        }

    }
}
