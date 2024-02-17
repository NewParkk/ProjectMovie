package com.spring.cinema.service.user;

import java.util.ArrayList;

import com.spring.cinema.model.Book;

public interface BookService {

	ArrayList<Book> getBookByuserId(String userId);
}
