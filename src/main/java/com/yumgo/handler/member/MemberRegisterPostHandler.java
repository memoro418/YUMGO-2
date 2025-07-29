package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.User;

/**
 * 회원가입 처리 핸들러
 */
public class MemberRegisterPostHandler implements CommandHandler {

	private UserDAO userDAO = new UserDAO();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 파라미터 받기
		String username = request.getParameter("username");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");

		// 입력값 검증
		String validationError = validateInput(username, id, password, confirmPassword, email);
		if (validationError != null) {
			request.setAttribute("message", validationError);
			request.setAttribute("username", username);
			request.setAttribute("id", id);
			request.setAttribute("email", email);
			request.setAttribute("action", "register");
			return "member/register.jsp";
		}

		try {
			// 아이디 중복 체크
			if (userDAO.isIdExists(id.trim())) {
				request.setAttribute("message", "이미 사용 중인 아이디입니다.");
				request.setAttribute("username", username);
				request.setAttribute("email", email);
				request.setAttribute("action", "register");
				return "member/register.jsp";
			}

			// 사용자 객체 생성
			User user = new User();
			user.setUsername(username.trim());
			user.setId(id.trim());
			user.setPassword(password.trim());
			user.setEmail(email.trim());

			// 회원가입 처리
			boolean success = userDAO.registerUser(user);

			if (success) {
				request.setAttribute("message", "회원가입이 완료되었습니다. 로그인해주세요.");
				return "login/loginform.jsp";
			} else {
				request.setAttribute("message", "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
				request.setAttribute("username", username);
				request.setAttribute("id", id);
				request.setAttribute("email", email);
				request.setAttribute("action", "register");
				return "member/register.jsp";
			}

		} catch (Exception e) {
			System.err.println("회원가입 처리 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("message", "회원가입 처리 중 오류가 발생했습니다.");
			request.setAttribute("username", username);
			request.setAttribute("id", id);
			request.setAttribute("email", email);
			request.setAttribute("action", "register");
			return "member/register.jsp";
		}
	}

	/**
	 * 입력값 검증
	 */
	private String validateInput(String username, String id, String password, String confirmPassword, String email) {

		if (username == null || username.trim().isEmpty()) {
			return "사용자명을 입력해주세요.";
		}

		if (id == null || id.trim().isEmpty()) {
			return "아이디를 입력해주세요.";
		}

		if (password == null || password.trim().isEmpty()) {
			return "비밀번호를 입력해주세요.";
		}

		if (confirmPassword == null || !password.equals(confirmPassword)) {
			return "비밀번호가 일치하지 않습니다.";
		}

		if (email == null || email.trim().isEmpty()) {
			return "이메일을 입력해주세요.";
		}

		// 이메일 형식 간단 검증
		if (!email.contains("@") || !email.contains(".")) {
			return "올바른 이메일 형식을 입력해주세요.";
		}

		// 길이 제한 검증
		if (username.trim().length() < 2 || username.trim().length() > 20) {
			return "사용자명은 2자 이상 20자 이하로 입력해주세요.";
		}

		if (id.trim().length() < 4 || id.trim().length() > 20) {
			return "아이디는 4자 이상 20자 이하로 입력해주세요.";
		}

		if (password.trim().length() < 4) {
			return "비밀번호는 4자 이상 입력해주세요.";
		}

		return null; // 검증 통과
	}
}