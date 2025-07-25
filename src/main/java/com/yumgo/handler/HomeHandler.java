package com.yumgo.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("username") == null) {
			// 로그인 안 되어 있으면 로그인 폼으로 리다이렉트
			return "redirect:/login/loginform.do";
		}

		String username = (String) session.getAttribute("username");
		request.setAttribute("welcomeMessage", username + "님, 환영합니다!");

		// 메인 페이지 정보 설정
		request.setAttribute("pageTitle", "YUMGO - 냉장고 관리 시스템");
		request.setAttribute("currentPage", "home");

		return "index.jsp";
	}
}
