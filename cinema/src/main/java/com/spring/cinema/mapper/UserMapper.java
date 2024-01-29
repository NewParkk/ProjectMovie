package com.spring.cinema.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.User;

@Mapper
public interface UserMapper {

	User getUserByUsername(@Param("username") String username);

	void insertUser(User newUser);
}
