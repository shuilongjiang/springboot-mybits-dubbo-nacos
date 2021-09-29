package com.base.list;

public class MyList {
    public static ListNode memory = null;
    public static void main(String[] args) {
        ListNode p = new ListNode(1);
        ListNode p1 = new ListNode(2,p);
        ListNode p2 = new ListNode(3,p1);
        ListNode p3 = new ListNode(4,p2);
        ListNode p4 = new ListNode(5,p3);
        ListNode p5 = new ListNode(6,p4);
        ListNode p6 = new ListNode(7,p5);
       show(reverseList(p6,4,6));

    }
    public static ListNode reverseList(ListNode head,int m,int n){
        if (m == 1){
            return reverseList(head,n);
        }
        head.next  = reverseList(head.next,m-1,n-1);
        return head;
    }



    public static ListNode reverseList(ListNode head,int n){
        if (n == 1){
            memory = head.next;
            return head;
        }
        ListNode p = reverseList(head.next,n-1);
        head.next.next = head;
        head.next = memory;
        return p;
    }

    public static ListNode reverseList(ListNode head){
        if (head.next == null){
            return head;
        }
        ListNode p = reverseList(head.next);
        head.next.next = head;
        head.next = null;
        return p;

    }

    public static void show(ListNode p){
        System.out.println(p.val);
        if(p.next != null){
            show(p.next);
        }else {
            return;
        }
    }
}

class ListNode {
    int val;
    ListNode next;

    ListNode() {
    }

    ListNode(int val) {
        this.val = val;
    }

    ListNode(int val, ListNode next) {
        this.val = val;
        this.next = next;
    }
}
