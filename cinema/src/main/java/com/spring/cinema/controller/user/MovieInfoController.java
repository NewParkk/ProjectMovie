package com.spring.cinema.controller.user;

import org.springframework.web.bind.annotation.GetMapping;

public class MovieInfoController {

	
	
	//영화 상세 정보 페이지
		@GetMapping(value = "/detail")
		public String movieShow()  {
			return "movieDetail";
		}
}
