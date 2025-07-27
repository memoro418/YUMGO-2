package com.yumgo.handler.ingredient;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FoodInfoDAO;
import com.yumgo.model.FoodInfo;
import com.yumgo.handler.CommandHandler;

public class IngredientSearchPostHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String keyword = request.getParameter("ingredientName");

        List<FoodInfo> results = null;
        if (keyword != null && !keyword.trim().isEmpty()) {
            FoodInfoDAO dao = new FoodInfoDAO();
            results = dao.searchByFoodName(keyword);
        }

        request.setAttribute("ingredientName", keyword); 
        request.setAttribute("results", results); 
        System.out.println("🔍 입력된 검색어: " + keyword);
        System.out.println("✅ 검색 결과 수: " + (results != null ? results.size() : "null"));
        return "ingredient/ingredient_search_result.jsp";
    }
}
