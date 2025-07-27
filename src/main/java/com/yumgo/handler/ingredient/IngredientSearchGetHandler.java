package com.yumgo.handler.ingredient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.handler.CommandHandler;

public class IngredientSearchGetHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 검색 입력 페이지로 이동
        return "ingredient/ingredient_search.jsp";
    }
}
