package com.spring.cinema.service.user;

import com.spring.cinema.model.User;

public interface UserService {
	
	User getUserByuserId(String userId);
	
	boolean insertUser(User newUser);
	
	boolean updateUserById(User user);
	
	boolean userDelete(String userId);
	
	User userIdByNameBirthEmail(String userName, Integer userBirth, String userEmail);
	
}
