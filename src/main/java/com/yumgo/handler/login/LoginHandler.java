package com.yumgo.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.User;

/**
 * 로그인 처리 핸들러
 */
public class LoginHandler implements CommandHandler {

	private UserDAO userDAO = new UserDAO();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// 입력값 검증
		if (id == null || id.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			request.setAttribute("message", "아이디와 비밀번호를 모두 입력해주세요.");
			return "login/loginform.jsp";
		}

		try {
			// ID로 사용자 조회
			User user = userDAO.getUserById(id.trim());

			if (user != null && user.getPassword().equals(password.trim())) {
				// 로그인 성공
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user); // 전체 객체 저장
				session.setAttribute("user_id", user.getUser_id());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("useremail", user.getEmail());
				// 로그인 성공 후 세션 저장
				session.setAttribute("id", user.getId());

				String originalURL = (String) session.getAttribute("originalURL");
				session.removeAttribute("originalURL");

				if (originalURL != null && !originalURL.contains("login")) {
					return "redirect:" + originalURL;
				} else {
					return "redirect:/index.do";
				}

			} else {
				// 로그인 실패
				request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
				request.setAttribute("id", id); // 입력했던 ID 유지
				return "login/loginform.jsp";
			}

		} catch (Exception e) {
			System.err.println("로그인 처리 중 오류: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("message", "로그인 처리 중 오류가 발생했습니다.");
			return "login/loginform.jsp";
		}
	}
}
