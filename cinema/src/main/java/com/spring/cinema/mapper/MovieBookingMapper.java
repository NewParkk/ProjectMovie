package com.spring.cinema.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.Movie;
import com.spring.cinema.model.MovieBooking;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

@Mapper
public interface MovieBookingMapper {

	List<Movie> getAllMovieNameList();

	List<Theater> getTheaterBymovieId(@Param(value = "movieId")int movieId);

	List<MovieInfo> getdateBymovieId(MovieInfo movieInfo);

	List<MovieInfo> gettimeBymovieId(MovieInfo movieInfo);

	int savebooking(MovieBooking bookInfo);

	ArrayList<MovieBooking> getBookByuserId(@Param(value = "userId")String userId);
	
	
}
