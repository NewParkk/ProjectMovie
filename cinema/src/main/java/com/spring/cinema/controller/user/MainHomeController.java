package com.spring.cinema.controller.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainHomeController {
	

	
	//메인홈페이지
	@GetMapping(value = "/main")
	public String movieHome()  {
		return "main";
	}
	//영화 리스트페이지
	@GetMapping(value = "/movielist")
	public String movieList()  {
		return "test";
	}
	//리뷰 페이지
	@GetMapping(value = "/theather")
	public String movieReview()  {
		return "theather";
	}

	//회원가입 홈페이지
	@GetMapping(value = "/sign")
	public String Sign() {
		return "userRegistal";
	}


	//로그인 페이지
	@GetMapping(value = "/login")
	public String Login(HttpServletRequest request, HttpServletResponse response)  {
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			return "userLogIn";
		}
		return "redirect:/main";
	}

	//영화 등록 페이지
	@GetMapping(value = "/registration")
	public String movieRegistration()  {
		return "registrationMv";
	}
	}

