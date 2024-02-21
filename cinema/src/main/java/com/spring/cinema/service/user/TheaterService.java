package com.spring.cinema.service.user;

import java.util.List;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

public interface TheaterService {
	List<Theater> getAllTheaters();

	   List<MovieInfo> getMoviesByTheaterId(int theaterId);

	   List<MovieInfo> getAvailableDatesByTheaterIdAndMovieId(int theaterId, int movieId);

	   List<MovieInfo> getAvailableTimesByTheaterIdAndMovieIdAndDate(int theaterId, int movieId, String date);

	   String saveBooking(MovieInfo bookInfo);

	   Theater one(String theaterLoc);

	    List<Theater> all();
	  
}
