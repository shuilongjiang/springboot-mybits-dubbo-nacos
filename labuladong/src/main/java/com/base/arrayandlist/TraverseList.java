package com.base.arrayandlist;

import java.util.LinkedList;

/*
* 链表的遍历
* */
public class TraverseList {


    public static void main(String[] args) {
        ListNode listNode = new ListNode();
        ListNode listNode1 = new ListNode();
        ListNode listNode2 = new ListNode();

        listNode.val = 1;
        listNode1.val = 2;
        listNode2.val = 3;

        listNode.next=listNode1;
        listNode1.next=listNode2;

        System.out.println("递归遍历");
        traverseOne(listNode);

        System.out.println("非递归遍历");
        traverse(listNode);
    }

    //非递归遍历
    public static void traverse(ListNode listNode){
       for(ListNode p = listNode; p != null; p = p.next){
           System.out.println(p.val);
       }
    }

    //递归遍历
    public static void traverseOne(ListNode p){
        if (p != null){
            System.out.println(p.val);
            traverseOne(p.next);
        }else {
        return;
        }
    }

}
class ListNode {
    public int val;
    public ListNode next;
}
