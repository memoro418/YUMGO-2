package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.User;

public class MemberInsertPostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		UserDAO dao = new UserDAO();
		/* String userid = request.getParameter("userid"); */ // 고유변호 자동적으로 증가설정했기에 필요없음
		String username = request.getParameter("username");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User user = new User();
		/* user.set(userid); */
		user.setUsername(username);
		user.setId(id);
		user.setPassword(password);
		user.setEmail(email);
		dao.registerUser(user);
		return "redirect:/";
	}

}
