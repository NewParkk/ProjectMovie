package com.spring.cinema.service.user;

import com.spring.cinema.mapper.UserMapper;
import com.spring.cinema.model.User;

public interface UserService {
	User getUserByUsername(String username);
		
	boolean insertUser(User newUser);

}
