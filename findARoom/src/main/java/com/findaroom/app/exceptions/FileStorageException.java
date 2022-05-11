package com.findaroom.app.exceptions;




public class FileStorageException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7624533336131734135L;
	
	private String msg;

    public FileStorageException(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }
	

}
