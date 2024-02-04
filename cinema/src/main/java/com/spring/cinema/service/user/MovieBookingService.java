package com.spring.cinema.service.user;

import java.util.List;

import com.spring.cinema.model.Movie;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

public interface MovieBookingService {

	List<Movie> getAllMovieNameList();

	List<Theater> getTheaterBymovieId(int movieId);

	List<MovieInfo> getdateBymovieId(int movieId);

	
	
}
