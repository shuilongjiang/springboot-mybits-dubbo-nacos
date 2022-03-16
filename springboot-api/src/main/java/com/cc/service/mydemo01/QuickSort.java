package com.cc.service.mydemo01;

import java.util.Arrays;

/**
 * Description: 排序大全
 *
 * @author Jiang Shuilong 2021-12-13 16:47
 **/
public class QuickSort {
    public static void main(String[] args) {
        int testTime = 500000;
        int maxSize = 100;
        int maxValue = 100;
        boolean succeed = true;
        for (int i = 0; i < testTime; i++) {
            int[] arr1 = generateRandomArray(maxSize, maxValue);
            int[] arr2 = copyArray(arr1);
            sort006(arr1);
            comparator(arr2);
            if (!isEqual(arr1, arr2)) {
                succeed = false;
                printArray(arr1);
                printArray(arr2);
                break;
            }
        }
        System.out.println(succeed ? "Nice!" : "Fucking fucked!");
        int[] arr = generateRandomArray(maxSize, maxValue);
        printArray(arr);
        sort006(arr);
        printArray(arr);
    }

    /*
     *快排
     */
    public static void sort00601(int[] arr) {
        if (arr == null || arr.length < 2) {
            return;
        }
        doSort00601(arr, 0, arr.length - 1);
    }

    public static void doSort00601(int[] arr, int left, int right) {
        if (left >= right) {
            return;
        }
        int m = arr[right];
        int l = left - 1;
        int r = right;
        for (int i = left; i < r; i++) {
            if (arr[i] > m) {
                swap(arr, --r, i--);
            } else if (arr[i] == m) {

            } else {
                swap(arr, ++l, i);
            }
        }
        swap(arr, right, r);
        doSort00601(arr, r + 1, right);
        doSort00601(arr, left, l);
    }
    /*
     *堆
     */
    public static void sort007(int[] arr) {
        if (null == arr || arr.length < 2) {
            return;
        }
        for (int i = 0; i < arr.length; i++) {
            insertHeap(arr, i);
        }
        int size = arr.length;
        swap(arr, 0, --size);
        while (size > 0) {
            doSort007(arr, 0, size);
            swap(arr, 0, --size);
        }
    }

    public static void doSort007(int[] arr, int index, int size) {
        int left = 2 * index + 1;
        while (left < size) {
            int max = left+1 < size && arr[left+1] > arr[left]  ? left+1 : left;
            max = arr[index] > arr[max] ? index : max;
            if(max == index){return;}
            swap(arr,index,max);
            index = max;
            left = 2 * index + 1;
        }
    }

    public static void insertHeap(int[] arr, int i) {
        while (arr[i] > arr[(i - 1) / 2]) {
            swap(arr, i, (i - 1) / 2);
            i = (i - 1) / 2;
        }
    }

    /*
     *桶
     */
    public static void sort006(int[] arr) {
        if(null == arr || arr.length < 2){
            return;
        }
        int tong = 10;
        int maxLen = maxLen(arr);
        int[] count = new int[10];
        int left = 0;
        int right = arr.length - 1;
        int[] bue = new int[arr.length];
        for(int i = 1; i <= maxLen; i++){
            for(int k = 0; k <= right; k++){
                int num = maxLen(arr[k], i);
                count[num]++;
            }
            for(int k = 1; k < count.length; k++){
                count[k] = count[k] + count[k - 1];
            }
            for(int k = right; k >= 0; k--){
                int num = maxLen(arr[k], i);
                bue[count[num] - 1] = arr[k];
                count[num]--;
            }
            for(int k = 0; k <= right; k++){
                arr[k]=bue[k];
            }
        }
    }
    /*
     *获取数字第几位的的数字是多少
     */
    public static int maxLen(int num, int n){
        /*while(n>1){
            num = num / 10;
            n--;
        }
        return num % 10;*/

        return ((num / ((int) Math.pow(10, n - 1))) % 10);
    }
    /*
    *获取最大位数
    */
    public static int maxLen(int[] arr){
        int max = arr[0];
         for(int x : arr){
            if(x > max){
                max = x;
            }
        }
         int maxLen = 0;
         while(max != 0){
             max = max / 10;
             maxLen++;
         }
         return maxLen;
    }

    /*
     *归并
     */
    public static void sort005(int[] arr) {
        if (arr == null || arr.length < 2) {
            return;
        }
        mergeSort(arr, 0, arr.length - 1);
    }

    public static void mergeSort(int[] arr, int l, int r) {
        if (l == r) {
            return;
        }
        int mid = l + ((r - l) >> 1);
        mergeSort(arr, l, mid);
        mergeSort(arr, mid + 1, r);
        doMerge(arr, l, mid, r);
    }

    public static void doMerge(int[] arr, int l, int mid, int r) {
        int[] help = new int[r - l + 1];
        int left = l;
        int right = mid + 1;
        int i = 0;
        while (left <= mid && right <= r) {
            help[i++] = arr[left] < arr[right] ? arr[left++] : arr[right++];
        }
        while (left <= mid) {
            help[i++] = arr[left++];
        }
        while (right <= r) {
            help[i++] = arr[right++];
        }
        i = 0;
        for (int k = l; k <= r; k++) {
            arr[k] = help[i++];
        }
    }

    /*
     *插入001
     */
    public static void sort004(int[] arr) {
        for (int i = 1; i < arr.length; i++) {
            for (int j = i; j > 0 && arr[j] < arr[j - 1]; j--) {
              /*  if (arr[j] > arr[j - 1]) {
                    break;
                } else {
                    swap(arr, j, j - 1);
                }*/
                swap(arr, j, j - 1);
            }
        }
    }

    /*
     *选择001
     */
    public static void sort003(int[] arr) {
        for (int i = 0; i < arr.length - 1; i++) {
            int flag = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[flag] > arr[j]) {
                    flag = j;
                }
            }
            if (i != flag) {
                swap(arr, flag, i);
            }
        }
    }

    /*
     *冒泡001
     */
    public static void sort002(int[] arr) {
        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = 0; j < arr.length - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    swap(arr, j, j + 1);
                }
            }
        }
    }

    /*
     *交换数组的两个元素(根据下标)
     */
    public static void swap(int[] arr, int i, int j) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }

    //==================================================
    // for test
    public static void comparator(int[] arr) {
        Arrays.sort(arr);
    }

    // for test
    public static int[] generateRandomArray(int maxSize, int maxValue) {
        int[] arr = new int[(int) ((maxSize + 1) * Math.random())];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = (int) ((maxValue + 1) * Math.random()) - (int) (maxValue * Math.random());
        }
        return arr;
    }

    // for test
    public static int[] copyArray(int[] arr) {
        if (arr == null) {
            return null;
        }
        int[] res = new int[arr.length];
        for (int i = 0; i < arr.length; i++) {
            res[i] = arr[i];
        }
        return res;
    }

    // for test
    public static boolean isEqual(int[] arr1, int[] arr2) {
        if ((arr1 == null && arr2 != null) ||
                (arr1 != null && arr2 == null)) {
            return false;
        }
        if (arr1 == null && arr2 == null) {
            return true;
        }
        if (arr1.length != arr2.length) {
            return false;
        }
        for (int i = 0; i < arr1.length; i++) {
            if (arr1[i] != arr2[i]) {
                return false;
            }
        }
        return true;
    }

    // for test
    public static void printArray(int[] arr) {
        if (arr == null) {
            return;
        }
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + ",");
        }
        System.out.println();
    }


}
