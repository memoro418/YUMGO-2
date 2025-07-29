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
            request.setAttribute("message", "fridgedelete.result.noitem");
        } else {
            request.setAttribute("message", "fridgedelete.result.success");
            request.setAttribute("deletedItems", deletedItems);
            request.setAttribute("deletedCount", deletedItems.size());
        }

        return "fridge/delete_result.jsp";
    }
}
