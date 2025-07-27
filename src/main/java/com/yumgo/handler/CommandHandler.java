package com.yumgo.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 모든 핸들러가 구현해야 하는 인터페이스 Command Pattern을 활용한 요청 처리
 */
public interface CommandHandler {
	String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}