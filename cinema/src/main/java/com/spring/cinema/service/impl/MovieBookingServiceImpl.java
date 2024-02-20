package com.spring.cinema.service.impl;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.MovieBookingMapper;
import com.spring.cinema.model.Movie;
import com.spring.cinema.model.MovieBooking;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;
import com.spring.cinema.service.user.MovieBookingService;

@Service
public class MovieBookingServiceImpl implements MovieBookingService{
	
	private MovieBookingMapper movieBookingMapper;
	
	@Autowired
	public MovieBookingServiceImpl(MovieBookingMapper movieBookingMapper) {
		this.movieBookingMapper = movieBookingMapper;
	}
	
	
	public List<Movie> getAllMovieNameList(){
		return movieBookingMapper.getAllMovieNameList();
	}


	@Override
	public List<Theater> getTheaterBymovieId(int movieId) {
		
		return movieBookingMapper.getTheaterBymovieId(movieId);
	}


	@Override
	public List<MovieInfo> getdateBymovieId(MovieInfo movieInfo) {
		return movieBookingMapper.getdateBymovieId(movieInfo);
	}


	@Override
	public List<MovieInfo> gettimeBymovieId(MovieInfo movieInfo) {
		System.out.println(movieBookingMapper.gettimeBymovieId(movieInfo));
		return movieBookingMapper.gettimeBymovieId(movieInfo);
	}


	@Override
	public String savebooking(MovieBooking bookInfo) {
		String resultCode = "F000";
		int result = movieBookingMapper.savebooking(bookInfo);
		System.out.println(result);
		if (result > 0) {
			resultCode = "S000";
		}
		
		return resultCode;
	}
	
	@Override
	public ArrayList<MovieBooking> getBookByuserId(String userId){
	return movieBookingMapper.getBookByuserId(userId);
	}
}
