// TheaterMapper.java

package com.spring.cinema.mapper;

import java.util.List;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;

public interface TheaterMapper {

   List<Theater> getAllTheaters();

   List<MovieInfo> getMoviesByTheaterId(int theaterId);

   List<MovieInfo> getAvailableDatesByTheaterIdAndMovieId(int theaterId, int movieId);

   List<MovieInfo> getAvailableTimesByTheaterIdAndMovieIdAndDate(int theaterId, int movieId, String date);

   int saveBooking(MovieInfo bookInfo);

   Theater selectOne(String theaterLoc);

    List<Theater> selectList();
}
