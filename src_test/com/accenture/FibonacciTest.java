package com.accenture;

import org.junit.Assert;
import org.junit.Test;
import com.accenture.Fibonacci;
public class FibonacciTest {
    
    @Test
    public void find5thFibonacci(){
        Fibonacci fibonacci = new Fibonacci();
        int value = fibonacci.findFibonacci(5);
        Assert.assertEquals(5,value);
    }

    @Test
    public void find0thFibonacci(){
        Fibonacci fibonacci = new Fibonacci();
        int value = fibonacci.findFibonacci(0);
        Assert.assertEquals(0,value);
    }
}
