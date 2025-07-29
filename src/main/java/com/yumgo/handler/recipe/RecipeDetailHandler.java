package com.yumgo.handler.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.Recipe;
import com.yumgo.model.RecipeIngredient;
import com.yumgo.util.DataSource;

public class RecipeDetailHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String recipeName = request.getParameter("name");
		if (recipeName == null || recipeName.isEmpty()) {
			request.setAttribute("error", "레시피 이름이 없습니다.");
			return "error.jsp";
		}

		RecipeDAO dao = new RecipeDAO(new DataSource());
		Recipe recipe = dao.getRecipeByName(recipeName);
		List<RecipeIngredient> ingredients = dao.getIngredientsByRecipeName(recipeName);

		request.setAttribute("recipe", recipe);
		request.setAttribute("ingredients", ingredients);
		return "recipe/detail.jsp";
	}
}
