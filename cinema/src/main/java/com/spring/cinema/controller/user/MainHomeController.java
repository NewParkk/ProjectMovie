package com.spring.cinema.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cinema.model.User;
import com.spring.cinema.service.user.UserService;

@Controller
public class MainHomeController {
	
	private final UserService userService;

	@Autowired
	public MainHomeController(UserService userService) {
		this.userService = userService;
	}
	

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
	@GetMapping(value = "/userinfo/{userId}")
	public String userInfo(@PathVariable String userId, Model model) {
		User user = userService.getUserByuserId(userId);
	     model.addAttribute("user",user);
		return "userInfo";
	}
	
	@GetMapping(value = "/login")
	public String Login()  {
		return "login";
}
	
	@GetMapping(value = "/userUpdate")
	public String updateUser() {
		return "updateuser";
	}
}
