package com.spring.cinema.service.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.UserMapper;
import com.spring.cinema.model.Book;
import com.spring.cinema.model.User;
import com.spring.cinema.service.impl.UserServiceImpl;

@Service
public class UserService implements UserServiceImpl{
	
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


	public User userIdByNameBirthEmail(String userName, Integer userBirth, String userEmail) {
		
		return userMapper.userIdByNameBirthEmail(userName,userBirth,userEmail);
	}





}
