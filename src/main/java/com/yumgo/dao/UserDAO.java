package com.yumgo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yumgo.model.User;
import com.yumgo.util.DataSource;

public class UserDAO {
	private DataSource dataSource;

	public UserDAO() {
		this.dataSource = new DataSource();
	}

	/**
	 * 사용자 등록
	 */
	public boolean registerUser(User user) {
		String sql = "INSERT INTO USERS (username, id, password, email) VALUES (?, ?, ?, ?)";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getId());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getEmail());

			int result = stmt.executeUpdate();
			return result > 0;

		} catch (SQLException e) {
			System.err.println("사용자 등록 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 아이디 중복 체크
	 */
	public boolean isIdExists(String id) {
		String sql = "SELECT COUNT(*) FROM USERS WHERE id = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1) > 0;
				}
			}
		} catch (SQLException e) {
			System.err.println("아이디 중복 체크 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 사용자명으로 사용자 정보 조회
	 */
	public User getUserByUsername(String username) {
		String sql = "SELECT user_id, username, id, password, email FROM USERS WHERE username = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, username);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					User user = new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setUsername(rs.getString("username"));
					user.setId(rs.getString("id"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					return user;
				}
			}
		} catch (SQLException e) {
			System.err.println("사용자 조회 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * ID로 사용자 정보 조회
	 */
	public User getUserById(String id) {
		String sql = "SELECT user_id, username, id, password, email FROM USERS WHERE id = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					User user = new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setUsername(rs.getString("username"));
					user.setId(rs.getString("id"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					return user;
				}
			}
		} catch (SQLException e) {
			System.err.println("사용자 조회 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 로그인 검증 (사용자명과 이메일로)
	 */
	public boolean validateLogin(String username, String email) {
		User user = getUserByUsername(username);
		return user != null && user.getEmail().equals(email);
	}

	/**
	 * 사용자 정보 업데이트
	 */
	public boolean updateUser(User user) {
		String sql = "UPDATE USERS SET username=?, id=?, password=?, email=? WHERE user_id=?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getId());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getEmail());
			stmt.setInt(5, user.getUser_id());

			int result = stmt.executeUpdate();
			return result > 0;

		} catch (SQLException e) {
			System.err.println("사용자 정보 업데이트 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 사용자 삭제
	 */
	public boolean deleteUser(int userId) {
		String sql = "DELETE FROM USERS WHERE user_id = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setInt(1, userId);
			int result = stmt.executeUpdate();
			return result > 0;

		} catch (SQLException e) {
			System.err.println("사용자 삭제 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 사용자명으로 사용자 삭제
	 */
	public boolean deleteUserByUsername(String username) {
		String sql = "DELETE FROM USERS WHERE username = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, username);
			int result = stmt.executeUpdate();
			return result > 0;

		} catch (SQLException e) {
			System.err.println("사용자 삭제 중 오류 발생: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 비밀번호 조회 (보안상 권장하지 않지만 기존 코드 호환성을 위해)
	 */
	public String getPassword(String userId) {
		String sql = "SELECT password FROM USERS WHERE id = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setString(1, userId);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getString("password");
				} else {
					throw new RuntimeException("아이디가 없습니다.");
				}
			}
		} catch (SQLException e) {
			System.err.println("비밀번호 조회 중 오류 발생: " + e.getMessage());
			throw new RuntimeException(e);
		}
	}
}