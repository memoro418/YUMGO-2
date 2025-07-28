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

	// 음식 등록
	public int insertFridgeItemAuto(FridgeItem item) {
		String sql = "INSERT INTO FRIDGE_ITEM "
				+ "(fridge_item_id, user_id, food_id, expiration_date, inserted_at, food_name, username, category, quantity) "
				+ "VALUES (fridge_item_seq.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?, ?, ?)";
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
			ps.setString(6, item.getCategory()); // 카테고리 추가
			ps.setString(7, item.getQuantity()); // 갯수 추가

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
				item.setCategory(rs.getString("category")); // 추가
				item.setQuantity(rs.getString("quantity")); // 추가
				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return itemList;
	}

	// 카테고리별 음식 조회
	public List<FridgeItem> findByCategory(String category) {
		String sql = "SELECT * FROM FRIDGE_ITEM WHERE CATEGORY = ?";
		List<FridgeItem> itemList = new ArrayList<>();

		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, category);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					FridgeItem item = new FridgeItem();
					item.setUsername(rs.getString("USERNAME"));
					item.setFoodName(rs.getString("food_name"));
					item.setExpirationDate(rs.getDate("expiration_date"));
					item.setCategory(rs.getString("category"));
					item.setQuantity(rs.getString("quantity"));
					itemList.add(item);
				}
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
					item.setCategory(rs.getString("category"));
					item.setQuantity(rs.getString("quantity"));
					itemList.add(item);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}

	// 사용자 이름 + 카테고리로 냉장고 음식 조회
	public List<FridgeItem> findByUsernameAndCategory(String username, String category) {
		String sql = "SELECT * FROM FRIDGE_ITEM WHERE USERNAME = ? AND CATEGORY = ?";
		List<FridgeItem> itemList = new ArrayList<>();

		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, username);
			ps.setString(2, category);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					FridgeItem item = new FridgeItem();
					item.setUsername(rs.getString("USERNAME"));
					item.setFoodName(rs.getString("food_name"));
					item.setExpirationDate(rs.getDate("expiration_date"));
					item.setCategory(rs.getString("category"));
					item.setQuantity(rs.getString("quantity"));
					itemList.add(item);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemList;
	}

	// 오늘 기준으로 본인의 7일 이내 유통기한 임박 식품 수 조회
	public int countExpiringSoonItemsByUserId(int userId) {
		String sql = "SELECT COUNT(*) FROM FRIDGE_ITEM WHERE USER_ID = ? AND expiration_date BETWEEN SYSDATE AND SYSDATE + 7";
		System.out.println("DAO: countExpiringSoonItemsByUserId 호출, userId=" + userId);

		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			if (conn == null) {
				System.out.println("DAO: DB 커넥션이 null입니다!");
			}

			ps.setInt(1, userId);
			System.out.println("DAO: PreparedStatement에 userId 세팅 완료");

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					int count = rs.getInt(1);
					System.out.println("DAO: 쿼리 결과 count = " + count);
					return count;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 전체 보관 식품 개수 (user_id 기준)
	public int countAllItemsByUserId(int userId) {
		String sql = "SELECT COUNT(*) FROM FRIDGE_ITEM WHERE USER_ID = ?";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 오늘 등록한 식품 개수 (user_id 기준)
	public int countTodayStoredItemsByUserId(int userId) {
		String sql = "SELECT COUNT(*) FROM FRIDGE_ITEM WHERE USER_ID = ? AND TRUNC(inserted_at) = TRUNC(SYSDATE)";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 등록된 모든 식품 개수 (사용자 관계 없음)
	public int countStoredItemsAll() {
		String sql = "SELECT COUNT(*) FROM FRIDGE_ITEM";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int countTodayStoredItems() {
		String sql = "SELECT COUNT(*) FROM FRIDGE_ITEM WHERE TRUNC(inserted_at) = TRUNC(SYSDATE)";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}