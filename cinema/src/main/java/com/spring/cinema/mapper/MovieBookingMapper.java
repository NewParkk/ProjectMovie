package com.spring.cinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.cinema.model.Movie;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

@Mapper
public interface MovieBookingMapper {

	List<Movie> getAllMovieNameList();

	List<Theater> getTheaterBymovieId(int movieId);

	List<MovieInfo> getdateBymovieId(int movieId);
	
	
}
