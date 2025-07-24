package com.yumgo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 사용자 정보를 담는 모델 클래스
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int user_id;
	private String username;
	private String id;
	private String password;
	private String email;
}
