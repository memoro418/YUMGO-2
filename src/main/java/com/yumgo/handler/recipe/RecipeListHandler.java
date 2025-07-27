package com.yumgo.handler.recipe;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.Recipe;
import com.yumgo.util.DataSource;

public class RecipeListHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RecipeDAO dao = new RecipeDAO(new DataSource());
		List<Recipe> recipeList = dao.getAllRecipes(); // 전체 레시피 조회로 변경
		request.setAttribute("recipeList", recipeList);
		return "recipe/list.jsp";
	}
}
