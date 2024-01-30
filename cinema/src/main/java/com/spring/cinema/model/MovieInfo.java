package com.spring.cinema.model;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MovieInfo {
	private int movieInfoId;
	private int theaterId;
	private Date movieInfoDate;
	private Date movieInfoTime;
	
	@Builder
	public MovieInfo(int movieInfoId, int theaterId, Date movieInfoDate, Date movieInfoTime) {
		this.movieInfoId = movieInfoId;
		this.theaterId = theaterId;
		this.movieInfoDate = movieInfoDate;
		this.movieInfoTime = movieInfoTime;
	}
	
	
}
