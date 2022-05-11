package com.findaroom.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findaroom.app.dao.UserDao;
import com.findaroom.app.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	

	@Override
	public User saveUser(User user) {
		// TODO Auto-generated method stub
		return userDao.save(user);
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

	@Override
	public User getUserById(int id) {
		
		return userDao.findById(id).orElse(new User());
	}

	@Override
	public User getUserByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public User updateUser(User user) {
		return userDao.save(user);
	}

	@Override
	public boolean deleteUser(int id) {
		try {
		userDao.deleteById(id);
		return true;
		}catch(Exception ex) {
			// log the exception using any logging framework
		}
		return false;
	}

	@Override
	public boolean batchDelete(List<Integer> ids) {
		// TODO Auto-generated method stub
		return false;
	}

}
