package com.yumgo.handler.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.Recipe;
import com.yumgo.util.DataSource;

public class RecipeRecommendPostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ingredientName = request.getParameter("ingredientName");
		RecipeDAO dao = new RecipeDAO(new DataSource());

		List<Recipe> recipes = dao.getRecipesByIngredientName(ingredientName);
		request.setAttribute("ingredientName", ingredientName);
		request.setAttribute("recipes", recipes);

		return "recipe/recommend_result.jsp";
	}
}
