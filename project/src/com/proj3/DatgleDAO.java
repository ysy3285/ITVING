package com.proj3;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBCPConn;

public class DatgleDAO {


	Connection conn = DBCPConn.getConnection();

	public DatgleDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() { // num max 값 구하기

		int maxNum=0;

		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;

		try {

			sql = "select nvl(max(dat_num),0) from datgle@link_test";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if(rs.next())
				maxNum = rs.getInt(1); //파생컬럼인 경우는 보통 숫자이용

			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}



	//전체데이터(list.jsp)
	public List<DatgleDTO> getList() {

		List<DatgleDTO> lists = new ArrayList<DatgleDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {


			sql = "select dat_renum,dat_num,dat_id,content,dat_date "
					+ "from datgle@link_test order by dat_num";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				DatgleDTO dto = new DatgleDTO();

				dto.setDat_renum(rs.getInt("dat_renum"));
				dto.setDat_num(rs.getInt("dat_num"));
				dto.setDat_id(rs.getString("dat_id"));
				dto.setContent(rs.getString("content"));
				dto.setDat_date(rs.getString("dat_date"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	public int insertData(DatgleDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into datgle@link_test (dat_renum,dat_num,dat_id,content,dat_date) values (?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getDat_renum());
			pstmt.setInt(2,	dto.getDat_num());
			pstmt.setString(3, dto.getDat_id());
			pstmt.setString(4, dto.getContent());

			result = pstmt.executeUpdate();

			pstmt.close();



		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;


	}


	public int getDataCount() {

		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {


			sql = "select nvl(count(*),0) from datgle@link_test group by dat_renum";

			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setInt(1, dat_renum);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				dataCount = rs.getInt(1);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}
	
	// myDatgle 페이징
	public int getDataCount(String id) {

		int dataCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {


			sql = "select nvl(count(*),0) from datgle@link_test where dat_id=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				dataCount = rs.getInt(1);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dataCount;

	}

	public DatgleDTO getReadData(int dat_num) { 
		
		DatgleDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select dat_renum,dat_num,dat_id,content,dat_date from datgle@link_test where dat_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dat_num);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new DatgleDTO();

				dto.setDat_renum(rs.getInt("dat_renum"));
				dto.setDat_num(rs.getInt("dat_num"));
				dto.setDat_id(rs.getString("dat_id"));
				dto.setContent(rs.getString("content"));
				dto.setDat_date(rs.getString("dat_date"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {

			System.out.println(e.toString());
		}

		return dto; //num에 해당되는 하나의 레코드를 받는 dto 반환

	}

	public int deleteData(int dat_num) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete datgle@link_test where dat_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dat_num);

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}
	
	// 내 댓글 보기
	public List<DatgleDTO> getList_myDatgle(String id,int start, int end){
		List<DatgleDTO> dglists = new ArrayList<DatgleDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {

			sql = "select * from ( ";
			sql += "select rownum rnum,data.* from ( ";
			sql += "select dat_renum,dat_num,content,dat_date "
					+ "from datgle@link_test where dat_id=? order by dat_num desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				DatgleDTO dto = new DatgleDTO();

				dto.setDat_renum(rs.getInt("dat_renum"));
				dto.setDat_num(rs.getInt("dat_num"));
				dto.setContent(rs.getString("content"));
				dto.setDat_date(rs.getString("dat_date"));

				dglists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dglists;
	}



}
