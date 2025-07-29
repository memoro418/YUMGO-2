package com.yumgo.handler.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.Recipe;
import com.yumgo.model.RecipeIngredient;
import com.yumgo.util.DataSource;

public class RecipeSearchPostHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String recipeName = request.getParameter("recipeName");
		RecipeDAO dao = new RecipeDAO(new DataSource());

		Recipe recipe = dao.getRecipeByName(recipeName);
		List<RecipeIngredient> ingredients = dao.getIngredientsByRecipeName(recipeName);

		if (recipe != null) {
			request.setAttribute("recipe", recipe);
			request.setAttribute("ingredients", ingredients);
		} else {
			request.setAttribute("recipeName", recipeName);
		}

		return "recipe/search_result.jsp";
	}
}
