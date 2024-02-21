package com.spring.cinema.model;



import java.sql.Date;
import java.sql.Time;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MovieInfo {
	private int movieInfoId;
	private int theaterId;
	private Date movieInfoDate;
	private Time movieInfoTime;
	private int movieId;
	
	
}
