package com.util;

public class MyUtil { 
	
	//전체페이지 수 구하기
	//numPerPage : 한 화면에 표시할 데이터 갯수
	//dataCount : 전체데이터의 갯수
	public int getPageCount(int numPerpage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerpage;
		
		if(dataCount%numPerpage!=0)
			pageCount++;
		
		return pageCount;
		
	}
	
	//페이징 처리
	//currentPage : 현재표시할 페이지
	//totalPage : 전체페이지 수
	//listUrl : 링크를 설정할 url (list.jsp)
	//numPerBlock : 표시되는 페이지 수 : 5
	//currentPageSetup : 표시할 첫 페이지의 -1해준 값 즉, '◀ 이전' 이 가지고 있는 페이지
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //표시되는 페이지수는 5
		int currentPageSetup; //이전 ◀ (표시할 첫 페이지-1)
		int page;
		
		StringBuffer sb = new StringBuffer(); //메모리 낭비를 막을 수 있다.
		
		if(currentPage==0 || totalPage==0)
			return "";
		
		//list.jsp
		//list.jsp=?searchKey="name"&searchValue="배수지"
		if(listUrl.indexOf("?")!=-1) { //물음표가 있으면~ 즉 페이지가 넘어갈때 변수=값이 존재한다면
			listUrl = listUrl + "&";	
		}else {
			listUrl = listUrl + "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //이전 페이지를 구하는공식 ex) 7/5 -> 1 * 5 = 5
		
		if(currentPage % numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock; //만약 10이면 위에서는 0되지만 if문을통해 다시 5가 된다.
		
		//◀ 이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl +"pageNum="+currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
			
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1; //이전페이지 +1 이 바로가기 페이지
		
		
		while(page<=totalPage && page<=(currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) { //페이지가 현재페이지면
				
				sb.append("<font color=\"Fuchia\">"+ page +"</font>&nbsp;"); //폰트를 다르게
				//<font color="Fuchsia">6</font>&nbsp;
			
				
			}else { //아니면
				
				sb.append("<a href=\""+listUrl+"pageNum="+page+"\">"+page+"</a>&nbsp;"); 
				//<a href="list.jsp?pageNum=7">7</a>&nbsp;
				
			}
			
			page++;
			
		}
		
		
		//다음▶
		if(totalPage - currentPageSetup > numPerBlock) { 
			//전체페이지에서 이전이 가지고 있는 페이지를 뺀 수가, 표시되는 페이지 개수보다 크면실행	
			sb.append("<a href=\""+listUrl+"pageNum="+page+"\">다음▶</a>&nbsp;");	
		}
		
		return sb.toString();
	}
	
	
public String pageCateList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //표시되는 페이지수는 5
		int currentPageSetup; //이전 ◀ (표시할 첫 페이지-1)
		int page;
		
		StringBuffer sb = new StringBuffer(); //메모리 낭비를 막을 수 있다.
		
		if(currentPage==0 || totalPage==0)
			return "";
		
		//list.jsp
		//list.jsp=?searchKey="name"&searchValue="배수지"
		if(listUrl.indexOf("?")!=-1) { //물음표가 있으면~ 즉 페이지가 넘어갈때 변수=값이 존재한다면
			listUrl = listUrl + "&";	
		}else {
			listUrl = listUrl + "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //이전 페이지를 구하는공식 ex) 7/5 -> 1 * 5 = 5
		
		if(currentPage % numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock; //만약 10이면 위에서는 0되지만 if문을통해 다시 5가 된다.
		
		//◀ 이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl +"c_pageNum="+currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
			
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1; //이전페이지 +1 이 바로가기 페이지
		
		
		while(page<=totalPage && page<=(currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) { //페이지가 현재페이지면
				
				sb.append("<font color=\"Fuchia\">"+ page +"</font>&nbsp;"); //폰트를 다르게
				//<font color="Fuchsia">6</font>&nbsp;
			
				
			}else { //아니면
				
				sb.append("<a href=\""+listUrl+"c_pageNum="+page+"\">"+page+"</a>&nbsp;"); 
				//<a href="list.jsp?pageNum=7">7</a>&nbsp;
				
			}
			
			page++;
			
		}
		
		
		//다음▶
		if(totalPage - currentPageSetup > numPerBlock) { 
			//전체페이지에서 이전이 가지고 있는 페이지를 뺀 수가, 표시되는 페이지 개수보다 크면실행	
			sb.append("<a href=\""+listUrl+"pageNum="+page+"\">다음▶</a>&nbsp;");	
		}
		
		return sb.toString();
	}
	
	

}
