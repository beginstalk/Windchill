package com.accenture;
import java.util.logging.Logger;
import java.util.logging.Level; 

public class Fibonacci {

    Logger logger = Logger.getLogger(getClass().getName());

    public int findFibonacci(int n){
        if(n==0 || n==1){
            logger.log(Level.INFO, "{0} Fibonacci number is {1}",new Object[] {n,n});
             return n;
        }
        int a=0;
        int b=1;
        int c=0;
        for(int i=2; i<=n; i++){
           c = a+b;
           a = b;
           b = c;
        }
        logger.log(Level.INFO, "{0} Fibonacci number is {1}",new Object[] {n,c});
        return c;
    }

    public static void main(String[] args){
        
        Fibonacci fib = new Fibonacci();
        int n = 6;
        fib.findFibonacci(n);
    }

}
