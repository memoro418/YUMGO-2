package com.yumgo.handler.fridge;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FridgeItem;

public class FridgeDeleteExpiredHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        FridgeItemDAO dao = new FridgeItemDAO();
        List<FridgeItem> deletedItems = dao.deleteExpiredItems();

        if (deletedItems.isEmpty()) {
            request.setAttribute("message", "삭제할 항목이 없습니다.");
        } else {
            request.setAttribute("message", deletedItems.size() + "개 항목이 삭제되었습니다.");
            request.setAttribute("deletedItems", deletedItems);
        }

        return "fridge/delete_result.jsp"; // 결과 JSP에 바로 넘김
    }
}
