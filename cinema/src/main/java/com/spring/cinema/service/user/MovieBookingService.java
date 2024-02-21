package com.spring.cinema.service.user;


import java.sql.Date;
import java.util.ArrayList;

import java.util.List;

import com.spring.cinema.model.BookingInfo;
import com.spring.cinema.model.Movie;
import com.spring.cinema.model.MovieBooking;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

public interface MovieBookingService {

	List<Movie> getAllMovieNameList();

	List<Theater> getTheaterBymovieId(int movieId);

	List<MovieInfo> getdateBymovieId(int theaterId, int movieId);

	List<MovieInfo> gettimeBymovieId(Date movieInfoDate, int movieId, int theaterId);

	String savebooking(MovieBooking bookInfo);

	ArrayList<BookingInfo> getBookByuserId(String userId);

	
}
