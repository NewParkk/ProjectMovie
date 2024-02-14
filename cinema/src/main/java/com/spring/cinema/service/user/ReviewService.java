package com.spring.cinema.service.user;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.ReviewMapper;
import com.spring.cinema.model.Review;



@Service
public class ReviewService {

	private final ReviewMapper reviewMapper;

	@Autowired
	public ReviewService(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}

	public ArrayList<Review> getreviewById(String userId) {
		return reviewMapper.getreviewById(userId);
	}
	
	
	
}
