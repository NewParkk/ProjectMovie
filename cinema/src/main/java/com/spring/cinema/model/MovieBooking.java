package com.spring.cinema.model;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MovieBooking {
	
	private int movieBookingId; 
	private int userId; 
	private int movieId;
	private int theaterId;
	private int movieInfoId; 
	private Date movieInfoDate;
	private Date movieInfotime;
	
	@Builder
	public MovieBooking(int movieBookingId, int userId, int movieId, int theaterId, int movieInfoId, Date movieInfoDate,
			Date movieInfotime) {
		this.movieBookingId = movieBookingId;
		this.userId = userId;
		this.movieId = movieId;
		this.theaterId = theaterId;
		this.movieInfoId = movieInfoId;
		this.movieInfoDate = movieInfoDate;
		this.movieInfotime = movieInfotime;
	}
	
}
