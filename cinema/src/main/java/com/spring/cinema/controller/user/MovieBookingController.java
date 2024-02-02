package com.spring.cinema.controller.user;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.cinema.model.Movie;
import com.spring.cinema.model.Theater;
import com.spring.cinema.service.user.MovieBookingService;

@Controller
public class MovieBookingController {

	private final MovieBookingService movieBookingService;
	
	@Autowired
	public MovieBookingController(MovieBookingService movieBookingService) {
		this.movieBookingService = movieBookingService;
	}
	
	
	@GetMapping(value = "/book")
	public String movieBooking(HttpSession session, Model model) {
		
		List<Movie> movies = movieBookingService.getAllMovieNameList();
		
		model.addAttribute("movies", movies);
		System.out.println(Arrays.asList(movies).toString());
		System.out.println(movies.toString());
		return "booking";
	}
	
	@PostMapping(value = "/book/getTheaterList")
	@ResponseBody
	public ModelAndView theaterInfo(@RequestBody Movie movie) {
		
		List<Theater> theaterList = movieBookingService.getTheaterBymovieId(movie.getMovieId());
		System.out.println(theaterList.toString());
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("theaterList", theaterList);
		
		return mv;
	}
}
