// TheaterServiceImpl.java

package com.spring.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cinema.mapper.TheaterMapper;
import com.spring.cinema.model.MovieInfo;
import com.spring.cinema.model.Theater;
import com.spring.cinema.service.user.TheaterService;

@Service
public class TheaterServiceImpl implements TheaterService {
   
   private final TheaterMapper theaterMapper;
   
   @Autowired
   public TheaterServiceImpl(TheaterMapper theaterMapper) {
      this.theaterMapper = theaterMapper;
   }
   
   @Override
   public List<Theater> getAllTheaters() {
      return theaterMapper.getAllTheaters();
   }

   @Override
   public List<MovieInfo> getMoviesByTheaterId(int theaterId) {
      return theaterMapper.getMoviesByTheaterId(theaterId);
   }

   @Override
   public List<MovieInfo> getAvailableDatesByTheaterIdAndMovieId(int theaterId, int movieId) {
      return theaterMapper.getAvailableDatesByTheaterIdAndMovieId(theaterId, movieId);
   }

   @Override
   public List<MovieInfo> getAvailableTimesByTheaterIdAndMovieIdAndDate(int theaterId, int movieId, String date) {
      return theaterMapper.getAvailableTimesByTheaterIdAndMovieIdAndDate(theaterId, movieId, date);
   }

   @Override
   public String saveBooking(MovieInfo bookInfo) {
       String resultCode = "F000";
       int result = theaterMapper.saveBooking(bookInfo);
       if (result > 0) {
           resultCode = "S000";
       }
       return resultCode;
   }


}
