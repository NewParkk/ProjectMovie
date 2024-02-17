package com.spring.cinema.controller.user;

import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.spring.cinema.model.Movie;
import com.spring.cinema.model.Review;
import com.spring.cinema.service.impl.MovieServiceImpl;
import com.spring.cinema.service.impl.ReviewServiceImpl;
import com.spring.cinema.service.user.MovieService;
import com.spring.cinema.service.user.ReviewService;
import com.spring.cinema.service.user.UserService;

@Controller
public class MovieInfoController {

	private final MovieServiceImpl movieServiceimpl;
	private final ReviewServiceImpl reviewServiceimpl;
	
	@Autowired
	public MovieInfoController(MovieServiceImpl movieServiceimpl
								,ReviewServiceImpl reviewServiceimpl) {
		this.movieServiceimpl = movieServiceimpl;
		this.reviewServiceimpl = reviewServiceimpl;
	}
    @GetMapping(value = "/detail")
    public String movieShow() {
        return "movieDetail"; // JSP 파일 이름을 반환합니다.
    }

    @GetMapping(value = "/movies")
    public String getAllMovies(Model model) {
    	 ArrayList<Movie> movieList= movieServiceimpl.getAllMovie();
    	 System.out.println(movieList);
    	 model.addAttribute("movieList",movieList);
    	 System.out.println(model.toString());
        return "movielist"; 
    }
    
	//영화 등록 페이지
	@PostMapping(value ="/insertmovie")
	public String movieRegistration( 
									@RequestParam String movieName,
									@RequestParam String movieStory,
									@RequestParam String movieDate,
									@RequestParam String movieImgUrl){
	
//		Movie movie = null;
//		System.out.println(movie);
//		System.out.println(movieName);
//		System.out.println(movieStory);
//		System.out.println(movieDate);
//		System.out.println(movieImgUrl);
//		
//		movie.setMovieName(movieName);
//		System.out.println(movie.getMovieName());
//		movie.setMovieStory(movieStory);
//		movie.setMovieDate(movieDate);
//		movie.setMovieImgUrl(movieImgUrl);
		
		boolean result = movieServiceimpl.movieRegistration(movieName,
														movieStory,
														movieDate,
														movieImgUrl);
		System.out.println(result);
		if (result) {
			return "redirect:/movies";
		} else {
			return "redirect:/register?error=true";
		}

	}
	
	@GetMapping("/moviedetail")
	public String movieDetail(@RequestParam String movieName, Model model) {
		System.out.println(movieName);
		Movie movie = movieServiceimpl.getMovieByName(movieName);
		ArrayList<Review> reviewList = reviewServiceimpl.getReviewList(movieName);
		System.out.println(movie);
		System.out.println(reviewList);
		model.addAttribute("movie",movie);
		model.addAttribute("reviewList",reviewList);
	    return "movieDetail";
	}
}
