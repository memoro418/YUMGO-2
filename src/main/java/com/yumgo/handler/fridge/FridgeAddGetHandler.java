package com.yumgo.handler.fridge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.handler.CommandHandler;

public class FridgeAddGetHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return "fridge/fridge_addform.jsp";
	}

}
