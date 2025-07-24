package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.handler.CommandHandler;

/**
 * 회원가입 폼을 보여주는 핸들러
 */
public class MemberRegisterGetHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 회원가입 폼 페이지로 이동
		request.setAttribute("pageTitle", "회원가입 - YUMGO");
		request.setAttribute("action", "register");

		return "member/register.jsp";
	}
}