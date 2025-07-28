package com.yumgo.handler.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.RecipeDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.util.DataSource;

public class RecipeDeleteHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String recipeName = request.getParameter("name");
		if (recipeName != null && !recipeName.isEmpty()) {
			RecipeDAO dao = new RecipeDAO(new DataSource());
			dao.deleteRecipeByName(recipeName);
		}
		return "redirect:/recipe/list.do"; // 삭제 후 리스트로 리디렉션
	}
}
