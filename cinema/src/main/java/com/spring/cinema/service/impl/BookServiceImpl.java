package com.spring.cinema.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.BookMapper;
import com.spring.cinema.model.Book;
import com.spring.cinema.service.user.BookService;

@Service
public class BookServiceImpl implements BookService{
	

	private final BookMapper bookMapper;

	@Autowired
	public BookServiceImpl(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}
	
	
	public ArrayList<Book> getBookByuserId(String userId) {
		return bookMapper.getBookByuserId(userId);
	}
}