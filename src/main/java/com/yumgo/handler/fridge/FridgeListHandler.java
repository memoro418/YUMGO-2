package com.yumgo.handler.fridge;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FridgeItem;

public class FridgeListHandler implements CommandHandler {

    private FridgeItemDAO fridgeItemDAO = new FridgeItemDAO();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String category = request.getParameter("category");
        String myParam = request.getParameter("my");
        List<FridgeItem> itemList;

        // 로그인 사용자 세션에서 가져오기
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        
        // 필터 기능 추가 (전체 / my)
        if ("true".equals(myParam)) {
            if (category != null && !category.equals("전체")) {
                itemList = fridgeItemDAO.findByUsernameAndCategory(username, category);
            } else {
                itemList = fridgeItemDAO.findByUsername(username);
            }
        } else {
            // 전체 보기
            if (category != null && !category.equals("전체")) {
                itemList = fridgeItemDAO.findByCategory(category);
            } else {
                itemList = fridgeItemDAO.findAll();
            }
        }

        request.setAttribute("itemList", itemList);
        request.setAttribute("selectedCategory", category);
        return "fridge/fridge_list.jsp";
    }
}
