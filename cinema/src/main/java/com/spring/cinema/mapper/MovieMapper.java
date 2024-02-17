package com.spring.cinema.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.cinema.model.Movie;

@Mapper
public interface MovieMapper {

	Movie getTitleById(@Param(value ="movieId")int movieId);

	ArrayList<Movie> getAllMovie();


	int movieRegistration(@Param(value ="movieName")String movieName, 
						@Param(value ="movieStory")String movieStory, 
						@Param(value ="movieDate")String movieDate, 
						@Param(value ="movieImgUrl")String movieImgUrl);

	Movie getMovieByName(@Param(value ="movieName")String movieName);

}
