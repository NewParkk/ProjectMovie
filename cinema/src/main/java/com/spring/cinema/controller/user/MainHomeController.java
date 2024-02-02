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
	
	//메인홈페이지
	@GetMapping(value = "/main")
	public String movieHome()  {
		return "main";
	}
	//영화 리스트페이지
	@GetMapping(value = "/movielist")
	public String movieList()  {
		return "movielist";
	}
	//리뷰 페이지
	@GetMapping(value = "/review")
	public String movieReview()  {
		return "review";
	}
	//예약 페이지
	@GetMapping(value = "/book")
	public String movieBook()  {
		return "booking";
	}
	//회원가입 홈페이지
	@GetMapping(value = "/sign")
	public String Sign() {
		return "registalUser";
	}
	//영화 등록 페이지
	@GetMapping(value = "/registration")
	public String movieRegistration()  {
		return "registrationMv";
	}
	//영화 상세 정보 페이지
	@GetMapping(value = "/detail")
	public String movieShow()  {
		return "movieDetail";
	}
	//회원 상세 정보 페이지
	@GetMapping(value = "/userinfo/{userId}")
	public String userInfo(@PathVariable String userId, Model model) {
		User user = userService.getUserByuserId(userId);
	     model.addAttribute("user",user);
		return "userInfo";
	}
	//로그인 페이지
	@GetMapping(value = "/login")
	public String Login()  {
		return "logIn";
}
	//회원 정보 변경 페이지
	@GetMapping(value = "/userUpdate")
	public String updateUser() {
		return "updateUser";
	}
}
