package com.yumgo.handler.recipe;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.Recipe;
import com.yumgo.model.RecipeIngredient;
import com.yumgo.util.DataSource;

public class RecipeRecommendHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return "recipe/search_recommend.jsp";
		}

		String type = request.getParameter("type");
		RecipeDAO dao = new RecipeDAO(new DataSource());

		if ("recommend".equals(type)) {
			String ingredientName = request.getParameter("ingredientName");
			List<Recipe> recipes = dao.getRecipesByIngredientName(ingredientName);
			request.setAttribute("ingredientName", ingredientName);
			request.setAttribute("recipes", recipes);
		} else if ("search".equals(type)) {
			String recipeName = request.getParameter("recipeName");
			Recipe recipe = dao.getRecipeByName(recipeName);

			request.setAttribute("recipeName", recipeName); // 항상 담음(검색어 표시용)

			if (recipe != null) {
				List<RecipeIngredient> ingredients = dao.getIngredientsByRecipeName(recipeName);
				request.setAttribute("recipe", recipe);
				request.setAttribute("ingredients", ingredients);
			} else {
				// DB에 없으면 구글 검색 URL 생성 후 전달
				String googleUrl = "https://www.google.com/search?q=" + URLEncoder.encode(recipeName + " 레시피", "UTF-8");
				request.setAttribute("googleUrl", googleUrl);
			}
		}

		return "recipe/search_recommend.jsp";
	}
}
