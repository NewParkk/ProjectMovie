package com.spring.cinema.grobal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);

		if (session.getAttribute("userAdmin") == null || session.getAttribute("userAdmin").equals(false)
				|| session.getAttribute("userAdmin").equals(0)) {
			response.sendRedirect("/main");
			return false;
		}

		return true;
	}
}