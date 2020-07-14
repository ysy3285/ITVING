package com.proj3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO  {

	private Connection conn;

	public ReviewDAO(Connection conn) {
		this.conn= conn;

	}

	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql="select nvl(max(re_num),0) from review@link_test ";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}

	//게시판 글 넣기
	public int insertData(ReviewDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql="insert into review@link_test (re_num,re_id,category,subject,content,hitCount,cdate,fileName,dat_count) ";
			sql+=" values (?,?,?,?,?,0,sysdate,?,0)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getRe_num());
			pstmt.setString(2, dto.getRe_id());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6,dto.getFileName());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	//게시판 글 리스트
	//review 테이블은 변수들은 R을 앞에 써줌

	public List<ReviewDTO> getList(int Rstart,int Rend,
			String RsearchKey, String RsearchValue) {

		List<ReviewDTO> Rlists = new ArrayList<ReviewDTO>();
		//RLists = ReviewDTO 리스트
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			RsearchValue = "%" + RsearchValue + "%";

			sql= "select * from ( ";
			sql+= "select rownum rnum, data.* from  ";
			sql+= "(select re_num,re_id,category,subject,content,hitCount,TO_char(cdate,'YYYY-MM-DD') cdate,fileName,dat_count from review@link_test where " + RsearchKey+ " like ? order by re_num desc) data) "
				+ "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, RsearchValue);
			pstmt.setInt(2, Rstart);
			pstmt.setInt(3, Rend);

			rs= pstmt.executeQuery();

			while(rs.next()) {

				ReviewDTO dto = new ReviewDTO();

				dto.setRe_num(rs.getInt("re_num"));
				dto.setRe_id(rs.getString("re_id"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCdate(rs.getString("cdate"));
				dto.setFileName(rs.getString("fileName"));
				dto.setDat_count(rs.getInt("dat_count"));
				Rlists.add(dto);
			}

			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Rlists;

	}

	//게시글 전체 게시판 글수 (Review)
	public int getDataCount(String RsearchKey, String RsearchValue) {

		int RdataCount = 0; //review데이터갯수

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			RsearchValue = "%" + RsearchValue + "%";

			sql= "select nvl(count(*),0) from review@link_test ";
			sql+= "where " + RsearchKey + " like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, RsearchValue);

			rs= pstmt.executeQuery();

			if(rs.next()) {

				RdataCount = rs.getInt(1);
			}

			rs.close();
			pstmt.close();	

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return RdataCount;
	}
	
	
	//카테고리별 게시판 글수 (Review)
		public int getCategoryCount(String category) {

			int CdataCount = 0; //review데이터갯수

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {


				sql= "select nvl(count(*),0) from review@link_test ";
				sql+= "where category= ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, category);

				rs= pstmt.executeQuery();

				if(rs.next()) {

					CdataCount = rs.getInt(1);
				}

				rs.close();
				pstmt.close();	

			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return CdataCount;
		}
	
	
	//정보 가져오기 , 게시판 당 댓글 수 도 가져옴
	public ReviewDTO getReadData(int re_num) { 

		ReviewDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql="select re_num,re_id,category,subject,content,hitCount,to_char(cdate,'yyyy-mm-dd') cdate,fileName,dat_count";
			sql+= " from review@link_test where re_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,re_num);

			rs= pstmt.executeQuery();

			if(rs.next()) {

				dto = new ReviewDTO();

				dto.setRe_num(rs.getInt("re_num"));
				dto.setRe_id(rs.getString("re_id"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCdate(rs.getString("cdate"));
				dto.setFileName(rs.getString("fileName"));
				dto.setDat_count(rs.getInt("dat_count"));

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	//카테고리별 검색
	public List<ReviewDTO> getReadCategory(String category,int start,int end) { 

		List<ReviewDTO> cate_list = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "select * from " + 
					"(select rownum rnum, data.* from " + 
					"(select re_num,re_id,category,subject,content,hitCount,to_char(cdate,'yyyy-mm-dd') cdate,fileName,dat_count from review@link_test where category=? order by re_num desc)" + 
					" data) where rnum>=? and rnum<=?";
			


			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,category);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs= pstmt.executeQuery();

			while(rs.next()) {

				ReviewDTO dto = new ReviewDTO();

				dto.setRe_num(rs.getInt("re_num"));
				dto.setRe_id(rs.getString("re_id"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCdate(rs.getString("cdate"));
				dto.setFileName(rs.getString("fileName"));
				dto.setDat_count(rs.getInt("dat_count"));

				cate_list.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return cate_list;

	}

	//게시물 review 조회수 증가 hitCount
	public int updateHitCount(int re_num) {

		int result=0;

		PreparedStatement pstmt = null;

		String sql;

		try {

			sql= "update review@link_test set hitCount = hitCount + 1 where re_num=?";

			pstmt= conn.prepareStatement(sql);

			pstmt.setInt(1,re_num);

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	//게시물 댓글수 증가 dat_count
	public int updateDatCount(int re_num) {

		int result=0;

		PreparedStatement pstmt = null;

		String sql;

		try {

			sql= "update review@link_test set dat_count = dat_count + 1 where re_num=?";

			pstmt= conn.prepareStatement(sql);

			pstmt.setInt(1,re_num);

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//게시물 댓글수 감소 dat_count
	public int downDatCount(int re_num) {

		int result=0;

		PreparedStatement pstmt = null;

		String sql;

		try {

			sql= "update review@link_test set dat_count = dat_count - 1 where re_num=?";

			pstmt= conn.prepareStatement(sql);

			pstmt.setInt(1,re_num);

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}



	// 게시물 수정

	public int updateData(ReviewDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql= "update review@link_test set category=?,subject=?,content=?,fileName=?";
			sql+= " where re_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4,dto.getFileName());
			pstmt.setInt(5,dto.getRe_num());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	//게시물 삭제 

	public int deleteData(int re_num) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql= "delete review@link_test where re_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1,re_num);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}
	
	//공지 글 가져오기
	public List<ReviewDTO> noticeData(String category) { 

		List<ReviewDTO> note_list = new ArrayList<ReviewDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql="select re_num,re_id,category,subject,content,hitCount,to_char(cdate,'yyyy-mm-dd') cdate,fileName,dat_count";
			sql+= " from review@link_test where category=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,category);
		

			rs= pstmt.executeQuery();

			while(rs.next()) {

				ReviewDTO dto = new ReviewDTO();

				dto.setRe_num(rs.getInt("re_num"));
				dto.setRe_id(rs.getString("re_id"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCdate(rs.getString("cdate"));
				dto.setFileName(rs.getString("fileName"));
				dto.setDat_count(rs.getInt("dat_count"));

				note_list.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return note_list;

	}
	
	// 마이페이지 내 글 보기
		public List<ReviewDTO> getList_myBoard(String id,int start,int end){
			List<ReviewDTO> mblists = new ArrayList<ReviewDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				sql = "select * from ( ";
				sql += "select rownum rnum, data.* from ( ";
				sql += "select re_num,re_id,category,subject,content,hitCount,TO_char(cdate,'YYYY-MM-DD') cdate,fileName,dat_count ";
				sql+= "from review@link_test where re_id=? order by re_num desc) data) ";
				sql += "where rnum>=? and rnum<=?";
				
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, id);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {

					ReviewDTO dto = new ReviewDTO();

					dto.setRe_num(rs.getInt("re_num"));
					dto.setRe_id(rs.getString("re_id"));
					dto.setCategory(rs.getString("category"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setHitCount(rs.getInt("hitCount"));
					dto.setCdate(rs.getString("cdate"));
					dto.setFileName(rs.getString("fileName"));
					dto.setDat_count(rs.getInt("dat_count"));
					
					mblists.add(dto);
				}

				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return mblists;
		}
		
		
		// myBoard 페이징
		public int getDataCount(String id) {

			int RdataCount = 0; //review데이터갯수

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {

				

				sql= "select nvl(count(*),0) from review@link_test ";
				sql+= "where re_id=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, id);

				rs= pstmt.executeQuery();

				if(rs.next()) {

					RdataCount = rs.getInt(1);
				}

				rs.close();
				pstmt.close();	

			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return RdataCount;
		}
		
		
}
