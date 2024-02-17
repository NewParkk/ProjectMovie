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
	private String movieDate;
	private String directorName;
	private String movieImgUrl;
	
	@Builder
	public Movie(int movieId, String movieName, String movieStory, String movieDate, String directorName,
			String movieImgUrl) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieStory = movieStory;
		this.movieDate = movieDate;
		this.directorName = directorName;
		this.movieImgUrl = movieImgUrl;
	}
	


}