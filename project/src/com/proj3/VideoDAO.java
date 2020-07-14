package com.proj3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VideoDAO {

	private Connection conn;

	public VideoDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(vnum), 0) from video ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getMaxNum");
		}

		return maxNum;
	}

	public List<VideoDTO> getList() {

		List<VideoDTO> lists = new ArrayList<VideoDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from ( ";
			sql += "select vnum, vtitle, category, ilink from video ";
			sql += "order by hitCount desc) data ";
			sql += "where rownum<7";

			/*
			 * sql = "select * from ( "; sql += "select rownum rnum, data.* from ( "; sql +=
			 * "select vnum, vtitle, category, ilink "; sql += "from video "; sql +=
			 * "order by vnum) data) "; sql += "where rnum<=6";
			 */

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				VideoDTO dto = new VideoDTO();

				dto.setVnum(rs.getInt("vnum"));
				dto.setVtitle(rs.getString("vtitle"));
				dto.setCategory(rs.getString("category"));
				dto.setIlink(rs.getString("ilink"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getList");
		}

		return lists;
	}
	
	public List<VideoDTO> getList_all(int start, int end) {

		List<VideoDTO> lists = new ArrayList<VideoDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "select * from (select rownum rnum, data.* from ( ";
			sql += "select vnum, vtitle, category, ilink from video ";
			sql += "order by hitCount desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				VideoDTO dto = new VideoDTO();

				dto.setVnum(rs.getInt("vnum"));
				dto.setVtitle(rs.getString("vtitle"));
				dto.setCategory(rs.getString("category"));
				dto.setIlink(rs.getString("ilink"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getList");
		}

		return lists;
	}

	public List<VideoDTO> getList_search(String category) {

		List<VideoDTO> lists = new ArrayList<VideoDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (select rownum rnum, data.* from (";
			sql += "select vnum, vtitle, category, ilink,hitcount from video "; 
			sql += "where category=? "; 
			sql += "order by hitCount desc) data) "; 
			sql += "where rnum>=1 and rnum<=5";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				VideoDTO dto = new VideoDTO();

				dto.setVnum(rs.getInt("vnum"));
				dto.setVtitle(rs.getString("vtitle"));
				dto.setCategory(rs.getString("category"));
				dto.setIlink(rs.getString("ilink"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getList_search");
		}

		return lists;
	}

	public List<VideoDTO> getList_search_all(int start, int end, String category, String searchValue) {

		List<VideoDTO> lists = new ArrayList<VideoDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			category = "%" + category + "%";
			searchValue = "%" + searchValue + "%";
			
			/*if (category.equals("1"))
				category = "게임";
			else if (category.equals("2"))
				category = "드라마";
			else if (category.equals("3"))
				category = "예능";
			else if (category.equals("4"))
				category = "스포츠";
			*/
			
			sql = "select * from (select rownum rnum, data.* from ( ";
			sql += "select vnum, vtitle, category, ilink from video ";
			sql += "where category like ? and vtitle like ? order by vnum desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category);
			pstmt.setString(2, searchValue);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				VideoDTO dto = new VideoDTO();
				
				dto.setVnum(rs.getInt("vnum"));
				dto.setCategory(rs.getString("category"));
				dto.setIlink(rs.getString("ilink"));
				dto.setVtitle(rs.getString("vtitle"));

				lists.add(dto);
			
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getList_search_all");
		}

		return lists;
	}

	public String getVideo(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql, sb = null;

		try {

			sql = "select vlink from video where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				sb = rs.getString("vlink");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getVideo");
		}

		return sb;
	}

	public String getVtitle(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql, sb = null;

		try {

			sql = "select vtitle from video where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				sb = rs.getString("vtitle");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getVtitle");
		}

		return sb;
	}
	
	public String getVcategory(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql, sb = null;

		try {

			sql = "select category from video where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				sb = rs.getString("category");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getVcategory");
		}

		return sb;
	}
	
	public int getHitCount(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int sb = 0;

		try {

			sql = "select hitCount from video where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				sb = rs.getInt("hitCount");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("gethitCount");
		}

		return sb;
	}
	
	public String getWdate(int vnum) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql, sb = null;

		try {

			sql = "select to_char(wdate, 'YYYY. MM. DD.') wdate from video where vnum=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				sb = rs.getString("wdate");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getWdate");
		}

		return sb;
	}
	
	public int updateHitCount(int vnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {

			sql = "update video set hitCount = hitCount + 1 where vnum=? ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vnum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}


	// 전체 데이터 갯수
	public int getDataCount(String category, String searchValue) {

		int dataCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			category = "%" + category + "%";
			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from video ";
			sql += "where category like ? and vtitle like ? "; // count가 null이면 0

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, searchValue);

			rs = pstmt.executeQuery();

			if (rs.next())
				dataCount = rs.getInt(1);

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("getDataCount");
		}

		return dataCount;

	}
	
	//영상 삭제(관리자)
	public int videoDelete(int vnum) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete video where vnum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vnum);
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("videoDelete");
		}
		
		return result;
		
	}
	
	// 영상 업로드(관리자 계정) - 05.26화 수정
	public int videoInsert(VideoDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			System.out.println(dto.getVnum());
			System.out.println(dto.getVtitle());
			System.out.println(dto.getCategory());
			System.out.println(dto.getVlink());
			System.out.println(dto.getIlink());
			
			sql = "insert into video values (?,?,?,?,?,sysdate,0)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getVnum());
			pstmt.setString(2, dto.getVtitle());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getVlink());
			pstmt.setString(5, dto.getIlink());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}


}
