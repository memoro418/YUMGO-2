package com.yumgo.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.handler.CommandHandler;

/**
 * 로그인 폼을 보여주는 핸들러
 */
public class LoginFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		// 이미 로그인된 사용자는 메인 페이지로 리다이렉트
		HttpSession session = request.getSession(false);
		if (session != null) {
			String username = (String) session.getAttribute("username");
			if (username != null) {
				return "redirect:/index.do";
			}
		}

		// 로그인 폼 페이지로 이동
		return "login/loginform.jsp";
	}
}