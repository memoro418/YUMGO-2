package com.yumgo.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

public class LocaleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        // 세션에 언어 설정 없으면 브라우저 언어에서 자동 감지
        if (session.getAttribute("lang") == null) {
            String browserLang = request.getLocale().getLanguage(); // ex: "en", "ko"
            if ("en".equals(browserLang)) {
                session.setAttribute("lang", "en");
            } else {
                session.setAttribute("lang", "ko");
            }
        }

        chain.doFilter(request, response);
    }
}
