package com.spring.cinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.cinema.model.Movie;

@Mapper
public interface AdminMapper {

	
	Movie getMovieById(Long movieId);

	List<Movie> getMovieList();
	
	int insertMovie(Movie movie);
	
	int updateMovie(Movie movie);

	int deleteMovie(Movie movie);



}
