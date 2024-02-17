package com.spring.cinema.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.User;

@Mapper
public interface UserMapper {

	User getUserByuserId(@Param("userId") String userId);

	int insertUser(User newUser);

	int updateUser(User user);

	void userDelete(@Param("userId") String userId);

	User userIdByNameBirthEmail(@Param(value = "userName")String userName,  
			   					@Param(value ="userBirth")Integer userBirth, 
			   					@Param(value ="userEmail")String userEmail);

}
