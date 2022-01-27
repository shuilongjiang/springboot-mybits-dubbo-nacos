package com.cc.service.mydemo01;

/**
 * Description:
 *
 * @author Jiang Shuilong 2021-12-14 20:45
 * 异或运算的性质与扩展
 * 1）0^N == N N^N == 0
 * 2）异或运算满足交换律和结合率
 * 3）不用额外变量交换两个数
 * 4）一个数组中有一种数出现了奇数次，其他数都出现了偶数次，怎么找到这一个数
 * 5）一个数组中有两种数出现了奇数次，其他数都出现了偶数次，怎么找到这两个数
 **/
public class day01test {
    public static void main(String[] args) {
        int[] arr = { 1,2,3,1,2,3,5};
        int ero = arr[0];
        for(int i = 1; i < arr.length; i++){
            ero = ero ^ arr[i];
        }
        System.out.println(ero);
    }
}
