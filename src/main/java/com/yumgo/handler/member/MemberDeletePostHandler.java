package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;

public class MemberDeletePostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO dao = new UserDAO();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			String password = request.getParameter("password");
			String realpw = dao.getPassword("user_id");
			if (realpw.equals(password)) {
				int userid = Integer.valueOf(user_id);
				dao.deleteUser(userid);
				session.invalidate();
				return "redirect:/";
			} else {
				throw new RuntimeException("비밀번호가 다릅니다");
			}
		} else {
			throw new RuntimeException("삭제하려면 로그인해야합니다");
		}
	}

}
