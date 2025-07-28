package com.yumgo.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yumgo.dao.UserDAO;
import com.yumgo.handler.CommandHandler;
import com.yumgo.model.User;

public class MemberMyPageHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");  // 로그인된 사용자 id

        if (id != null) {
            UserDAO dao = new UserDAO();
            User user = dao.getUserById(id); 
            request.setAttribute("user", user);
            return "member/mypage.jsp";
        } else {
            return "redirect:/login/login.do";
        }
    }
}
