package com.spring.cinema.mapper;



import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.Book;

@Mapper
public interface BookMapper {

	
	ArrayList<Book> getBookByuserId(@Param(value = "userId")String userId);
}
