package com.yumgo.handler.fridge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;

public class FridgeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String foodName = request.getParameter("foodName");

		FridgeItemDAO dao = new FridgeItemDAO();
		int result = dao.deleteByUsernameAndFoodName(username, foodName);

		request.setAttribute("message", result > 0 ? "삭제 완료" : "삭제 실패");
		return "fridge/delete_result.jsp";
	}
}
