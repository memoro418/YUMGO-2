package com.yumgo.handler.fridge;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.dao.FridgeItemDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.FridgeItem;

public class FridgeListHandler implements CommandHandler {

    private FridgeItemDAO fridgeItemDAO = new FridgeItemDAO();

//    @Override
//    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        List<FridgeItem> itemList = fridgeItemDAO.findAll();
//        request.setAttribute("itemList", itemList);
//        return "fridge/fridgeItemList.jsp";
//    }
    
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String category = request.getParameter("category");
        List<FridgeItem> itemList;

        if (category != null && !category.equals("전체")) {
            itemList = fridgeItemDAO.findByCategory(category);
        } else {
            itemList = fridgeItemDAO.findAll();
        }

        request.setAttribute("itemList", itemList);
        request.setAttribute("selectedCategory", category); 
        return "fridge/fridge_list.jsp";
    }
}
