package com.proj3;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBCPConn;
import com.util.FileManager;
import com.util.MyUtil;

public class CustomServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn = DBCPConn.getConnection();
		CustomDAO cdao = new CustomDAO(conn);
		VideoDAO vdao = new VideoDAO(conn);
		RecordDAO rdao = new RecordDAO(conn);
		ReviewDAO rvdao = new ReviewDAO(conn); //게시물 DB
		DatgleDAO ddao = new DatgleDAO(conn); // 댓글 DB

		String uri = req.getRequestURI();
		String url;

		MyUtil myUtil = new MyUtil();

		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "imageFile";

		String board_path = root + File.separator + "pds" + File.separator + "boardFile";
		File f = new File(board_path);

		if(f.exists())
			f.mkdirs();

		if (uri.indexOf("signUp.do") != -1) { // 회원가입 페이지

			url = "/proj3/signUp.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("signUp_ok.do") != -1) { // 회원가입 처리

			CustomDTO dto = null;

			String id = req.getParameter("id");

			dto = cdao.getReadData(id);

			if (dto != null) {
				req.setAttribute("message", "이미 사용중인 아이디입니다.");
				url = "/proj3/signUp.jsp";
				forward(req, resp, url);
				return;
			}

			dto = new CustomDTO();

			dto.setId(id);
			dto.setPwd(req.getParameter("pwd"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setRank("일반");

			cdao.insertData(dto);

			url = cp + "/itving/hello.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("hello.do") != -1) {

			url = "/proj3/hello.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login.do") != -1) { // 로그인 페이지

			url = "/proj3/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login_ok.do") != -1) { // 로그인 처리

			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");

			CustomDTO dto = cdao.getReadData(id);

			if (dto == null || !dto.getPwd().equals(pwd)) {
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요.");
				url = "/proj3/login.jsp";
				forward(req, resp, url);
				return;
			}

			HttpSession session = req.getSession(); // 세션 만들기

			CustomInfo info = new CustomInfo();

			info.setId(dto.getId());
			info.setName(dto.getName());
			info.setRank(dto.getRank());

			session.setAttribute("customInfo", info); // 세션에 올리기

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("logout_ok.do") != -1) { // 로그아웃

			HttpSession session = req.getSession();

			session.removeAttribute("customInfo"); // 세션에 있는 데이터 삭제
			session.invalidate();

			url = cp + "/itving/firstPage.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("findId.do") != -1) { // 아이디 찾기 페이지

			url = "/proj3/findId.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("findId_ok.do") != -1) { // 아이디 찾기 처리

			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");

			CustomDTO dto = cdao.idGetReadData(email);

			if (dto == null || !dto.getPwd().equals(pwd)) {
				req.setAttribute("message", "이메일 또는 패스워드를 정확히 입력하세요.");
				url = "/proj3/findId.jsp";
				forward(req, resp, url);
				return;
			}

			req.setAttribute("message", "아이디는 [" + dto.getId() + "] 입니다.");
			url = "/proj3/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("findPwd.do") != -1) { // 비번찾기 페이지

			url = "/proj3/findPwd.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("findPwd_ok.do") != -1) { // 비번찾기 처리

			String id = req.getParameter("id");
			String email = req.getParameter("email");

			CustomDTO dto = cdao.getReadData(id);

			if (dto == null || !dto.getEmail().equals(email)) {
				req.setAttribute("message", "아이디 또는 이메일을 정확히 입력하세요.");
				url = "/proj3/findPwd.jsp";
				forward(req, resp, url);
				return;

			}

			String senderName = "ITving";
			String senderEmail = "ITving@itiving.com";
			String receiverEmail = email;
			String subject = "ITving 회원님의 비밀번호";
			String content = "회원님의 비밀번호는 [" + dto.getPwd() + "] 입니다.";

			String host = "localhost";

			Properties prop = System.getProperties();
			Session ssn = Session.getInstance(prop, null);

			try {

				MimeMessage message = new MimeMessage(ssn);
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));

				message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));

				message.setSubject(subject, "UTF-8");

				message.setContent(content, "text/plain;charset=UTF-8");

				Transport tp = ssn.getTransport("smtp");
				tp.connect(host, "", ""); // ip,id,pw
				tp.sendMessage(message, message.getAllRecipients());
				tp.close();

			} catch (Exception e) {
				System.out.print(e.toString());
			}

			req.setAttribute("message", "입력한 이메일의 메일함을 확인해 주세요.");
			url = "/proj3/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("myPage.do") != -1) { // 마이페이지

			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getId();
			
			String rank = "[" + cdao.getReadData(info.getId()).getRank() + "]";

			List<RecordDTO> rlists = rdao.getList_heart(id);
			String imagePath = cp + "/pds/imageFile";
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("rlists", rlists);
			req.setAttribute("rank", rank);

			url = "/proj3/myPage.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("myBoard.do") != -1) { // 마이페이지_내글보기
			//넘어온 페이지 번호(myUtil, article.jsp)
			String pageNum = req.getParameter("pageNum");
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getId();
			String rank = "["+info.getRank()+"]";
			
			int currentPage = 1; //현재페이지

			if(pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum="1"; //처음 1페이지에서 있는 내용을 들어갔다 나올때 에러 발생할 것을 대비
			}

			//전체데이터 구하기
			int dataCount = rvdao.getDataCount(id);

			//한페이지에 표시할 데이터 갯수
			int numPerPage = 5;

			//전체페이지의 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//데이터를 삭제해서 페이지가 줄었을 때
			if(currentPage > totalPage) {
				currentPage = totalPage;
			}


			//가져올 데이터의 시작과 끝
			int start = (currentPage-1)*numPerPage+1; // currentPage==1 인경우 start ==1
			int end = currentPage*numPerPage; //end==3
			
			String param="";
			


			//페이징처리
			String listUrl = "myBoard.do" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			//글내용보기 주소정리
			String articleURL = cp + "/itving/boardarticle.do";
			

			if(param.equals("")) { //검색 안했을 때
				articleURL += "?pageNum=" + currentPage;
			} else {
				articleURL += param + "&pageNum=" + currentPage;
			}
			
			
			
			List<ReviewDTO> mblists = rvdao.getList_myBoard(id,start,end);
			
			req.setAttribute("mblists", mblists);
			req.setAttribute("articleURL", articleURL);
			req.setAttribute("rank", rank);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			
			url = "/proj3/myBoard.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("myDatgle.do") != -1) { // 마이페이지_내글보기
			String pageNum = req.getParameter("pageNum");
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getId();
			String rank = "["+info.getRank()+"]";
			String articleURL = cp + "/itving/boardarticle.do";
			
			int currentPage = 1; //현재페이지

			if(pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum="1"; //처음 1페이지에서 있는 내용을 들어갔다 나올때 에러 발생할 것을 대비
			}

			//전체데이터 구하기
			int dataCount = ddao.getDataCount(id);

			//한페이지에 표시할 데이터 갯수
			int numPerPage = 5;

			//전체페이지의 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//데이터를 삭제해서 페이지가 줄었을 때
			if(currentPage > totalPage) {
				currentPage = totalPage;
			}


			//가져올 데이터의 시작과 끝
			int start = (currentPage - 1) * numPerPage + 1; // currentPage==1 인경우 start ==1
			int end = currentPage * numPerPage; //end==3
			
			String param="";
			
			//페이징처리
			String listUrl = "myDatgle.do" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);


			if(param.equals("")) { //검색 안했을 때
				articleURL += "?pageNum=" + currentPage;
			} else {
				articleURL += param + "&pageNum=" + currentPage;
			}
			
			List<DatgleDTO> dglists = ddao.getList_myDatgle(id,start,end);
			
			req.setAttribute("dglists", dglists);
			req.setAttribute("articleURL", articleURL);
			req.setAttribute("rank", rank);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			
			url = "/proj3/myDatgle.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("pwCheck.do") != -1) {

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			CustomDTO dto = cdao.getReadData(info.getId());
			req.setAttribute("dto", dto);
			
			url = "/proj3/pwCheck.jsp";
			forward(req, resp, url);

		}

		else if (uri.indexOf("customUpdate.do") != -1) { // 수정하기

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			CustomDTO dto = cdao.getReadData(info.getId());

			req.setAttribute("dto", dto);

			url = "/proj3/customUpdate.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("customUpdate_ok.do") != -1) { // 회원 수정

			CustomDTO dto = new CustomDTO();

			dto.setId(req.getParameter("id"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setEmail(req.getParameter("email"));

			cdao.updateData(dto);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("rankUpdate_ok1.do") != -1) { // 회원 수정
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			CustomDTO dto = cdao.getReadData(info.getId());

			dto.setRank("아이티빙 무제한");
			info.setRank(dto.getRank());

			cdao.rankUpdateData(dto);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("rankUpdate_ok2.do") != -1) { // 회원 수정

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			CustomDTO dto = cdao.getReadData(info.getId());

			dto.setRank("무비 프리미엄");
			info.setRank(dto.getRank());

			cdao.rankUpdateData(dto);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("customDelete.do") != -1) { // 회원 탈퇴 페이지

			url = "/proj3/customDelete.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("customDelete_ok.do") != -1) { // 회원 탈퇴 처리

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			CustomDTO dto = cdao.getReadData(info.getId());

			String id = dto.getId();
			String pwd = req.getParameter("pwd");

			if (dto == null || !dto.getPwd().equals(pwd)) {
				req.setAttribute("message", "비밀번호를 정확히 입력하세요.");
				url = "/proj3/customDelete.jsp";
				forward(req, resp, url);
				return;

			}

			cdao.deleteData(id);

			session.removeAttribute("customInfo"); // 세션에 있는 데이터 삭제
			session.invalidate();

			url = cp + "/itving/goodbye.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("goodbye.do") != -1) {

			url = "/proj3/goodbye.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("heart.do") != -1) { // 하트 버튼 누를 시 데이터 insert
			
			String category = req.getParameter("category");			// 카테고리명
			String pageNum = req.getParameter("pageNum");			// 페이지 번호(myUtil)
			String searchValue = req.getParameter("searchValue");	// 검색 기록
			String param = "";
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			RecordDTO dto = null;
			String id = info.getId();
			int vnum = Integer.parseInt(req.getParameter("vnum"));
			String vtitle = rdao.getVtitle(vnum);
			String ilink = rdao.getImage(vnum);

			if(category != null && !category.equals("")) {
				param += "&category=" + URLEncoder.encode(category, "UTF-8");
			}

			if(pageNum != null && !pageNum.equals("") && !pageNum.equals("0")) {
				param += "&pageNum=" + pageNum;
			}
			
			if(searchValue != null && !searchValue.equals(""))
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			dto = new RecordDTO();

			dto.setId(id);
			dto.setVnum(vnum);
			dto.setVtitle(vtitle);
			dto.setIlink(ilink);

			if(info!=null) {
				rdao.insertData(dto);
			}

			url = cp + "/itving/playVideo.do?vnum=" + vnum + param;
			resp.sendRedirect(url);

		} else if(uri.indexOf("heart_drop.do")!=-1) { // 하트 버튼 누를 시 데이터 insert
			
			String category = req.getParameter("category");			// 카테고리명
			String pageNum = req.getParameter("pageNum");			// 페이지 번호(myUtil)
			String searchValue = req.getParameter("searchValue");	// 검색 기록
			String param = "";

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			int vnum = Integer.parseInt(req.getParameter("vnum"));
			
			if(category != null && !category.equals("")) {
				param += "&category=" + URLEncoder.encode(category, "UTF-8");
			}

			if(pageNum != null && !pageNum.equals("") && !pageNum.equals("0")) {
				param += "&pageNum=" + pageNum;
			}
			
			if(searchValue != null && !searchValue.equals(""))
				param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			if(info!=null) {
				rdao.getList_delete(info.getId(), vnum);
			}

			url = cp + "/itving/playVideo.do?vnum=" + vnum + param;
			resp.sendRedirect(url);

		} else if (uri.indexOf("firstPage.do") != -1) {

			url = "/proj3/firstPage.jsp";
			forward(req, resp, url);

			// Video------------------------------------------------------------------------------------------
		} else if (uri.indexOf("main.do") != -1) { // 메인페이지

			// 2020.05.26 listUrl 추가
			String listUrl = "videoList.do";

			List<VideoDTO> lists = vdao.getList();
			List<VideoDTO> lists_A = vdao.getList_search("게임");
			List<VideoDTO> lists_B = vdao.getList_search("드라마");
			List<VideoDTO> lists_C = vdao.getList_search("예능");
			List<VideoDTO> lists_D = vdao.getList_search("스포츠");
			List<VideoDTO> lists_E = vdao.getList_search("영화");

			String imagePath = cp + "/pds/imageFile";

			req.setAttribute("imagePath", imagePath);
			req.setAttribute("lists", lists);
			req.setAttribute("lists_A", lists_A);
			req.setAttribute("lists_B", lists_B);
			req.setAttribute("lists_C", lists_C);
			req.setAttribute("lists_D", lists_D);
			req.setAttribute("lists_E", lists_E);

			req.setAttribute("listUrl", listUrl);

			url = "/proj3/main.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("playVideo.do") != -1) { // 영상 시청 페이지
			
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			// 2020.05.26 추가
			String category = req.getParameter("category");			// 카테고리명
			String pageNum = req.getParameter("pageNum");			// 페이지 번호(myUtil)
			String searchValue = req.getParameter("searchValue");	// 검색 기록
			int vnum = Integer.parseInt(req.getParameter("vnum"));	// 영상 번호
			String listUrl = "videoList.do";						// 검색창
			String backUrl = "";									// 돌아가기창
			String heartUrl = "";									// 찜하기창
			String param = "";
			String vcheck = null;									// 찜하기 확인

			if(category != null) {
				param += "?category=" + URLEncoder.encode(category, "UTF-8");
				listUrl += param;
			}

			if(pageNum != null && !pageNum.equals("") && !pageNum.equals("0")) {
				if(param.equals(""))
					param += "?pageNum=" + pageNum;
				else
					param += "&pageNum=" + pageNum;
			}

			if (info != null) {
				if (rdao.getList_select(info.getId(), vnum) == true) {
					vcheck = "있음";
					heartUrl = cp + "/itving/heart_drop.do";
				} else {
					vcheck = "없음";
					heartUrl = cp + "/itving/heart.do";
				}
			}
			
			if(category != null && (searchValue != null && !searchValue.equals(""))) {
				backUrl = "videoList.do" + param + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
				heartUrl += param + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			} else if(category != null && !category.equals("")) {
				backUrl = "videoList.do" + param;
				heartUrl += param;
			} else if(searchValue != null && !searchValue.equals("")) {
				backUrl = "videoList.do" + param + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
				heartUrl += param + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			} else if(pageNum != null && !pageNum.equals("")) {
				backUrl = "videoList.do" + param;
				heartUrl += param;
			} else {
				backUrl = "main.do";
			}

			String ilink = req.getParameter("ilink");
			String video = vdao.getVideo(vnum);
			String vtitle = vdao.getVtitle(vnum);
			String vcategory = vdao.getVcategory(vnum);
			vdao.updateHitCount(vnum);
			int hitCount = vdao.getHitCount(vnum);
			String wdate = vdao.getWdate(vnum);
			
			if(param.equals(""))
				heartUrl += "?";
			else
				heartUrl += "&";

			List<VideoDTO> lists_A = vdao.getList_search("게임");
			List<VideoDTO> lists_B = vdao.getList_search("드라마");
			List<VideoDTO> lists_C = vdao.getList_search("예능");
			List<VideoDTO> lists_D = vdao.getList_search("스포츠");
			List<VideoDTO> lists_E = vdao.getList_search("영화");

			String imagePath = cp + "/pds/imageFile";

			req.setAttribute("imagePath", imagePath);
			req.setAttribute("vnum", vnum);
			req.setAttribute("video", video);
			req.setAttribute("vtitle", vtitle);
			req.setAttribute("vcategory", vcategory);
			req.setAttribute("lists_A", lists_A);
			req.setAttribute("lists_B", lists_B);
			req.setAttribute("lists_C", lists_C);
			req.setAttribute("lists_D", lists_D);
			req.setAttribute("lists_E", lists_E);
			req.setAttribute("listUrl", listUrl);
			req.setAttribute("ilink", ilink);
			req.setAttribute("backUrl", backUrl);
			req.setAttribute("heartUrl", heartUrl);
			req.setAttribute("hitCount", hitCount);
			req.setAttribute("wdate", wdate);
			req.setAttribute("vcheck", vcheck);

			url = "/proj3/playVideo.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("videoList.do") != -1) { // 영상 리스트 페이지 (검색,페이징) 2020.05.26 수정

			String category = req.getParameter("category");			// 카테고리명
			String pageNum = req.getParameter("pageNum");			// 페이지 번호(myUtil)
			String searchValue = req.getParameter("searchValue");	// 검색창

			int currentPage = 1; // 안넘어오면 1페이지를 불러옴

			if (pageNum != null && !pageNum.equals("0")) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum = "1";
			}

			// 2020.05.26 전체 검색 추가
			if (category == null || category.equals("")) 	
				category = "";

			/*
			if(category.equals("1"))
				category = "게임";
			else if(category.equals("2"))
				category = "드라마";
			else if(category.equals("3"))
				category = "예능";
			else if(category.equals("4"))
				category = "스포츠";
			 */

			if (searchValue != null) { // 검색을 했을때

				if (req.getMethod().equalsIgnoreCase("GET")) { // 검색창에 한글을 입력했을떄 디코딩 하지않으면 깨져서 넘어감
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			} else { // 검색을 안했을때

				searchValue = "";

			}
			// 검색------------------------------------------

			// 전체 데이터 구하기
			int dataCount = vdao.getDataCount(category, searchValue); // 10

			// 한 페이지에 표시할 데이터 갯수
			int numPerPage = 15;

			// 전체 페이지의 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount); // 4

			// 데이터를 삭제해서 페이지가 줄었을 때 처리
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			// 가져올 데이터 시작과 끝 지정
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<VideoDTO> lists = vdao.getList_search_all(start, end, category, searchValue);
			
			if ((category == null || category.equals("")) && (searchValue == null || searchValue.equals(""))) 	
				lists = vdao.getList_all(start, end);

			String param = "";
			if (!searchValue.equals("")) { // 검색을 했을때

				param = "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			// 페이징 처리
			String listUrl = "videoList.do?category=" + URLEncoder.encode(category, "UTF-8") + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			// 영상 내용보기 주소정리
			String playVideoUrl = cp + "/itving/playVideo.do?category=" + URLEncoder.encode(category, "UTF-8");
			if (param.equals("")) { // 검색 안했을때
				playVideoUrl += "&pageNum=" + currentPage;
			} else { // 검색 했을때
				playVideoUrl += "&pageNum=" + currentPage + param;
			}

			// 검색창 처리
			listUrl = "videoList.do?category=" + URLEncoder.encode(category, "UTF-8");
			String imagePath = cp + "/pds/imageFile";

			// 2020.05.26 전체 검색 추가
			if (category == null || category.equals(""))
				category = "검색";

			// 포워딩할 데이터
			req.setAttribute("category", category);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("lists", lists);
			req.setAttribute("listUrl", listUrl);
			req.setAttribute("playVideoUrl", playVideoUrl);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);

			url = "/proj3/videoList.jsp";
			forward(req, resp, url);

			// Video------------------------------------------------------------------------------------------

		} else if(uri.indexOf("pass.do") != -1) {
			
			url = "/proj3/pass.jsp";
			forward(req, resp, url);
			
		} else if(uri.indexOf("popup1.do") != -1) {

			url = "/proj3/popup1.jsp";
			forward(req, resp, url);
			
		} else if(uri.indexOf("popup2.do") != -1) {

			url = "/proj3/popup2.jsp";
			forward(req, resp, url);
			
		} else if(uri.indexOf("pay1.do") != -1) {
			
			url = "/proj3/pay1.jsp";
			forward(req, resp, url);
			
		} else if(uri.indexOf("pay2.do") != -1) {
			
			url = "/proj3/pay2.jsp";
			forward(req, resp, url);
			
		} else if (uri.indexOf("videoUpload.do") != -1) { // 영상 업로드(관리자 계정) - 05.26화 수정

			url = "/proj3/videoUpload.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("videoUpload_ok.do") != -1) { // 영상 업로드(관리자 계정) - 05.26화 수정

			String encType = "UTF-8";
			int maxSize = 10 * 1024 * 1024;

			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());

			if (mr.getFile("ilink") != null) { // 업로드된 파일이 있으면

				int maxNum = vdao.getMaxNum();

				VideoDTO dto = new VideoDTO();

				dto.setVnum(maxNum + 1);
				dto.setCategory(mr.getParameter("category"));
				dto.setVtitle(mr.getParameter("vtitle"));
				dto.setVlink(mr.getParameter("vlink"));
				dto.setIlink(mr.getParameter("ilink"));
				dto.setIlink(mr.getFilesystemName("ilink"));

				vdao.videoInsert(dto);

			}

			url = cp + "/itving/videoUpload.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("videoDelete_ok.do") != -1) { // 영상 삭제(관리자 계정) - 05.26화 수정

			int vnum = Integer.parseInt(req.getParameter("vnum"));

			String ilink = req.getParameter("ilink");

			// 파일삭제
			FileManager.doFileDelete(ilink, path);

			vdao.videoDelete(vnum);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);
		
		
			
		// ============================== 커뮤니티 게시판 ==============================

		}	else if(uri.indexOf("boardcreated.do")!=-1) { //게시판 글쓰기

				/*
				HttpSession session = req.getSession();

				CustomInfo info = (CustomInfo)session.getAttribute("customInfo");

				if(info==null) {

					url = "/member/login.jsp";
					forward(req, resp, url);
					return;

				}*/
				
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
				String id = info.getId();
				String name = info.getName();
				
				req.setAttribute("id", id);
				req.setAttribute("name", name);
		

				url =  "/itflexBoard/boardcreated.jsp"; // url이 created.do이면 /bbs/created.jsp(진짜경로)로 읽도록한다. 화면에는 created.jsp가 나오나 주소는 created.do로 나온다

				forward(req, resp, url); //포워드를 해준다. 포워드할때는 진짜 주소url 쓴다.

			}else if(uri.indexOf("boardcreated_ok.do")!=-1) { //게시판 생성

				ReviewDTO rdto = null;

				String encType ="UTF-8";

				//int maxNum = rvdao.getMaxNum();
				int maxSize = 30*1024*1024;

				MultipartRequest mr = new MultipartRequest(req, board_path, maxSize,encType);
				
				int maxNum = rvdao.getMaxNum();
				if(mr.getFile("fileName")!=null) {

					rdto = new ReviewDTO();

					rdto.setRe_num(maxNum +1);
					rdto.setRe_id(mr.getParameter("re_id"));
					rdto.setSubject(mr.getParameter("subject"));
					rdto.setContent(mr.getParameter("content"));
					rdto.setCategory(mr.getParameter("category"));
					rdto.setFileName(mr.getFilesystemName("fileName"));
					rvdao.insertData(rdto);

				}else {
					
					rdto = new ReviewDTO();
					
					rdto.setRe_num(maxNum +1);
					rdto.setRe_id(mr.getParameter("re_id"));
					rdto.setSubject(mr.getParameter("subject"));
					rdto.setContent(mr.getParameter("content"));
					rdto.setCategory(mr.getParameter("category"));
					rvdao.insertData(rdto);
					
				}

				/*
				 * System.out.println(mr.getParameter("re_id") + "," +
				 * mr.getParameter("subject") + "," + mr.getParameter("content") + "," +
				 * mr.getParameter("category"));
				 */
				
				url = cp + "/itving/boardlist.do";

				resp.sendRedirect(url);

			}else if(uri.indexOf("boardlist.do")!=-1) { // 게시판 목록


				String pageNum = req.getParameter("pageNum");
				String c_pageNum = req.getParameter("c_pageNum");
				
				
				int currentPage = 1;
				int c_currentPage = 1;

				if(pageNum != null){
					currentPage = Integer.parseInt(pageNum);
				}else{
					pageNum="1"; 
				}
				
				if(c_pageNum != null && !c_pageNum.equals("")){
					c_currentPage = Integer.parseInt(c_pageNum);
				}else{
					c_pageNum="1"; 
				}
				

				//검색--------------------------------------------------------
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");
				

				if(searchValue!=null){ //검색을 했을 때

					if(req.getMethod().equalsIgnoreCase("GET")){
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); 
					}														   


				}else { //검색 안했을 때

					searchKey="subject";
					searchValue="";

				}
				
				String category = req.getParameter("category");
				
				
				//-------------------------------------------------------------
				

				//전체데이터 구하기
				int dataCount = rvdao.getDataCount(searchKey,searchValue);
				int categoryCount = rvdao.getCategoryCount(category);

				//한페이지에 표시할 데이터 갯수
				int numPerPage = 10;

				//전체페이지의 갯수
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);
				int cate_totalPage = myUtil.getPageCount(numPerPage, categoryCount);

				//데이터를 삭제해서 페이지가 줄었을 때
				if(currentPage > totalPage){
					currentPage = totalPage;
				}
				
				if(c_currentPage > cate_totalPage){
					c_currentPage = cate_totalPage;
				}


				//가져올 데이터의 시작과 끝
				int start = (currentPage-1)*numPerPage+1; // currentPage==1 인경우 start ==1
				int end = currentPage*numPerPage; //end==3
				
				int c_start = (c_currentPage-1)*numPerPage+1; // currentPage==1 인경우 start ==1
				int c_end = c_currentPage*numPerPage; //end==3
				

				List<ReviewDTO> lists = rvdao.getList(start,end,searchKey,searchValue);//searchKey와 searchValue를 받아서 출력을 해준다.
				//검색을 안할때에는 searchKey="subject",searchValue=null로 해서 검색
				
				List<ReviewDTO> cate_list = rvdao.getReadCategory(category,c_start,c_end); //카테고리로 검색
				
				List<ReviewDTO> note_list = rvdao.noticeData("notice");
				
				String param="";

				if(!searchValue.equals("")){ //검색하면

					param = "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8"); //param을 이용해 주소에 searchKey,searchValue를 가지고 갈 수 있도록 한다

				}
				

				//페이징처리
				String listUrl = "boardlist.do" + param;
				String c_listUrl = "boardlist.do?category="+category;
				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
				String c_pageIndexList = myUtil.pageCateList(c_currentPage, cate_totalPage, c_listUrl);

				//글내용보기 주소정리
				String articleURL = cp + "/itving/boardarticle.do";

				if(param.equals("")){ //검색 안했을 때
					articleURL += "?pageNum=" + currentPage;
				}else {
					articleURL += param + "&pageNum=" + currentPage;
				}

				
				//아이디 받기
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
				String id = info.getId(); //▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶▶  자바 수정하면 에러 잘뜬다~~
				String name = info.getName();
				
				req.setAttribute("id", id);
				req.setAttribute("name", name);

				//포워딩할 데이터
				req.setAttribute("cate_list", cate_list);
				req.setAttribute("category", category);
				req.setAttribute("lists", lists); //데이터들이 들어있는 리스트 (페이지에 num,name,subject등 보이는 것들)
				req.setAttribute("note_list", note_list);
				req.setAttribute("articleURL", articleURL);
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("c_pageIndexList", c_pageIndexList);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("categoryCount", categoryCount);


				url = "/itflexBoard/boardlist.jsp"; //진짜 처리해주는 jsp주소

				forward(req, resp, url); // 포워딩

			}else if(uri.indexOf("boardarticle.do")!=-1) { //게시판 글 내용 보기
				//게시글에 들어가면
				
				int re_num = Integer.parseInt(req.getParameter("re_num")); 
				String pageNum =  req.getParameter("pageNum");

				//int dat_renum = Integer.parseInt(req.getParameter("dat_renum")); //article.jsp에서 넘긴 re_num을 받는다

				//검색--------------------------------------------------------
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				if(searchValue!=null){ //검색을 했을 때

					if(req.getMethod().equalsIgnoreCase("GET")){
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); //입력받은 것은 무엇이든 인코딩되어있을 것이다
					}														   //따라서 디코딩을 해준다


				}else { //검색 안했을 때

					searchKey="subject";
					searchValue="";

				}
				//-------------------------------------------------------------

				//조회수 증가
				rvdao.updateHitCount(re_num);


				//가져오기
				ReviewDTO rdto = rvdao.getReadData(re_num);
				
				//다음게시물, 이전게시물 //게시물 다음번호, 이전번호로 가져오기
				int next_re_num = re_num+1;
				int previous_re_num = re_num-1;
				ReviewDTO next_rdto = rvdao.getReadData(next_re_num);
				ReviewDTO previous_rdto = rvdao.getReadData(previous_re_num);
				
				if(rdto==null){
					url = cp + "/itving/boardlist.do";
					resp.sendRedirect(url);
				}
				
				String imagePath = cp + "/pds/boardFile";

				//글 라인수
				//int lineSu = rdto.getContent().split("\n").length;//한줄띄어쓰는 양을 저장

				//글 내용의 엔터를 <br/>로 변환
				rdto.setContent(rdto.getContent().replaceAll("\n", "<br/>"));

				String param="pageNum="+pageNum;
				if(!searchValue.equals("")){ //검색하면

					param += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");

				}
				

				List<DatgleDTO> dlists = ddao.getList();
				
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
				String id = info.getId();
				String name = info.getName();
				
				req.setAttribute("id", id);
				req.setAttribute("name", name);
				
				
				req.setAttribute("imagePath", imagePath);
				req.setAttribute("dlists", dlists);
				req.setAttribute("rdto", rdto);
				req.setAttribute("next_rdto", next_rdto);
				req.setAttribute("previous_rdto", previous_rdto);
				req.setAttribute("pageNum", pageNum);
				req.setAttribute("params", param); //param을 쓰면 servlet에서는 자기방식대로 데이터를 담는다 { } 안에 담는다

				url = "/itflexBoard/boardarticle.jsp"; 
				forward(req, resp, url);

			}else if(uri.indexOf("boarddeleted_ok.do")!=-1) { //게시물 삭제 

				int re_num = Integer.parseInt(req.getParameter("re_num"));
				String pageNum = req.getParameter("pageNum");

				//검색--------------------------------------------------------
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				if (searchValue != null) { //검색을 했을 때

					if (req.getMethod().equalsIgnoreCase("GET")) {
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); //입력받은 것은 무엇이든 인코딩되어있을 것이다
					} //따라서 디코딩을 해준다

				} else { //검색 안했을 때

					searchKey = "subject";
					searchValue = "";

				}
				//-------------------------------------------------------------

				rvdao.deleteData(re_num);

				String params = "pageNum=" + pageNum;

				if (searchValue != null) { //검색하면

					params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardlist.do?" + params;
				resp.sendRedirect(url);


			}else if(uri.indexOf("boardupdated.do")!=-1) { //게시물 수정

				int re_num = Integer.parseInt(req.getParameter("re_num"));
				String pageNum = req.getParameter("pageNum");

				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				if(searchValue!= null && !searchValue.equals("")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

				ReviewDTO rdto = rvdao.getReadData(re_num);

				if(rdto==null) {

					url = cp + "/itving/boardlist.do";
					resp.sendRedirect(url);

				}

				String param = "pageNum=" + pageNum;

				if(searchValue!=null && !searchValue.equals("")) {
					param += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}
				
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
				String id = info.getId();
				String name = info.getName();
				
				req.setAttribute("id", id);
				req.setAttribute("name", name);

				req.setAttribute("rdto", rdto);
				req.setAttribute("pageNum", pageNum);
				req.setAttribute("params", param);
				req.setAttribute("searchKey", searchKey);
				req.setAttribute("searchValue", searchValue);

				url = "/itflexBoard/boardupdated.jsp";
				forward(req, resp, url);

			}else if(uri.indexOf("boardupdated_ok.do")!=-1) { // 게시물 수정 ok
				
				String encType ="UTF-8";

				//int maxNum = rvdao.getMaxNum();
				int maxSize = 30*1024*1024;

				MultipartRequest mr = new MultipartRequest(req, board_path, maxSize,encType);


				String pageNum = mr.getParameter("pageNum");
				int re_num = Integer.parseInt(mr.getParameter("re_num"));
				String searchKey = mr.getParameter("searchKey");
				String searchValue = mr.getParameter("searchValue");
				ReviewDTO rdto = null;
				
				if(mr.getFile("fileName")!=null) { //파일이 존재하면

					rdto = new ReviewDTO();

					rdto.setRe_num(re_num);
					rdto.setRe_id(mr.getParameter("re_id"));
					rdto.setSubject(mr.getParameter("subject"));
					rdto.setContent(mr.getParameter("content"));
					rdto.setCategory(mr.getParameter("category"));
					rdto.setFileName(mr.getFilesystemName("fileName"));
					rvdao.insertData(rdto);

				}else {
					
					rdto = new ReviewDTO();
					
					rdto.setRe_num(re_num);
					rdto.setRe_id(mr.getParameter("re_id"));
					rdto.setSubject(mr.getParameter("subject"));
					rdto.setContent(mr.getParameter("content"));
					rdto.setCategory(mr.getParameter("category"));
					rvdao.insertData(rdto);
					
				}

				rvdao.updateData(rdto);

				String param = "pageNum=" + pageNum;

				if(searchValue!=null && !searchValue.equals("")) {
					param += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardarticle.do?" + param + "&re_num="+re_num;

				resp.sendRedirect(url);


			}else if(uri.indexOf("boardsave.do")!=-1) { // 댓글 저장
				
			
				int re_num = Integer.parseInt(req.getParameter("re_num"));
				String pageNum =  req.getParameter("pageNum");
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");
				DatgleDTO ddto = new DatgleDTO();

				int maxNum = ddao.getMaxNum();

				ddto.setDat_num(maxNum+1);
				ddto.setDat_id(req.getParameter("dat_id"));
				ddto.setContent(req.getParameter("content"));
				ddto.setDat_renum(Integer.parseInt(req.getParameter("dat_renum")));
				//System.out.println("dat_id: "+req.getParameter("dat_id"));
				//System.out.println("dat_renum: "+req.getParameter("dat_renum"));
				ddao.insertData(ddto);
				
				rvdao.updateDatCount(re_num); //댓글 수 하나 추가

				String param = "pageNum=" + pageNum;

				if(searchValue!=null && !searchValue.equals("")) {
					param += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardarticle.do?" + param + "&re_num=" + re_num;
				resp.sendRedirect(url);


			}else if(uri.indexOf("boarddelete.do")!=-1) { // 댓글 삭제


				int dat_num = Integer.parseInt(req.getParameter("dat_num"));
				int re_num = Integer.parseInt(req.getParameter("re_num"));
				String pageNum =  req.getParameter("pageNum");
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				ddao.deleteData(dat_num);
				
				rvdao.downDatCount(re_num); //댓글 수 감소

				String param = "pageNum=" + pageNum;

				if(searchValue!=null && !searchValue.equals("")) {
					param += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardarticle.do?" + param + "&re_num=" + re_num;
				resp.sendRedirect(url);
			}
			

		}

	}