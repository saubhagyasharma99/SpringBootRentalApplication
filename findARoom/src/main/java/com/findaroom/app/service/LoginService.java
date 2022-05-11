package com.findaroom.app.service;

public interface LoginService {

	String findLoggedInUsername();

	void autoLogin(String username, String password);

}
