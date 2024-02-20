package com.spring.cinema.model;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	
	
	private int reviewId;
	
	private String content;
	
	private Timestamp createDate;

	private Timestamp modifyDate;
	
	private String  userId;
	 
	private String movieName;
	
}
