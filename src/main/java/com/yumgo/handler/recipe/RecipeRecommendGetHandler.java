package com.yumgo.handler.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.handler.CommandHandler;

public class RecipeRecommendGetHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "recipe/recommend_form.jsp";
	}
}
