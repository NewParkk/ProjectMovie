package com.spring.cinema.model;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Review {
	
	private int reviewId;
	private String content;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private String userId;
	private int movieId;
	
	@Builder
	public Review(int reviewId, String content, Timestamp createDate, Timestamp modifyDate, String userId,
			int movieId) {
		this.reviewId = reviewId;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.userId = userId;
		this.movieId = movieId;
	}
	
}
