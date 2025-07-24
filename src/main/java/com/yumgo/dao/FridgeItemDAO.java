package com.yumgo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yumgo.model.FridgeItem;
import com.yumgo.util.DataSource;

//import first.FridgeItem;
//import first.DataSource;

public class FridgeItemDAO {
	private DataSource ds = new DataSource();

	// 먹은 음식 삭제: username + foodName 조건으로 삭제
	public int deleteByUsernameAndFoodName(String username, String foodName) {
		String sql = "DELETE FROM FRIDGE_ITEM WHERE USERNAME = ? AND food_name = ?";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, username);
			ps.setString(2, foodName);

			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 유통기한 지난 음식 모두 삭제
	public int deleteExpiredItems() {
		String sql = "DELETE FROM FRIDGE_ITEM WHERE expiration_date < SYSDATE";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int insertFridgeItemAuto(FridgeItem item) {
		String sql = "INSERT INTO FRIDGE_ITEM (fridge_item_id, user_id, food_id, expiration_date, inserted_at, food_name, username) "
				+ "VALUES (fridge_item_seq.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?)";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, item.getUserId());
			if (item.getFoodId() == null) {
				ps.setNull(2, java.sql.Types.INTEGER);
			} else {
				ps.setInt(2, item.getFoodId());
			}
			ps.setDate(3, item.getExpirationDate());
			ps.setString(4, item.getFoodName());
			ps.setString(5, item.getUsername());

			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 현재 냉장고 음식 검색
	public List<FridgeItem> findAll() {
		String sql = "SELECT * FROM FRIDGE_ITEM";
		List<FridgeItem> itemList = new ArrayList<>();

		try (Connection conn = ds.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				FridgeItem item = new FridgeItem();
				item.setUsername(rs.getString("USERNAME"));
				item.setFoodName(rs.getString("food_name"));
				item.setExpirationDate(rs.getDate("expiration_date"));
				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return itemList;
	}

	// 사용자 이름으로 냉장고 음식 조회
	public List<FridgeItem> findByUsername(String username) {
		String sql = "SELECT * FROM FRIDGE_ITEM WHERE USERNAME = ?";
		List<FridgeItem> itemList = new ArrayList<>();

		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, username);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					FridgeItem item = new FridgeItem();
					item.setUsername(rs.getString("USERNAME"));
					item.setFoodName(rs.getString("food_name"));
					item.setExpirationDate(rs.getDate("expiration_date"));
					itemList.add(item);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}
}