package com.spring.cinema.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Movie {
	private int movieId;
	private String movieName;
	private String movieStory;
	private String movieDate;
	private String movieImgUrl;
	private String directorName;

}
