package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.User;

public class MemberSelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username != null) {
			UserDAO dao = new UserDAO();
			User user = dao.getUserByUsername(username);
			request.setAttribute("user", user);
			request.setAttribute("action", "update");
			return "login/memberform.jsp";
		} else {
			request.setAttribute("message", "로그인하지 않은 사용자입니다.");
			return "login/loginform.jsp";
		}
	}

}