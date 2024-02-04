package com.spring.cinema.service.user;


import java.util.List;

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

	
	
	public User getUserByuserId(String userId) {
	
		return userMapper.getUserByuserId(userId);
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



	public boolean updateUserById(User user) {
		try {
			userMapper.updateUser(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}



	public boolean userDelete(String userId) {
		try {
			userMapper.userDelete(userId);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}



	public List<User> getUserIdByNameAndBirth(String userName) {
		System.out.println(userName);
		return userMapper.getUserIdByNameAndBirth(userName);
	}


}
