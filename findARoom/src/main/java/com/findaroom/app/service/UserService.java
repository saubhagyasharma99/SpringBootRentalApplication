package com.findaroom.app.service;

import java.util.List;

import com.findaroom.app.model.User;

public interface UserService {

	User saveUser(User user);
	
	List<User> getAllUsers();
	
	User getUserById(int id);
	
	User getUserByUsername(String username);
	
	User updateUser(User user);
	
	boolean deleteUser(int id);
	
	boolean batchDelete(List<Integer> ids);
	
}
