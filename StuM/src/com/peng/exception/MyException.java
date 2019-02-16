package com.peng.exception;

import java.io.Serializable;

public class MyException extends Exception implements Serializable {
	public MyException(String exception) {
		// TODO Auto-generated constructor stub
		this.exception = exception;
	}

	private String exception;

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	
}
