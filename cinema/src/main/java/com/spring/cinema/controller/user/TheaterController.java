package com.spring.cinema.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cinema.model.Theater;
import com.spring.cinema.service.user.TheaterService;

@Controller
public class TheaterController {
    
    @Autowired
    private TheaterService theaterService;
    
    @GetMapping("/theaters")
    public String showTheaterList(Model model) {
        // 극장 목록 가져오기
        List<Theater> theaters = theaterService.getAllTheaters();
        model.addAttribute("theaters", theaters);
        return "theaters";
    }
    
	@RequestMapping("map1")
	@ResponseBody
	public Theater map1(String location) {
		return theaterService.one(location);
		//return이 dto인 경우 @ResponseBody로 설정해주면
		//JSON으로 만들어서 클라이언트에게 줌.
	}
	
	@RequestMapping("map2")
	@ResponseBody
	public List<Theater> map2() {
		return theaterService.all();
		//List<MapDTO> ==> [{}, {}]
	}
}
