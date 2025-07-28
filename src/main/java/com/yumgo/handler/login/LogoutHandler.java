package com.yumgo.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.handler.CommandHandler;

/**
 * 로그아웃 처리 핸들러
 */
public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		// 세션 무효화
		HttpSession session = request.getSession(false);
		if (session != null) {
			String username = (String) session.getAttribute("username");
			session.invalidate();

			if (username != null) {
				System.out.println("사용자 로그아웃: " + username);
			}
		}

		// 로그아웃 메시지와 함께 로그인 페이지로 리다이렉트
		request.setAttribute("message", "성공적으로 로그아웃되었습니다.");
		return "redirect:/login/loginform.do?logout=success";
	}
}