package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.handler.CommandHandler;

public class MemberDeleteGetHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   HttpSession session = request.getSession();
	        String id = (String) session.getAttribute("id");  // 로그인된 사용자 id
		if (id != null) {
			return "login/passwordform.jsp";
		} else {
			return "member/loginform.jsp";
		}
	}
}
