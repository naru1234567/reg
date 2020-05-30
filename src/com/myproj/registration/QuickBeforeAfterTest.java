package com.myproj.registration;



import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class QuickBeforeAfterTest {

	@Before
	public void test1() {
		System.out.println("Before executed");
	}
	
	@Test
	public void test3() {
		System.out.println("Test1 executed");
	}
	
	@After
	public void test2() {
		System.out.println("After executed");
	}

}
