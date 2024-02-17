package com.spring.cinema.grobal.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception e) {
        ModelAndView modelAndView = new ModelAndView("error_page"); 
        modelAndView.addObject("errorMessage", "예상치 못한 오류가 발생했습니다."); 
        return modelAndView;
    }
}
