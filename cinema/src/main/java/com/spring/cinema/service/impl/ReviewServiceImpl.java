package com.spring.cinema.service.impl;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.ReviewMapper;
import com.spring.cinema.model.Review;
import com.spring.cinema.service.user.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	private final ReviewMapper reviewMapper;

	@Autowired
	public ReviewServiceImpl(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}

	public ArrayList<Review> getreviewById(String userId) {
		return reviewMapper.getreviewById(userId);
	}

	public boolean insertReview(Review review) {
		try {
			reviewMapper.insertReview(review);
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public ArrayList<Review> getReviewList(String movieName) {
		
		return reviewMapper.getReviewList(movieName);
	}

	public boolean deleteReview(Integer reviewId) {
		try {
		  reviewMapper.deleteReview(reviewId);
		return true; 
	} catch (Exception e) {
		e.printStackTrace();
		return false; 
	}
	}

	public boolean updateReview(Review review) {
		try {
		reviewMapper.updateReview(review);
		return true; 
	} catch (Exception e) {
		e.printStackTrace();
		return false; 
	}
	
	}
}