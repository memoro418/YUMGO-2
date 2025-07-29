package com.yumgo.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Locale;

public class LocaleFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        String lang = req.getParameter("lang");

//        if (lang != null) {
//            Locale locale = new Locale(lang);
//            session.setAttribute("javax.servlet.jsp.jstl.fmt.locale.session", locale);
//        }

        if (lang != null) {
            Locale locale = Locale.forLanguageTag(lang);
            session.setAttribute("javax.servlet.jsp.jstl.fmt.locale.session", locale);
        }
        
        
        chain.doFilter(request, response);
    }
}
