package com.proj3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RecordDAO {
	private Connection conn;
	public RecordDAO(Connection conn) {
		this.conn = conn;
	}

	// 영상 클릭시 데이터 입력
	public int insertData(RecordDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {

			sql = "insert into record@link_test (id,vnum,vtitle,ilink,wdate) values (?,?,?,?,TO_CHAR(SYSDATE,'YYYY-MM-DD'))";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getVnum());
			pstmt.setString(3, dto.getVtitle());
			pstmt.setString(4, dto.getIlink());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	// 이미지 링크 가져오기
	public String getImage(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql, sb = null;

		try {

			sql = "select ilink from video@link_test where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				sb = rs.getString("ilink");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return sb;
	}

	// vtitle 가져오기
	public String getVtitle(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql, sb = null;

		try {

			sql = "select vtitle from video@link_test where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				sb = rs.getString("vtitle");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return sb;
	}

	// 찜 영상 리스트 뿌리기
	public List<RecordDTO> getList_heart(String id) {

		List<RecordDTO> rlists = new ArrayList<RecordDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select id,vnum,vtitle,ilink,wdate from record@link_test ";
			sql += "where rownum<6 and id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				RecordDTO dto = new RecordDTO();

				dto.setId(rs.getString("id"));
				dto.setVnum(rs.getInt("vnum"));
				dto.setVtitle(rs.getString("vtitle"));
				dto.setIlink(rs.getString("ilink"));
				dto.setWdate(rs.getString("wdate"));
				
				rlists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return rlists;
	}
	
	// 찜 영상 정보 뿌리기
	public boolean getList_select(String id, int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select id from record@link_test ";
			sql += "where id=? and vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, vnum);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				
				rs.close();
				pstmt.close();
				
				return true;

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return false;
	}
	
	// 찜 영상 정보 삭제하기	
	public int getList_delete(String id, int vnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {

			sql = "delete record@link_test where id=? and vnum=? ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, vnum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

}
