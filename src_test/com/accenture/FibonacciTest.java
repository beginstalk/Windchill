package com.accenture;

import org.junit.Assert;
import org.junit.Test;

public class FibonacciTest {
    
    @Test
    public void find5thFibonacci(){
        Fibonacci fibonacci = new Fibonacci();
        int value = fibonacci.findFibonacci(5);
        Assert.assertEquals(5,value);
    }
}
