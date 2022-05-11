package com.findaroom.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findaroom.app.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer>{

	public User findByUsername(String username);
}
