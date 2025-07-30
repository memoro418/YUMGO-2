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
        // lang 파라미터 없고 세션에도 설정된 로케일이 없다면 → 브라우저 언어 기본 반영
        else if (session.getAttribute("javax.servlet.jsp.jstl.fmt.locale.session") == null) {
            Locale defaultLocale = req.getLocale(); // Accept-Language 기반
            session.setAttribute("javax.servlet.jsp.jstl.fmt.locale.session", defaultLocale);
        }
        
        
        chain.doFilter(request, response);
    }
}
