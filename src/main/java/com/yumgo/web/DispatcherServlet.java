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
import com.yumgo.handler.InvalidactionActionHandler;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

	public void init() throws ServletException {
		// 설정파일(command.properties)에서 URI와 클래스이름을 읽어들임
		String configFile = getInitParameter("configFile");
		String configFilePath = getServletContext().getRealPath(configFile);
		Properties prop = new Properties();
		try (FileReader reader = new FileReader(configFilePath)) {
			prop.load(reader);
		} catch (IOException e) {
			throw new ServletException(e);
		}

		// 맵(commandHandlerMap)에 URI는 키, 클래스이름을 이용해서 만든 인스턴스는 값으로 저장
		Iterator<?> keys = prop.keySet().iterator();
		while (keys.hasNext()) {
			String uri = (String) keys.next();
			String handlerClassName = prop.getProperty(uri);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.getDeclaredConstructor().newInstance();
				commandHandlerMap.put(uri, handlerInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	private void processServlet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 URI를 얻어서
		String command = request.getRequestURI();

		// URI로 해당하는 핸들러 인스턴스를 가져와
		CommandHandler handler = commandHandlerMap.get(command);
		if (handler == null) {
			handler = new InvalidactionActionHandler();
		}

		// process() 실행
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
			// 뷰이름 앞에 redirect:이 붙어 있으면 리다이렉트 하세요.
			if ((viewPage != null) && (viewPage.indexOf("redirect:") == 0)) {
				viewPage = viewPage.substring(9);
				response.sendRedirect(viewPage);
				return;
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}

		// 결과 뷰로 forward
		if (viewPage != null) {
			viewPage = "/WEB-INF/views/" + viewPage;
		} else {
			viewPage = "/WEB-INF/views/index.jsp";
		}
		RequestDispatcher disp = request.getRequestDispatcher(viewPage);
		disp.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processServlet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processServlet(request, response);
	}

}
