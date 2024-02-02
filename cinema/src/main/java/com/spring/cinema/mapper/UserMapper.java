package com.spring.cinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.User;

@Mapper
public interface UserMapper {

	User getUserByuserId(@Param("userId") String userId);

	int insertUser(User newUser);

	int updateUser(User user);

	void userDelete(@Param("userId") String userId);

}
