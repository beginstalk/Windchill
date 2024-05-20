package com.accenture;

public class Fibonacci {

    public static int find_n_fibonacci(int n){
        if(n==0 || n==1) return n;
        int a=0, b=1, c=0;
        for(int i=2; i<=n; i++){
           c = a+b;
           a = b;
           b = c;
        }
        return c;
    }

    public static void main(String[] args){
        int n = 5;
        int answer = find_n_fibonacci(n);
        System.out.println(n + "Fibonacci is " + answer);
    }

}