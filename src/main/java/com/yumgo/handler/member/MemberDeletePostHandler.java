package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;

public class MemberDeletePostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("user_id"); // 세션에서 user_id 가져오기

		if (userId != null) {
			String password = request.getParameter("password");
			UserDAO dao = new UserDAO();

			String realPassword = dao.getPasswordByUserId(userId); // userId에 해당하는 비밀번호 조회

			if (realPassword != null && realPassword.equals(password)) {
				dao.deleteUser(userId);      // 사용자 삭제
				session.invalidate();       // 세션 만료
				return "redirect:/";
			} else {
				request.setAttribute("error", "비밀번호가 일치하지 않습니다.");
				return "login/passwordform.jsp"; 
			}
		}else {
			return "redirect:/";
		}
	}
}

