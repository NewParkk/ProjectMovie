package com.spring.cinema.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Theater {
	private int theaterId;
	private int movieId;
	private String theaterLoc;
	private int theaterLocdetail;
	
	@Builder
	public Theater(int theaterId, int movieId, String theaterLoc, int theaterLocdetail) {
		this.theaterId = theaterId;
		this.movieId = movieId;
		this.theaterLoc = theaterLoc;
		this.theaterLocdetail = theaterLocdetail;
	}
	
	
}