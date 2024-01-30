package com.spring.cinema.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.UserMapper;
import com.spring.cinema.model.User;
import com.spring.cinema.service.user.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {
	
	private UserMapper userMapper;
	
	@Autowired
	public void UserService(UserMapper userMapper) {
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







