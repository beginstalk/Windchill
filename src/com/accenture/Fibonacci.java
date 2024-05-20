package com.accenture;
import java.util.logging.Logger;

public class Fibonacci {

    Logger logger = Logger.getLogger(getClass().getName());

    public void findFibonacci(int n){
        if(n==0 || n==1){
             logger.info(n + " Fibonacci is " + n);
             return;
        }
        int a=0;
        int b=1;
        int c=0;
        for(int i=2; i<=n; i++){
           c = a+b;
           a = b;
           b = c;
        }
        logger.info(n + " Fibonacci is " + c);
    }

    public static void main(String[] args){
        
        Fibonacci fib = new Fibonacci();
        int n = 5;
        fib.findFibonacci(n);
    }

}