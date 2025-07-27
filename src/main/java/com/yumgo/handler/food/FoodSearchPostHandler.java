package com.yumgo.handler.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.Recipe;
import com.yumgo.util.DataSource;

public class FoodSearchPostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String recipeName = request.getParameter("recipeName");
		RecipeDAO dao = new RecipeDAO(new DataSource());

		Recipe recipe = dao.getRecipeByName(recipeName);
		request.setAttribute("recipeName", recipeName); // 항상 전달

		if (recipe != null) {
			request.setAttribute("recipe", recipe);
		} else {
			String googleUrl = "https://www.google.com/search?q="
					+ java.net.URLEncoder.encode(recipeName + " 레시피", "UTF-8");
			request.setAttribute("googleUrl", googleUrl);
		}

		return "food/search_result.jsp";
	}
}
