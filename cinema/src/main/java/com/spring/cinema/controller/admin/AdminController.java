package com.spring.cinema.controller.admin;

import java.io.Reader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cinema.model.Movie;
import com.spring.cinema.service.admin.AdminService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AdminController {
	
	private final AdminService adminService;
	
	
	// 영화 정보 리스트 불러오기
	@RequestMapping(value ="/adminPage", method = RequestMethod.GET)
	public String movieList(Model model) {
		List<Movie> movieList = adminService.getMovieList();
		System.out.println(movieList);
		model.addAttribute("movieList", movieList);
		return "adminPage";
	}
	
	// 영화 정보 추가폼
	@RequestMapping(value = "/insertMovieForm", method = RequestMethod.POST)
	public String insertMovieForm() {
	 
	    return "registrationMv";
	}
	
	
	// 영화 정보 추가
	@RequestMapping(value = "/insertMoive", method = RequestMethod.POST)
	public String insertMoive(@ModelAttribute Movie movie, Model model, RedirectAttributes redirectAttributes ) {
		adminService.insertMovie(movie);

		addRedirectMessage(redirectAttributes, "영화 정보가 추가되었습니다.");
		
		return "redirect:/adminPage";
	}
	
	// 영화 정보 수정 폼
	 @RequestMapping(value = "/updateMovie", method = RequestMethod.GET)
	    public String updateMovieForm(@RequestParam("movieId") Long movieId, Model model) {
	        Movie movie = adminService.getMovieById(movieId);
	        model.addAttribute("movie", movie);
	        return "updateMovie";
	    }
	
	// 영화 정보 수정
	 @RequestMapping(value="/updateMovie/{movieId}", method = RequestMethod.POST)
	 public String updateMovie(@PathVariable Long movieId, @ModelAttribute Movie updatedMovie, RedirectAttributes redirectAttributes) {
	     // movieId를 사용하여 해당 영화 정보를 가져옵니다.
	     Movie existingMovie = adminService.getMovieById(movieId);

	     // existingMovie에 updatedMovie의 내용을 복사하거나 필요한 필드만 업데이트합니다.
	     // 여기에서는 예시로 Movie 클래스에 setId와 같은 메서드가 있다고 가정합니다.
	     existingMovie.setMovieName(updatedMovie.getMovieName());
	     existingMovie.setMovieDate(updatedMovie.getMovieDate());

	     // 수정된 영화 정보를 저장합니다.
	     adminService.updateMovie(existingMovie);

	     addRedirectMessage(redirectAttributes, "영화 정보가 수정되었습니다.");

	     return "redirect:/adminPage";
	 }
	
	
	// 영화 정보 삭제
	 @RequestMapping(value="/deleteMovie/{movieId}", method = RequestMethod.POST)
	 public String deleteMovie(@PathVariable Long movieId, RedirectAttributes redirectAttributes) {
	     // movieId를 사용하여 해당 영화 정보를 가져옵니다.
	     Movie movieToDelete = adminService.getMovieById(movieId);

	     // 영화 정보를 삭제합니다.
	     adminService.deleteMovie(movieToDelete);

	     addRedirectMessage(redirectAttributes, "영화 정보가 삭제되었습니다.");

	     return "redirect:/adminPage";
	 }
	
	
	//
	private void addRedirectMessage(RedirectAttributes attributes, String message) {
		attributes.addFlashAttribute("message", message);
	}

	
}
	
	
	
	
	