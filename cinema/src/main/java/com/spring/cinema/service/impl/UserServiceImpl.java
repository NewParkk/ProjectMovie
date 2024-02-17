package com.spring.cinema.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.UserMapper;
import com.spring.cinema.model.User;
import com.spring.cinema.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	private final UserMapper userMapper;

	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User getUserByuserId(String userId) {

		return userMapper.getUserByuserId(userId);
	}

	@Override
	public boolean insertUser(User newUser) {
		try {
			userMapper.insertUser(newUser); 
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}
	

	@Override
	public boolean updateUserById(User user) {
		try {
			userMapper.updateUser(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	@Override
	public boolean userDelete(String userId) {
		try {
			userMapper.userDelete(userId);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	@Override
	public User userIdByNameBirthEmail(String userName, Integer userBirth, String userEmail) {
		return userMapper.userIdByNameBirthEmail(userName,userBirth,userEmail);
	}



}
