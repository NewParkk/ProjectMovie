package com.spring.cinema.model;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Movie {
	private int movieId;
	private String movieName;
	private String movieStory;
	private Date movieDate;
	
	@Builder
	public Movie(int movieId, String movieName, String movieStory, Date movieDate, int theaterId) {
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieStory = movieStory;
		this.movieDate = movieDate;
	}
	
	
}
