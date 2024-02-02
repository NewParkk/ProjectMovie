package com.spring.cinema.controller.user;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cinema.model.User;
import com.spring.cinema.service.user.UserService;


@Controller
public class UserController {
	
	private final UserService userService;

	@Autowired
	public UserController(UserService userService) {
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
	
	
		
	
	
	@GetMapping(value = "/registration")
	public String movieRegistration()  {
		return "registrationMv";
	}
	
	@GetMapping(value = "/detail")
	public String movieShow()  {
		return "movieDetail";
	}
	
	
	@GetMapping(value = "/login")
	public String Login()  {
		
//		if (user.getIsAdmin()) {
//			return "redirect:/adminPage";
//		} else {
//			return "redirect:main";
//		}
//	} else {
//		return "redirect:/login?error=true";
//	}
		return "login";
	}
	@PostMapping("/log")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session) {
		User user = userService.getUserByUsername(username);

		if (user != null && BCrypt.checkpw(password, user.getPassword())) {
			session.setAttribute("user", user.getUsername());
			session.setAttribute("loggedInUserId", user.getId());
			session.setAttribute("isAdmin", user.getIsAdmin());
			if (user.getIsAdmin()) {
				return "redirect:/admin/dashboard";
			} else {
				return "redirect:/main";
			}
		} else {
			return "redirect:/login?error=true";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	@GetMapping(value = "/sign")
	public String Sign() {
		return "registaluser";
	}
	@PostMapping(value = "/signup")
	public String SingUp(@ModelAttribute User newUser)  {
		String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPassword);

		boolean result = userService.insertUser(newUser);
		if (result) {
			return "redirect:/login";
		} else {
			return "redirect:/register?error=true";
		}
	}
}
