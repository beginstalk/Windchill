package com.accenture;
import org.junit.Test; 
import static org.junit.Assert.*; 

public class HelloTest {  
	
	String expectedMsg = "Hello Windchill";
	@Test 
	public void testMessage()
	{
		System.out. println("Inside testMessage()");
		Hello obj = new Hello();
		String actualMsg = obj.printMessage();
		assertEquals(expectedMsg,actualMsg);
	}
}  
