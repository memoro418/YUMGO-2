package com.yumgo.model;

import lombok.Data;

@Data
public class Recipe {
	private String name;
	private String summary;
	private String cookingTime;
	private String calorie;
	private String imagePath;
	private String cookingStep1;
	private String cookingStep2;
	private String cookingStep3;

}
