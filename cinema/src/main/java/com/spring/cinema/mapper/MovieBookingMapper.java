package com.spring.cinema.mapper;


import java.sql.Date;
import java.util.ArrayList;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.BookingInfo;
import com.spring.cinema.model.Movie;
import com.spring.cinema.model.MovieBooking;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

@Mapper
public interface MovieBookingMapper {

	List<Movie> getAllMovieNameList();

	List<Theater> getTheaterBymovieId(@Param(value = "movieId")int movieId);

	List<MovieInfo> getdateBymovieId(@Param(value = "theaterId")int theaterId, @Param(value = "movieId")int movieId);

	List<MovieInfo> gettimeBymovieId(@Param(value = "movieInfoDate")Date movieInfoDate, 
									@Param(value = "movieId")int movieId, 
									@Param(value = "theaterId")int theaterId);

	int savebooking(MovieBooking bookInfo);

	ArrayList<BookingInfo> getBookByuserId(@Param(value = "userId")String userId);


	
	
}
