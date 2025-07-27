package com.yumgo.handler.fridge;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FridgeItem;

public class FridgeMyListHandler implements CommandHandler {

	private FridgeItemDAO fridgeItemDao = new FridgeItemDAO();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            // 로그인하지 않았으면 로그인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/login/loginform.do");
            return null;
        }

        String username = (String) session.getAttribute("username");

        List<FridgeItem> myFoods = fridgeItemDao.findByUsername(username);
        request.setAttribute("myFoods", myFoods);

        return "fridge/fridge_mylist.jsp";
    }

}
