package com.cc.service.mydemo01;

/**
 * Description:
 * 1）在一个有序数组中，找某个数是否存在
 * 2）在一个有序数组中，找>=某个数最左侧的位置
 * 3）局部最小值问题
 *
 * @author Jiang Shuilong 2021-12-14 20:54
 **/
public class day03test {
    public static void main(String[] args) {
        int[] arr = {1, 4, 6, 14, 56, 234, 12345};
        bSESort(arr, 19);
    }

    /*
    1）在一个有序数组中，找某个数是否存在/
    */
    public static void bSESort(int[] arr, int flag) {
        int left = 0, right = arr.length;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (arr[mid] < flag) {
                left = mid + 1;
            } else if (arr[mid] > flag) {
                right = mid - 1;
            } else {
                System.out.println("存在");
                return;
            }
        }
        System.out.println("NO存在");
    }
}
