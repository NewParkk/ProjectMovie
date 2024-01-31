package com.spring.cinema.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.User;

@Mapper
public interface UserMapper {

	User getUserByuserId(@Param("userId") String userId);

	void insertUser(User newUser);
}
