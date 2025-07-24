package com.yumgo.web;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yumgo.handler.CommandHandler;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

	@Override
	public void init() throws ServletException {
		// web.xml에서 configFile 초기화 파라미터 가져오기
		String configFile = getInitParameter("configFile");

		if (configFile == null) {
			throw new ServletException("configFile init parameter is missing.");
		}

		// 실제 파일 경로 얻기
		String configFilePath = getServletContext().getRealPath(configFile);
		System.out.println("Config file real path: " + configFilePath);

		Properties prop = new Properties();
		try (FileReader reader = new FileReader(configFilePath)) {
			prop.load(reader);
		} catch (IOException e) {
			throw new ServletException("command.properties 파일 로드 실패: " + configFilePath, e);
		}

		// 프로퍼티의 키(URI)와 값(핸들러 클래스명)으로 핸들러 인스턴스 생성 후 맵에 저장
		Iterator<?> keys = prop.keySet().iterator();
		while (keys.hasNext()) {
			String uri = (String) keys.next();
			String handlerClassName = prop.getProperty(uri);

			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.getDeclaredConstructor().newInstance();
				commandHandlerMap.put(uri, handlerInstance);

				System.out.println("핸들러 등록: " + uri + " -> " + handlerClassName);

			} catch (Exception e) {
				throw new ServletException("핸들러 로드 실패: " + handlerClassName, e);
			}
		}

		System.out.println("총 " + commandHandlerMap.size() + "개의 핸들러가 등록되었습니다.");
	}

	private void processServlet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 URI에서 contextPath를 제거하여 실제 명령어 추출
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("요청 URI: " + requestURI);
		System.out.println("contextPath: " + contextPath);
		System.out.println("처리할 명령어: " + command);

		CommandHandler handler = commandHandlerMap.get(command);

		// 핸들러가 없으면 기본 InvalidActionHandler로 처리하거나 404 에러 반환
		if (handler == null) {
			System.err.println("핸들러를 찾을 수 없습니다: " + command);
			// 기본 핸들러를 쓰고 싶으면 주석 해제 후 사용
			// handler = new InvalidActionHandler();

			// 아니면 404 에러 응답
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "요청하신 페이지를 찾을 수 없습니다: " + command);
			return;
		}

		try {
			String viewPage = handler.process(request, response);

			if (viewPage == null) {
				System.err.println("핸들러가 null을 반환했습니다: " + command);
				return;
			}

			// redirect: 접두어가 붙으면 리다이렉트 처리
			if (viewPage.startsWith("redirect:")) {
				String redirectURL = viewPage.substring("redirect:".length());
				if (redirectURL.startsWith("/")) {
					response.sendRedirect(contextPath + redirectURL);
				} else {
					response.sendRedirect(redirectURL);
				}
				return;
			}

			// 뷰 페이지를 /WEB-INF/views/ 경로로 포워딩
			String viewPath = "/WEB-INF/views/" + viewPage;
			System.out.println("포워드할 뷰 페이지: " + viewPath);

			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.err.println("핸들러 처리 중 오류 발생: " + command);
			e.printStackTrace();

			// 에러 메시지와 명령어를 request 속성으로 전달
			request.setAttribute("errorMessage", e.getMessage());
			request.setAttribute("errorCommand", command);

			// 에러 전용 JSP 페이지로 포워딩
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processServlet(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processServlet(request, response);
	}
}
