package com.util;

public class MyUtil { 
	
	//��ü������ �� ���ϱ�
	//numPerPage : �� ȭ�鿡 ǥ���� ������ ����
	//dataCount : ��ü�������� ����
	public int getPageCount(int numPerpage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerpage;
		
		if(dataCount%numPerpage!=0)
			pageCount++;
		
		return pageCount;
		
	}
	
	//����¡ ó��
	//currentPage : ����ǥ���� ������
	//totalPage : ��ü������ ��
	//listUrl : ��ũ�� ������ url (list.jsp)
	//numPerBlock : ǥ�õǴ� ������ �� : 5
	//currentPageSetup : ǥ���� ù �������� -1���� �� ��, '�� ����' �� ������ �ִ� ������
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //ǥ�õǴ� ���������� 5
		int currentPageSetup; //���� �� (ǥ���� ù ������-1)
		int page;
		
		StringBuffer sb = new StringBuffer(); //�޸� ���� ���� �� �ִ�.
		
		if(currentPage==0 || totalPage==0)
			return "";
		
		//list.jsp
		//list.jsp=?searchKey="name"&searchValue="�����"
		if(listUrl.indexOf("?")!=-1) { //����ǥ�� ������~ �� �������� �Ѿ�� ����=���� �����Ѵٸ�
			listUrl = listUrl + "&";	
		}else {
			listUrl = listUrl + "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //���� �������� ���ϴ°��� ex) 7/5 -> 1 * 5 = 5
		
		if(currentPage % numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock; //���� 10�̸� �������� 0������ if�������� �ٽ� 5�� �ȴ�.
		
		//�� ����
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl +"pageNum="+currentPageSetup + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">������</a>&nbsp;
			
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1; //���������� +1 �� �ٷΰ��� ������
		
		
		while(page<=totalPage && page<=(currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) { //�������� ������������
				
				sb.append("<font color=\"Fuchia\">"+ page +"</font>&nbsp;"); //��Ʈ�� �ٸ���
				//<font color="Fuchsia">6</font>&nbsp;
			
				
			}else { //�ƴϸ�
				
				sb.append("<a href=\""+listUrl+"pageNum="+page+"\">"+page+"</a>&nbsp;"); 
				//<a href="list.jsp?pageNum=7">7</a>&nbsp;
				
			}
			
			page++;
			
		}
		
		
		//������
		if(totalPage - currentPageSetup > numPerBlock) { 
			//��ü���������� ������ ������ �ִ� �������� �� ����, ǥ�õǴ� ������ �������� ũ�����	
			sb.append("<a href=\""+listUrl+"pageNum="+page+"\">������</a>&nbsp;");	
		}
		
		return sb.toString();
	}
	
	
public String pageCateList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //ǥ�õǴ� ���������� 5
		int currentPageSetup; //���� �� (ǥ���� ù ������-1)
		int page;
		
		StringBuffer sb = new StringBuffer(); //�޸� ���� ���� �� �ִ�.
		
		if(currentPage==0 || totalPage==0)
			return "";
		
		//list.jsp
		//list.jsp=?searchKey="name"&searchValue="�����"
		if(listUrl.indexOf("?")!=-1) { //����ǥ�� ������~ �� �������� �Ѿ�� ����=���� �����Ѵٸ�
			listUrl = listUrl + "&";	
		}else {
			listUrl = listUrl + "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //���� �������� ���ϴ°��� ex) 7/5 -> 1 * 5 = 5
		
		if(currentPage % numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock; //���� 10�̸� �������� 0������ if�������� �ٽ� 5�� �ȴ�.
		
		//�� ����
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl +"c_pageNum="+currentPageSetup + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">������</a>&nbsp;
			
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1; //���������� +1 �� �ٷΰ��� ������
		
		
		while(page<=totalPage && page<=(currentPageSetup + numPerBlock)) {
			
			if(page==currentPage) { //�������� ������������
				
				sb.append("<font color=\"Fuchia\">"+ page +"</font>&nbsp;"); //��Ʈ�� �ٸ���
				//<font color="Fuchsia">6</font>&nbsp;
			
				
			}else { //�ƴϸ�
				
				sb.append("<a href=\""+listUrl+"c_pageNum="+page+"\">"+page+"</a>&nbsp;"); 
				//<a href="list.jsp?pageNum=7">7</a>&nbsp;
				
			}
			
			page++;
			
		}
		
		
		//������
		if(totalPage - currentPageSetup > numPerBlock) { 
			//��ü���������� ������ ������ �ִ� �������� �� ����, ǥ�õǴ� ������ �������� ũ�����	
			sb.append("<a href=\""+listUrl+"pageNum="+page+"\">������</a>&nbsp;");	
		}
		
		return sb.toString();
	}
	
	

}
