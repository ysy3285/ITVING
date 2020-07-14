package com.proj3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomDAO {

	private Connection conn;

	public CustomDAO(Connection conn) {
		this.conn = conn;
	}

	public int insertData(CustomDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into custom (id,pwd,name,email,rank) values (?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getRank());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public CustomDTO getReadData(String usetId) {

		CustomDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select id,pwd,name,email,rank from custom where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, usetId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new CustomDTO();

				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setRank(rs.getString("rank"));

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	public int updateData(CustomDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update custom set pwd=?,email=? where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int rankUpdateData(CustomDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update custom set rank=? where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRank());
			pstmt.setString(2, dto.getId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public int deleteData(String usetId) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete custom where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, usetId);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// 이메일로 아이디 찾기시 사용-------------------------------------------------------------
	public CustomDTO idGetReadData(String email) {

		CustomDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select id,pwd,name,email from custom where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new CustomDTO();

				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

}