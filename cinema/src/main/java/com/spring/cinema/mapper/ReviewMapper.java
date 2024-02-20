package com.spring.cinema.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.Review;

@Mapper
public interface ReviewMapper {

	ArrayList<Review> getreviewById(@Param("userId")String userId);

	int insertReview(Review review);

	ArrayList<Review> getReviewList(@Param("movieName")String movieName);

	int deleteReview(@Param("reviewId")Integer reviewId);

	int updateReview(Review review);

}
