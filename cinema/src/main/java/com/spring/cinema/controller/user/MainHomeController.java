package com.spring.cinema.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainHomeController {
	
	

	@GetMapping(value = "/main")
	public String movieHome()  {
		return "main";
	}
	@GetMapping(value = "/movielist")
	public String movieList()  {
		return "movielist";
	}
	@GetMapping(value = "/review")
	public String movieReview()  {
		return "review";
	}
	@GetMapping(value = "/book")
	public String movieBook()  {
		return "booking";
	}
	
	@GetMapping(value = "/registration")
	public String movieRegistration()  {
		return "registrationMv";
	}
	
	@GetMapping(value = "/detail")
	public String movieShow()  {
		return "movieDetail";
	}
	@GetMapping(value = "/userinfo")
	public String userInfo() {
		return "userInfo";
	}
	
	@GetMapping(value = "/login")
	public String Login()  {
		return "login";
}
}
