package com.spring.cinema.model;

import java.sql.Date;
import java.sql.Time;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MovieBooking {
	
	private Integer movieBookingId; 
	private String userId; 
	private Integer movieId;
	private Integer theaterId;
	private Date movieInfoDate;
	private String movieInfoTime;
	
	
	
}
