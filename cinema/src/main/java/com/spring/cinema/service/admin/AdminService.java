package com.spring.cinema.service.admin;

import java.util.List;

import com.spring.cinema.model.Movie;

public interface adminService {

	List<Movie> getMovieList();

	boolean insertMovie(Movie movie);

	boolean updateMovie(Movie movie);

	boolean deleteMovie(Movie movie);

	Movie getMovieById(Long movieId);



}
