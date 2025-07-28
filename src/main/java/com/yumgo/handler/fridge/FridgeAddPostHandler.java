package com.yumgo.handler.fridge;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FridgeItem;
import com.yumgo.model.User;

public class FridgeAddPostHandler implements CommandHandler {
	private FridgeItemDAO fridgeItemDAO = new FridgeItemDAO();
	private UserDAO userDAO = new UserDAO();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 로그인된 사용자 ID (로그인 시 세션에 저장되었어야 함)
		String id = request.getParameter("id");

		User user = userDAO.getUserById(id);
		if (user == null) {
			request.setAttribute("message", "사용자 정보를 찾을 수 없습니다.");
			return "fridge/fridgeAddForm.jsp";
		}

		// 폼에서 전달받은 음식 정보
		String foodName = request.getParameter("foodName");
		String category = request.getParameter("category");
		String quantity = request.getParameter("quantity");
		String expiration = request.getParameter("expirationDate");

		// 유통기한 유효성 검사
		/*
		 * Date expirationDate = Date.valueOf(expiration); Date today = new
		 * Date(System.currentTimeMillis());
		 * 
		 * if (expirationDate.before(today)) { request.setAttribute("message",
		 * "⚠️ 유통기한이 지난 음식은 등록할 수 없습니다.");
		 * 
		 * request.setAttribute("foodName", foodName); request.setAttribute("category",
		 * category); request.setAttribute("quantity", quantity);
		 * request.setAttribute("expirationDate", expiration); return
		 * "fridge/fridgeAddForm.jsp"; }
		 */

		FridgeItem item = new FridgeItem();
		item.setUserId(user.getUser_id()); // DB 저장용
		item.setUsername(user.getUsername()); // 화면 표시용
		item.setFoodName(foodName);
		item.setCategory(category);
		item.setQuantity(quantity);
		item.setExpirationDate(Date.valueOf(expiration));

		int result = fridgeItemDAO.insertFridgeItemAuto(item);

		if (result > 0) {
			request.setAttribute("message", "음식이 성공적으로 추가되었습니다.");
		} else {
			request.setAttribute("message", "음식 추가에 실패했습니다.");
		}

		return "redirect:/";
	}
}
