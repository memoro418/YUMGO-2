package com.yumgo.handler.fridge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;

public class FridgeDeleteExpiredHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        FridgeItemDAO dao = new FridgeItemDAO();
        int result = dao.deleteExpiredItems();

        request.setAttribute("message", result > 0 ? result + "개 항목 삭제됨" : "삭제할 항목이 없습니다");
        return "fridge/delete_result.jsp";
    }
}
