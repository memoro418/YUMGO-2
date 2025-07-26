package com.yumgo.model;

import java.sql.Date;

import lombok.Data;

@Data
public class FridgeItem {
	private int fridgeItemId;
	private int userId;
	private Integer foodId;
	private Date expirationDate;
	private Date insertedAt;
	private String foodName;
	private String username;
	private String category; // 카테고리 추가
	private String quantity; // 갯수 추가

}
