package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.User;

public class MemberUpdatePostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("user_id");

		if (userId != null) {
			String uid = request.getParameter("id");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");

			User user = new User();
			user.setUser_id(userId); // PK 설정
			user.setId(uid);
			user.setUsername(username);
			user.setPassword(password);
			user.setEmail(email);

			UserDAO dao = new UserDAO();
			dao.updateUser(user);

			System.out.println("회원 정보가 수정되었습니다.");
			return "redirect:/index.do";
		} else {
			throw new RuntimeException("수정하려면 로그인해야 합니다.");
		}
	}
}
