package com.spring.cinema.model;


import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MovieInfo {
	private int movieInfoId;
	private int theaterId;
	private String movieInfoDate;
	private String movieInfoTime;
	private int movieId;
	private String userId;
	 
	
	
}
