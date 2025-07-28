package com.yumgo.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.FridgeItemDAO;

public class HomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("username") == null) {
			// 로그인 안 되어 있으면 로그인 폼으로 리다이렉트
			return "redirect:/login/loginform.do";
		}

		String username = (String) session.getAttribute("username");
		int userId = (int) session.getAttribute("user_id");
		System.out.println("현재 세션의 user_id는 " + userId);
		request.setAttribute("welcomeMessage", username + "님, 환영합니다!");

		// 냉장고 요약 데이터 가져오기
		FridgeItemDAO dao = new FridgeItemDAO();
		int expiringCount = dao.countExpiringSoonItemsByUserId(userId);
		int todayStoredCount = dao.countTodayStoredItems();
		int totalCount = dao.countTodayStoredItemsByUserId(userId);
		int StoredTotal = dao.countStoredItemsAll();
		// JSP에 전달
		request.setAttribute("expiringCount", expiringCount);
		request.setAttribute("todayStoredCount", todayStoredCount);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("StoredTotal", StoredTotal);
		// 메인 페이지 정보 설정
		request.setAttribute("pageTitle", "YUMGO - 냉장고 관리 시스템");
		request.setAttribute("currentPage", "home");
		System.out.println("expiringCount: " + expiringCount);
		System.out.println("todayStoredCount: " + todayStoredCount);
		System.out.println("totalCount: " + totalCount);
		System.out.println("StoredTotal: " + StoredTotal);

		return "index.jsp";
	}
}
