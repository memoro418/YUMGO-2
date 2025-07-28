package com.yumgo.handler.fridge;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FridgeItem;

public class FridgeListHandler implements CommandHandler {

	private FridgeItemDAO fridgeItemDAO = new FridgeItemDAO();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		String myParam = request.getParameter("my");
		List<FridgeItem> itemList;

		HttpSession session = request.getSession(false);
		String username = null;
		if (session != null) {
			username = (String) session.getAttribute("username");
		}

		if ("true".equals(myParam)) {
			if (username == null) {
				response.sendRedirect(request.getContextPath() + "/login/loginform.do");
				return null;
			}
			if (category != null && !category.equals("전체")) {
				itemList = fridgeItemDAO.findByUsernameAndCategory(username, category);
			} else {
				itemList = fridgeItemDAO.findByUsername(username);
			}
		} else {
			if (category != null && !category.equals("전체")) {
				itemList = fridgeItemDAO.findByCategory(category);
			} else {
				itemList = fridgeItemDAO.findAll();
			}
		}
		List<String> categoryList = Arrays.asList("전체", "채소류", "과일류", "유제품", "육류", "조리반찬", "음료", "냉동식품", "기타");
		request.setAttribute("categoryList", categoryList);

		request.setAttribute("itemList", itemList);
		request.setAttribute("selectedCategory", category);
		return "fridge/fridge_list.jsp";
	}
}
