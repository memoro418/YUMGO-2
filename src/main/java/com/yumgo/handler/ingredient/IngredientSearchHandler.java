package com.yumgo.handler.ingredient;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FoodInfoDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FoodInfo;

public class IngredientSearchHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("ingredientName");

        // ✅ keyword가 있으면 검색, 없으면 그냥 JSP만 보여줌
        if (keyword != null && !keyword.trim().isEmpty()) {
            FoodInfoDAO dao = new FoodInfoDAO();
            List<FoodInfo> results = dao.searchByFoodName(keyword);
            request.setAttribute("results", results);
        }

        // ✅ JSP 하나만 리턴
        return "ingredient/ingredient_search.jsp";
    }
}
