package com.yumgo.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 로그인 인증이 필요한 페이지에 대한 접근 제어 필터
 */
@WebFilter("*.do")
public class SecurityFilter implements Filter {

	// 로그인 없이 접근 가능한 URL 패턴들
	private static final List<String> PUBLIC_URLS = Arrays.asList("/index.do", "/login/loginform.do", "/login/login.do",
			"/member/register.do", "/member/registerProcess.do", "/food/search.do", "/food/searchProcess.do",
			"/recipe/list.do", "/recipe/detail.do", "/recipe/recommend.do", "/recipe/recommendProcess.do",
			"/recipe/search.do", "/recipe/searchProcess.do");

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("SecurityFilter 초기화됨");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String requestURI = httpRequest.getRequestURI();
		String contextPath = httpRequest.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("SecurityFilter - 요청 URI: " + requestURI);
		System.out.println("SecurityFilter - 명령어: " + command);

		// 정적 리소스는 필터링하지 않음
		if (isStaticResource(command)) {
			chain.doFilter(request, response);
			return;
		}

		// 공개 URL인지 확인
		if (isPublicUrl(command)) {
			System.out.println("공개 URL - 인증 불필요: " + command);
			chain.doFilter(request, response);
			return;
		}

		// 세션에서 사용자 정보 확인
		HttpSession session = httpRequest.getSession(false);
		String username = null;

		if (session != null) {
			username = (String) session.getAttribute("username");
		}

		if (username != null) {
			System.out.println("로그인된 사용자: " + username + " - 접근 허용");
			chain.doFilter(request, response);
		} else {
			System.out.println("미로그인 사용자 - 로그인 페이지로 리다이렉트");

			// 원래 요청했던 URL을 세션에 저장 (로그인 후 돌아가기 위해)
			session = httpRequest.getSession(true);
			session.setAttribute("originalURL", requestURI);

			// 로그인 페이지로 리다이렉트
			httpResponse.sendRedirect(contextPath + "/login/loginform.do");
		}
	}

	@Override
	public void destroy() {
		System.out.println("SecurityFilter 소멸됨");
	}

	/**
	 * 공개 URL인지 확인
	 */
	private boolean isPublicUrl(String command) {
		return PUBLIC_URLS.contains(command);
	}

	/**
	 * 정적 리소스인지 확인 (CSS, JS, 이미지 등)
	 */
	private boolean isStaticResource(String command) {
		return command.startsWith("/css/") || command.startsWith("/js/") || command.startsWith("/images/")
				|| command.startsWith("/favicon.ico") || command.endsWith(".css") || command.endsWith(".js")
				|| command.endsWith(".png") || command.endsWith(".jpg") || command.endsWith(".jpeg")
				|| command.endsWith(".gif") || command.endsWith(".ico");
	}
}