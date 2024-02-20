package com.spring.cinema.controller.user;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cinema.model.Review;
import com.spring.cinema.service.impl.ReviewServiceImpl;
import com.spring.cinema.service.user.ReviewService;

@Controller
public class ReviewController {

	private final ReviewServiceImpl reviewServiceimpe;
	
	@Autowired
	public ReviewController(ReviewServiceImpl reviewServiceimpe) {
		this.reviewServiceimpe = reviewServiceimpe;
	}
	
	//리뷰 작성하기
	@PostMapping(value="/review/add")
	public String insertReview(@ModelAttribute Review review,HttpSession session) throws UnsupportedEncodingException {
		System.out.println(review);
		 String userId = (String) session.getAttribute("userId");

		    // 로그인 여부 확인
		    if (userId == null) {
		        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
		        return "redirect:/login";
		    }
		boolean result = reviewServiceimpe.insertReview(review);
		if (result) {
			//return "redirect:/moviedetail"+ review.getMovieName(); 를 사용하면
			//영화 이름에 있는 특수 문자나 한글 등이 ASCII로 인코딩되지 않아서 발생한다.	
			//URL 인코딩을 사용하여 "영화제목"을 ASCII로 변환해야 합니다. 
			//영화 이름을 UTF-8로 인코딩한 후에 리다이렉트 URL에 추가
			return "redirect:/moviedetail?movieName=" + URLEncoder.encode(review.getMovieName(), "UTF-8");
		} else {
			return "redirect:/register?error=true";
		}

	}
	
	
	//리뷰 삭제하기

	@GetMapping("/delete/{reviewId}")
	public String deleteReview(@PathVariable Integer reviewId,
								@RequestParam String movieName) throws UnsupportedEncodingException {
		System.out.println(reviewId);
		boolean result = reviewServiceimpe.deleteReview(reviewId);
		if (result) {
			return "redirect:/moviedetail?movieName=" + URLEncoder.encode(movieName, "UTF-8");
		} else {
			return "redirect:/register?error=true";
		}
	}
	
	//리뷰 수정하기
	@PostMapping("/update")
	@ResponseBody
	public String updateReview(@RequestBody Review review) throws UnsupportedEncodingException {
		System.out.println(review);
		boolean result = reviewServiceimpe.updateReview(review);
		if (result) {
			return "redirect:/moviedetail?movieName=" + URLEncoder.encode(review.getMovieName(), "UTF-8");
		} else {
			return "redirect:/register?error=true";
		}
	}
}
