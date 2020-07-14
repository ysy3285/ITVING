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
		ReviewDAO rvdao = new ReviewDAO(conn); //�Խù� DB
		DatgleDAO ddao = new DatgleDAO(conn); // ��� DB

		String uri = req.getRequestURI();
		String url;

		MyUtil myUtil = new MyUtil();

		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "imageFile";

		String board_path = root + File.separator + "pds" + File.separator + "boardFile";
		File f = new File(board_path);

		if(f.exists())
			f.mkdirs();

		if (uri.indexOf("signUp.do") != -1) { // ȸ������ ������

			url = "/proj3/signUp.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("signUp_ok.do") != -1) { // ȸ������ ó��

			CustomDTO dto = null;

			String id = req.getParameter("id");

			dto = cdao.getReadData(id);

			if (dto != null) {
				req.setAttribute("message", "�̹� ������� ���̵��Դϴ�.");
				url = "/proj3/signUp.jsp";
				forward(req, resp, url);
				return;
			}

			dto = new CustomDTO();

			dto.setId(id);
			dto.setPwd(req.getParameter("pwd"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setRank("�Ϲ�");

			cdao.insertData(dto);

			url = cp + "/itving/hello.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("hello.do") != -1) {

			url = "/proj3/hello.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login.do") != -1) { // �α��� ������

			url = "/proj3/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("login_ok.do") != -1) { // �α��� ó��

			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");

			CustomDTO dto = cdao.getReadData(id);

			if (dto == null || !dto.getPwd().equals(pwd)) {
				req.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���.");
				url = "/proj3/login.jsp";
				forward(req, resp, url);
				return;
			}

			HttpSession session = req.getSession(); // ���� �����

			CustomInfo info = new CustomInfo();

			info.setId(dto.getId());
			info.setName(dto.getName());
			info.setRank(dto.getRank());

			session.setAttribute("customInfo", info); // ���ǿ� �ø���

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("logout_ok.do") != -1) { // �α׾ƿ�

			HttpSession session = req.getSession();

			session.removeAttribute("customInfo"); // ���ǿ� �ִ� ������ ����
			session.invalidate();

			url = cp + "/itving/firstPage.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("findId.do") != -1) { // ���̵� ã�� ������

			url = "/proj3/findId.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("findId_ok.do") != -1) { // ���̵� ã�� ó��

			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");

			CustomDTO dto = cdao.idGetReadData(email);

			if (dto == null || !dto.getPwd().equals(pwd)) {
				req.setAttribute("message", "�̸��� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���.");
				url = "/proj3/findId.jsp";
				forward(req, resp, url);
				return;
			}

			req.setAttribute("message", "���̵�� [" + dto.getId() + "] �Դϴ�.");
			url = "/proj3/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("findPwd.do") != -1) { // ���ã�� ������

			url = "/proj3/findPwd.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("findPwd_ok.do") != -1) { // ���ã�� ó��

			String id = req.getParameter("id");
			String email = req.getParameter("email");

			CustomDTO dto = cdao.getReadData(id);

			if (dto == null || !dto.getEmail().equals(email)) {
				req.setAttribute("message", "���̵� �Ǵ� �̸����� ��Ȯ�� �Է��ϼ���.");
				url = "/proj3/findPwd.jsp";
				forward(req, resp, url);
				return;

			}

			String senderName = "ITving";
			String senderEmail = "ITving@itiving.com";
			String receiverEmail = email;
			String subject = "ITving ȸ������ ��й�ȣ";
			String content = "ȸ������ ��й�ȣ�� [" + dto.getPwd() + "] �Դϴ�.";

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

			req.setAttribute("message", "�Է��� �̸����� �������� Ȯ���� �ּ���.");
			url = "/proj3/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("myPage.do") != -1) { // ����������

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
			
		} else if (uri.indexOf("myBoard.do") != -1) { // ����������_���ۺ���
			//�Ѿ�� ������ ��ȣ(myUtil, article.jsp)
			String pageNum = req.getParameter("pageNum");
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getId();
			String rank = "["+info.getRank()+"]";
			
			int currentPage = 1; //����������

			if(pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum="1"; //ó�� 1���������� �ִ� ������ ���� ���ö� ���� �߻��� ���� ���
			}

			//��ü������ ���ϱ�
			int dataCount = rvdao.getDataCount(id);

			//���������� ǥ���� ������ ����
			int numPerPage = 5;

			//��ü�������� ����
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//�����͸� �����ؼ� �������� �پ��� ��
			if(currentPage > totalPage) {
				currentPage = totalPage;
			}


			//������ �������� ���۰� ��
			int start = (currentPage-1)*numPerPage+1; // currentPage==1 �ΰ�� start ==1
			int end = currentPage*numPerPage; //end==3
			
			String param="";
			


			//����¡ó��
			String listUrl = "myBoard.do" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			//�۳��뺸�� �ּ�����
			String articleURL = cp + "/itving/boardarticle.do";
			

			if(param.equals("")) { //�˻� ������ ��
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

		} else if (uri.indexOf("myDatgle.do") != -1) { // ����������_���ۺ���
			String pageNum = req.getParameter("pageNum");
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			String id = info.getId();
			String rank = "["+info.getRank()+"]";
			String articleURL = cp + "/itving/boardarticle.do";
			
			int currentPage = 1; //����������

			if(pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum="1"; //ó�� 1���������� �ִ� ������ ���� ���ö� ���� �߻��� ���� ���
			}

			//��ü������ ���ϱ�
			int dataCount = ddao.getDataCount(id);

			//���������� ǥ���� ������ ����
			int numPerPage = 5;

			//��ü�������� ����
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			//�����͸� �����ؼ� �������� �پ��� ��
			if(currentPage > totalPage) {
				currentPage = totalPage;
			}


			//������ �������� ���۰� ��
			int start = (currentPage - 1) * numPerPage + 1; // currentPage==1 �ΰ�� start ==1
			int end = currentPage * numPerPage; //end==3
			
			String param="";
			
			//����¡ó��
			String listUrl = "myDatgle.do" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);


			if(param.equals("")) { //�˻� ������ ��
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

		else if (uri.indexOf("customUpdate.do") != -1) { // �����ϱ�

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			CustomDTO dto = cdao.getReadData(info.getId());

			req.setAttribute("dto", dto);

			url = "/proj3/customUpdate.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("customUpdate_ok.do") != -1) { // ȸ�� ����

			CustomDTO dto = new CustomDTO();

			dto.setId(req.getParameter("id"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setEmail(req.getParameter("email"));

			cdao.updateData(dto);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("rankUpdate_ok1.do") != -1) { // ȸ�� ����
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			CustomDTO dto = cdao.getReadData(info.getId());

			dto.setRank("����Ƽ�� ������");
			info.setRank(dto.getRank());

			cdao.rankUpdateData(dto);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("rankUpdate_ok2.do") != -1) { // ȸ�� ����

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			CustomDTO dto = cdao.getReadData(info.getId());

			dto.setRank("���� �����̾�");
			info.setRank(dto.getRank());

			cdao.rankUpdateData(dto);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("customDelete.do") != -1) { // ȸ�� Ż�� ������

			url = "/proj3/customDelete.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("customDelete_ok.do") != -1) { // ȸ�� Ż�� ó��

			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			CustomDTO dto = cdao.getReadData(info.getId());

			String id = dto.getId();
			String pwd = req.getParameter("pwd");

			if (dto == null || !dto.getPwd().equals(pwd)) {
				req.setAttribute("message", "��й�ȣ�� ��Ȯ�� �Է��ϼ���.");
				url = "/proj3/customDelete.jsp";
				forward(req, resp, url);
				return;

			}

			cdao.deleteData(id);

			session.removeAttribute("customInfo"); // ���ǿ� �ִ� ������ ����
			session.invalidate();

			url = cp + "/itving/goodbye.do";
			resp.sendRedirect(url);

		} else if (uri.indexOf("goodbye.do") != -1) {

			url = "/proj3/goodbye.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("heart.do") != -1) { // ��Ʈ ��ư ���� �� ������ insert
			
			String category = req.getParameter("category");			// ī�װ���
			String pageNum = req.getParameter("pageNum");			// ������ ��ȣ(myUtil)
			String searchValue = req.getParameter("searchValue");	// �˻� ���
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

		} else if(uri.indexOf("heart_drop.do")!=-1) { // ��Ʈ ��ư ���� �� ������ insert
			
			String category = req.getParameter("category");			// ī�װ���
			String pageNum = req.getParameter("pageNum");			// ������ ��ȣ(myUtil)
			String searchValue = req.getParameter("searchValue");	// �˻� ���
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
		} else if (uri.indexOf("main.do") != -1) { // ����������

			// 2020.05.26 listUrl �߰�
			String listUrl = "videoList.do";

			List<VideoDTO> lists = vdao.getList();
			List<VideoDTO> lists_A = vdao.getList_search("����");
			List<VideoDTO> lists_B = vdao.getList_search("���");
			List<VideoDTO> lists_C = vdao.getList_search("����");
			List<VideoDTO> lists_D = vdao.getList_search("������");
			List<VideoDTO> lists_E = vdao.getList_search("��ȭ");

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

		} else if (uri.indexOf("playVideo.do") != -1) { // ���� ��û ������
			
			HttpSession session = req.getSession();

			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

			// 2020.05.26 �߰�
			String category = req.getParameter("category");			// ī�װ���
			String pageNum = req.getParameter("pageNum");			// ������ ��ȣ(myUtil)
			String searchValue = req.getParameter("searchValue");	// �˻� ���
			int vnum = Integer.parseInt(req.getParameter("vnum"));	// ���� ��ȣ
			String listUrl = "videoList.do";						// �˻�â
			String backUrl = "";									// ���ư���â
			String heartUrl = "";									// ���ϱ�â
			String param = "";
			String vcheck = null;									// ���ϱ� Ȯ��

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
					vcheck = "����";
					heartUrl = cp + "/itving/heart_drop.do";
				} else {
					vcheck = "����";
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

			List<VideoDTO> lists_A = vdao.getList_search("����");
			List<VideoDTO> lists_B = vdao.getList_search("���");
			List<VideoDTO> lists_C = vdao.getList_search("����");
			List<VideoDTO> lists_D = vdao.getList_search("������");
			List<VideoDTO> lists_E = vdao.getList_search("��ȭ");

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

		} else if (uri.indexOf("videoList.do") != -1) { // ���� ����Ʈ ������ (�˻�,����¡) 2020.05.26 ����

			String category = req.getParameter("category");			// ī�װ���
			String pageNum = req.getParameter("pageNum");			// ������ ��ȣ(myUtil)
			String searchValue = req.getParameter("searchValue");	// �˻�â

			int currentPage = 1; // �ȳѾ���� 1�������� �ҷ���

			if (pageNum != null && !pageNum.equals("0")) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum = "1";
			}

			// 2020.05.26 ��ü �˻� �߰�
			if (category == null || category.equals("")) 	
				category = "";

			/*
			if(category.equals("1"))
				category = "����";
			else if(category.equals("2"))
				category = "���";
			else if(category.equals("3"))
				category = "����";
			else if(category.equals("4"))
				category = "������";
			 */

			if (searchValue != null) { // �˻��� ������

				if (req.getMethod().equalsIgnoreCase("GET")) { // �˻�â�� �ѱ��� �Է������� ���ڵ� ���������� ������ �Ѿ
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			} else { // �˻��� ��������

				searchValue = "";

			}
			// �˻�------------------------------------------

			// ��ü ������ ���ϱ�
			int dataCount = vdao.getDataCount(category, searchValue); // 10

			// �� �������� ǥ���� ������ ����
			int numPerPage = 15;

			// ��ü �������� ����
			int totalPage = myUtil.getPageCount(numPerPage, dataCount); // 4

			// �����͸� �����ؼ� �������� �پ��� �� ó��
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			// ������ ������ ���۰� �� ����
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<VideoDTO> lists = vdao.getList_search_all(start, end, category, searchValue);
			
			if ((category == null || category.equals("")) && (searchValue == null || searchValue.equals(""))) 	
				lists = vdao.getList_all(start, end);

			String param = "";
			if (!searchValue.equals("")) { // �˻��� ������

				param = "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			// ����¡ ó��
			String listUrl = "videoList.do?category=" + URLEncoder.encode(category, "UTF-8") + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			// ���� ���뺸�� �ּ�����
			String playVideoUrl = cp + "/itving/playVideo.do?category=" + URLEncoder.encode(category, "UTF-8");
			if (param.equals("")) { // �˻� ��������
				playVideoUrl += "&pageNum=" + currentPage;
			} else { // �˻� ������
				playVideoUrl += "&pageNum=" + currentPage + param;
			}

			// �˻�â ó��
			listUrl = "videoList.do?category=" + URLEncoder.encode(category, "UTF-8");
			String imagePath = cp + "/pds/imageFile";

			// 2020.05.26 ��ü �˻� �߰�
			if (category == null || category.equals(""))
				category = "�˻�";

			// �������� ������
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
			
		} else if (uri.indexOf("videoUpload.do") != -1) { // ���� ���ε�(������ ����) - 05.26ȭ ����

			url = "/proj3/videoUpload.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("videoUpload_ok.do") != -1) { // ���� ���ε�(������ ����) - 05.26ȭ ����

			String encType = "UTF-8";
			int maxSize = 10 * 1024 * 1024;

			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());

			if (mr.getFile("ilink") != null) { // ���ε�� ������ ������

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

		} else if (uri.indexOf("videoDelete_ok.do") != -1) { // ���� ����(������ ����) - 05.26ȭ ����

			int vnum = Integer.parseInt(req.getParameter("vnum"));

			String ilink = req.getParameter("ilink");

			// ���ϻ���
			FileManager.doFileDelete(ilink, path);

			vdao.videoDelete(vnum);

			url = cp + "/itving/main.do";
			resp.sendRedirect(url);
		
		
			
		// ============================== Ŀ�´�Ƽ �Խ��� ==============================

		}	else if(uri.indexOf("boardcreated.do")!=-1) { //�Խ��� �۾���

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
		

				url =  "/itflexBoard/boardcreated.jsp"; // url�� created.do�̸� /bbs/created.jsp(��¥���)�� �е����Ѵ�. ȭ�鿡�� created.jsp�� ������ �ּҴ� created.do�� ���´�

				forward(req, resp, url); //�����带 ���ش�. �������Ҷ��� ��¥ �ּ�url ����.

			}else if(uri.indexOf("boardcreated_ok.do")!=-1) { //�Խ��� ����

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

			}else if(uri.indexOf("boardlist.do")!=-1) { // �Խ��� ���


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
				

				//�˻�--------------------------------------------------------
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");
				

				if(searchValue!=null){ //�˻��� ���� ��

					if(req.getMethod().equalsIgnoreCase("GET")){
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); 
					}														   


				}else { //�˻� ������ ��

					searchKey="subject";
					searchValue="";

				}
				
				String category = req.getParameter("category");
				
				
				//-------------------------------------------------------------
				

				//��ü������ ���ϱ�
				int dataCount = rvdao.getDataCount(searchKey,searchValue);
				int categoryCount = rvdao.getCategoryCount(category);

				//���������� ǥ���� ������ ����
				int numPerPage = 10;

				//��ü�������� ����
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);
				int cate_totalPage = myUtil.getPageCount(numPerPage, categoryCount);

				//�����͸� �����ؼ� �������� �پ��� ��
				if(currentPage > totalPage){
					currentPage = totalPage;
				}
				
				if(c_currentPage > cate_totalPage){
					c_currentPage = cate_totalPage;
				}


				//������ �������� ���۰� ��
				int start = (currentPage-1)*numPerPage+1; // currentPage==1 �ΰ�� start ==1
				int end = currentPage*numPerPage; //end==3
				
				int c_start = (c_currentPage-1)*numPerPage+1; // currentPage==1 �ΰ�� start ==1
				int c_end = c_currentPage*numPerPage; //end==3
				

				List<ReviewDTO> lists = rvdao.getList(start,end,searchKey,searchValue);//searchKey�� searchValue�� �޾Ƽ� ����� ���ش�.
				//�˻��� ���Ҷ����� searchKey="subject",searchValue=null�� �ؼ� �˻�
				
				List<ReviewDTO> cate_list = rvdao.getReadCategory(category,c_start,c_end); //ī�װ��� �˻�
				
				List<ReviewDTO> note_list = rvdao.noticeData("notice");
				
				String param="";

				if(!searchValue.equals("")){ //�˻��ϸ�

					param = "?searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8"); //param�� �̿��� �ּҿ� searchKey,searchValue�� ������ �� �� �ֵ��� �Ѵ�

				}
				

				//����¡ó��
				String listUrl = "boardlist.do" + param;
				String c_listUrl = "boardlist.do?category="+category;
				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
				String c_pageIndexList = myUtil.pageCateList(c_currentPage, cate_totalPage, c_listUrl);

				//�۳��뺸�� �ּ�����
				String articleURL = cp + "/itving/boardarticle.do";

				if(param.equals("")){ //�˻� ������ ��
					articleURL += "?pageNum=" + currentPage;
				}else {
					articleURL += param + "&pageNum=" + currentPage;
				}

				
				//���̵� �ޱ�
				HttpSession session = req.getSession();
				CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
				String id = info.getId(); //����������������������������������������������  �ڹ� �����ϸ� ���� �߶��~~
				String name = info.getName();
				
				req.setAttribute("id", id);
				req.setAttribute("name", name);

				//�������� ������
				req.setAttribute("cate_list", cate_list);
				req.setAttribute("category", category);
				req.setAttribute("lists", lists); //�����͵��� ����ִ� ����Ʈ (�������� num,name,subject�� ���̴� �͵�)
				req.setAttribute("note_list", note_list);
				req.setAttribute("articleURL", articleURL);
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("c_pageIndexList", c_pageIndexList);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("categoryCount", categoryCount);


				url = "/itflexBoard/boardlist.jsp"; //��¥ ó�����ִ� jsp�ּ�

				forward(req, resp, url); // ������

			}else if(uri.indexOf("boardarticle.do")!=-1) { //�Խ��� �� ���� ����
				//�Խñۿ� ����
				
				int re_num = Integer.parseInt(req.getParameter("re_num")); 
				String pageNum =  req.getParameter("pageNum");

				//int dat_renum = Integer.parseInt(req.getParameter("dat_renum")); //article.jsp���� �ѱ� re_num�� �޴´�

				//�˻�--------------------------------------------------------
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				if(searchValue!=null){ //�˻��� ���� ��

					if(req.getMethod().equalsIgnoreCase("GET")){
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); //�Է¹��� ���� �����̵� ���ڵ��Ǿ����� ���̴�
					}														   //���� ���ڵ��� ���ش�


				}else { //�˻� ������ ��

					searchKey="subject";
					searchValue="";

				}
				//-------------------------------------------------------------

				//��ȸ�� ����
				rvdao.updateHitCount(re_num);


				//��������
				ReviewDTO rdto = rvdao.getReadData(re_num);
				
				//�����Խù�, �����Խù� //�Խù� ������ȣ, ������ȣ�� ��������
				int next_re_num = re_num+1;
				int previous_re_num = re_num-1;
				ReviewDTO next_rdto = rvdao.getReadData(next_re_num);
				ReviewDTO previous_rdto = rvdao.getReadData(previous_re_num);
				
				if(rdto==null){
					url = cp + "/itving/boardlist.do";
					resp.sendRedirect(url);
				}
				
				String imagePath = cp + "/pds/boardFile";

				//�� ���μ�
				//int lineSu = rdto.getContent().split("\n").length;//���ٶ��� ���� ����

				//�� ������ ���͸� <br/>�� ��ȯ
				rdto.setContent(rdto.getContent().replaceAll("\n", "<br/>"));

				String param="pageNum="+pageNum;
				if(!searchValue.equals("")){ //�˻��ϸ�

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
				req.setAttribute("params", param); //param�� ���� servlet������ �ڱ��Ĵ�� �����͸� ��´� { } �ȿ� ��´�

				url = "/itflexBoard/boardarticle.jsp"; 
				forward(req, resp, url);

			}else if(uri.indexOf("boarddeleted_ok.do")!=-1) { //�Խù� ���� 

				int re_num = Integer.parseInt(req.getParameter("re_num"));
				String pageNum = req.getParameter("pageNum");

				//�˻�--------------------------------------------------------
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				if (searchValue != null) { //�˻��� ���� ��

					if (req.getMethod().equalsIgnoreCase("GET")) {
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); //�Է¹��� ���� �����̵� ���ڵ��Ǿ����� ���̴�
					} //���� ���ڵ��� ���ش�

				} else { //�˻� ������ ��

					searchKey = "subject";
					searchValue = "";

				}
				//-------------------------------------------------------------

				rvdao.deleteData(re_num);

				String params = "pageNum=" + pageNum;

				if (searchValue != null) { //�˻��ϸ�

					params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardlist.do?" + params;
				resp.sendRedirect(url);


			}else if(uri.indexOf("boardupdated.do")!=-1) { //�Խù� ����

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

			}else if(uri.indexOf("boardupdated_ok.do")!=-1) { // �Խù� ���� ok
				
				String encType ="UTF-8";

				//int maxNum = rvdao.getMaxNum();
				int maxSize = 30*1024*1024;

				MultipartRequest mr = new MultipartRequest(req, board_path, maxSize,encType);


				String pageNum = mr.getParameter("pageNum");
				int re_num = Integer.parseInt(mr.getParameter("re_num"));
				String searchKey = mr.getParameter("searchKey");
				String searchValue = mr.getParameter("searchValue");
				ReviewDTO rdto = null;
				
				if(mr.getFile("fileName")!=null) { //������ �����ϸ�

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


			}else if(uri.indexOf("boardsave.do")!=-1) { // ��� ����
				
			
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
				
				rvdao.updateDatCount(re_num); //��� �� �ϳ� �߰�

				String param = "pageNum=" + pageNum;

				if(searchValue!=null && !searchValue.equals("")) {
					param += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardarticle.do?" + param + "&re_num=" + re_num;
				resp.sendRedirect(url);


			}else if(uri.indexOf("boarddelete.do")!=-1) { // ��� ����


				int dat_num = Integer.parseInt(req.getParameter("dat_num"));
				int re_num = Integer.parseInt(req.getParameter("re_num"));
				String pageNum =  req.getParameter("pageNum");
				String searchKey = req.getParameter("searchKey");
				String searchValue = req.getParameter("searchValue");

				ddao.deleteData(dat_num);
				
				rvdao.downDatCount(re_num); //��� �� ����

				String param = "pageNum=" + pageNum;

				if(searchValue!=null && !searchValue.equals("")) {
					param += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

				}

				url = cp + "/itving/boardarticle.do?" + param + "&re_num=" + re_num;
				resp.sendRedirect(url);
			}
			

		}

	}