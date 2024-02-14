package com.spring.cinema.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
