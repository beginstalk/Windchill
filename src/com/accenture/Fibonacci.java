package com.accenture;
import java.util.logging.Logger;

public class Fibonacci {

    Logger logger = Logger.getLogger(getClass().getName());

    public static int findFibonacci(int n){
        if(n==0 || n==1) return n;
        int a=0;
        int b=1;
        int c=0;
        for(int i=2; i<=n; i++){
           c = a+b;
           a = b;
           b = c;
        }
        return c;
    }

    public static void main(String[] args){
        int n = 5;
        int answer = findFibonacci(n);
        logger.info(n + "Fibonacci is " + answer);
    }

}