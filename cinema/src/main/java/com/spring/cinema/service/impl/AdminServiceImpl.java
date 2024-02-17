package com.spring.cinema.service.impl;

import com.spring.cinema.service.admin.AdminService;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.AdminMapper;
import com.spring.cinema.model.Movie;
import com.spring.cinema.service.admin.AdminService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminMapper adminMapper;

	@Override
	public List<Movie> getMovieList() {
		 
		List<Movie> result = adminMapper.getMovieList();
		
		return result;
	}
	
	@Override
	public boolean insertMovie(Movie movie) {
		int result = 0;
		result = adminMapper.insertMovie(movie);
		if(result != 0) {
			return true;
		}
		return false;
	}
	@Override
	public Movie getMovieById(Long movieId) {
		Movie movie = adminMapper.getMovieById(movieId);
		
		return movie;
	}

	@Override
	public boolean updateMovie(Movie movie) {
		int result = 0;
		result = adminMapper.updateMovie(movie);
		if(result != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMovie(Movie movie) {
		int result = 0;
		result = adminMapper.deleteMovie(movie);
		if(result != 0) {
			return true;
		}
		
		return false;
	}
}
