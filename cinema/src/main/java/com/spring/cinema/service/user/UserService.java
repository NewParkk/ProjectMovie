package com.spring.cinema.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.UserMapper;
import com.spring.cinema.model.User;

@Service
public class UserService {
	
	private final UserMapper userMapper;

	@Autowired
	public UserService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public User getUserByUsername(String username) {
		return userMapper.getUserByUsername(username);
	}

	public boolean insertUser(User newUser) {
		try {
			userMapper.insertUser(newUser); 
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}
}
