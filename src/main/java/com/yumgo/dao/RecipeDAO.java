package com.yumgo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yumgo.model.Recipe;
import com.yumgo.model.RecipeIngredient;
import com.yumgo.util.DataSource;

public class RecipeDAO {
	private DataSource dataSource;

	public RecipeDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// 재료 이름으로 레시피 조회
	public List<Recipe> getRecipesByIngredientName(String ingredientName) throws SQLException {
		String sql = "SELECT DISTINCT r.NAME, r.SUMMARY, r.COOKING_TIME, r.CALORIE, r.IMAGE_PATH "
		           + "FROM RECIPE r JOIN RECIPE_INGREDIENT i ON r.RECIPE_ID = i.RECIPE_ID "
		           + "WHERE i.INGREDIENT_NAME = ?";
		List<Recipe> recipes = new ArrayList<>();
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, ingredientName);
			try (ResultSet rs = pstmt.executeQuery()) {
				
			    // ✅ 컬럼명 전부 출력해보기
			    ResultSetMetaData meta = rs.getMetaData();
			    for (int i = 1; i <= meta.getColumnCount(); i++) {
			        System.out.println(i + " → " + meta.getColumnName(i));
			    }
				while (rs.next()) {
					Recipe r = new Recipe();
					r.setName(rs.getString("NAME"));
					r.setSummary(rs.getString("SUMMARY"));
					r.setCookingTime(rs.getString("COOKING_TIME"));
					r.setCalorie(rs.getString("CALORIE"));
	                r.setImagePath(rs.getString("IMAGE_PATH"));
	                System.out.println(r.getImagePath());
					recipes.add(r);
				}
			}
		}
		return recipes;
	}

	// 레시피 이름으로 재료 조회
	public List<RecipeIngredient> getIngredientsByRecipeName(String recipeName) throws SQLException {
		String sql = "SELECT DISTINCT i.INGREDIENT_NAME "
				+ "FROM RECIPE r JOIN RECIPE_INGREDIENT i ON r.RECIPE_ID = i.RECIPE_ID " + "WHERE r.NAME = ?";
		List<RecipeIngredient> ingredients = new ArrayList<>();
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, recipeName);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					RecipeIngredient ri = new RecipeIngredient();
					ri.setIngredientName(rs.getString("INGREDIENT_NAME"));
					ingredients.add(ri);
				}
			}
		}
		return ingredients;
	}

	// 레시피 이름으로 레시피 삭제 (재료는 cascade FK로 자동 삭제)
	public int deleteRecipeByName(String recipeName) throws SQLException {
		String sql = "DELETE FROM RECIPE WHERE NAME = ?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, recipeName);
			return pstmt.executeUpdate();
		}
	}

	public Recipe getRecipeByName(String recipeName) throws SQLException {
		String sql = "SELECT NAME, SUMMARY, COOKING_TIME, CALORIE, "
				+ "COOKING_STEP1, COOKING_STEP2, COOKING_STEP3, IMAGE_PATH " + "FROM RECIPE WHERE NAME = ?";

		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, recipeName);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					Recipe r = new Recipe();
					r.setName(rs.getString("NAME"));
					r.setSummary(rs.getString("SUMMARY"));
					r.setCookingTime(rs.getString("COOKING_TIME"));
					r.setCalorie(rs.getString("CALORIE"));
					r.setCookingStep1(rs.getString("COOKING_STEP1"));
					r.setCookingStep2(rs.getString("COOKING_STEP2"));
					r.setCookingStep3(rs.getString("COOKING_STEP3"));
					r.setImagePath(rs.getString("IMAGE_PATH"));
					return r;
				} else {
					return null;
				}
			}
		}
	}

	// 전체 레시피 조회
	public List<Recipe> getAllRecipes() throws SQLException {
		String sql = "SELECT NAME, SUMMARY, COOKING_TIME, CALORIE FROM RECIPE";
		List<Recipe> recipes = new ArrayList<>();
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Recipe r = new Recipe();
					r.setName(rs.getString("NAME"));
					r.setSummary(rs.getString("SUMMARY"));
					r.setCookingTime(rs.getString("COOKING_TIME"));
					r.setCalorie(rs.getString("CALORIE"));
					recipes.add(r);
				}
			}
		}
		return recipes;
	}

}
