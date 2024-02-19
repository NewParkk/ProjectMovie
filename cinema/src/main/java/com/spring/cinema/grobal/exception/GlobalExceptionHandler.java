package com.spring.cinema.grobal.exception;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.concurrent.TimeoutException;


import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

	// 예외: NullPointerException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(NullPointerException.class)
    public String handleNullPointerException(NullPointerException e, Model model) {
        model.addAttribute("exceptionMessage", "NullPointerException이 발생했습니다.");
        return "error/500";
    }
    
    // 예외: IllegalArgumentException
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    @ExceptionHandler(IllegalArgumentException.class)
    public String handleIllegalArgumentException(IllegalArgumentException e, Model model) {
        model.addAttribute("exceptionMessage", "잘못된 인자로 인한 오류가 발생했습니다.");
        return "error/400";
    }

    // 예외: NumberFormatException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(NumberFormatException.class)
    public String handleNumberFormatException(NumberFormatException e, Model model) {
        model.addAttribute("exceptionMessage", "숫자 형식 오류가 발생했습니다.");
        return "error/error";
    }

    // 예외: IOException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(IOException.class)
    public String handleIOException(IOException e, Model model) {
        model.addAttribute("exceptionMessage", "입출력 오류가 발생했습니다.");
        return "error/error";
    }

    // 예외: SQLException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(SQLException.class)
    public String handleSQLException(SQLException e, Model model) {
        model.addAttribute("exceptionMessage", "SQL 오류가 발생했습니다.");
        return "error/error";
    }

    // 예외: ParseException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(ParseException.class)
    public String handleParseException(ParseException e, Model model) {
        model.addAttribute("exceptionMessage", "구문 분석 오류가 발생했습니다.");
        return "error/error";
    }

    // 예외: SecurityException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(SecurityException.class)
    public String handleSecurityException(SecurityException e, Model model) {
        model.addAttribute("exceptionMessage", "보안 오류가 발생했습니다.");
        return "error/error";
    }

    // 예외: TimeoutException
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(TimeoutException.class)
    public String handleTimeoutException(TimeoutException e, Model model) {
        model.addAttribute("exceptionMessage", "타임아웃 오류가 발생했습니다.");
        return "error/error";
    }

    // 예외: 404 Not Found 에러 처리
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handleNotFound(Exception e, Model model) {
        model.addAttribute("exceptionMessage", "페이지를 찾을 수 없습니다.");
        return "error/404";
    }

    // 모든 예외 처리
    @ResponseStatus(code = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
    	e.printStackTrace();
        model.addAttribute("exceptionMessage", "예외가 발생하였습니다.");
        return "error/500";
    }
}
