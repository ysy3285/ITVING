package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	
	//���� �ٿ�ε�
	//saveFileName : ������ ����� ���ϸ�
	//originalFileName : Ŭ���̾�Ʈ�� ���ε��� ���ϸ�
	//path : ������ ����� ��ġ
	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName, String path) {
		
		try {
			
			String filePath = path + File.separator + saveFileName;
			
			if (originalFileName == null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			//������ �ٿ� �޾� ����ÿ� �����̸� ������ �ѱ۱��� ����
			originalFileName = new String(originalFileName.getBytes("euc-kr"), "ISO-8859-1");
			
			File f = new File(filePath);
			
			if (!f.exists())
				return false;
			
			//����� �����͸� �������Ѵ�
			
			response.setContentType("application/octet-stream"); 
			response.setHeader("Content-disposition", "attachment;fileName=" + originalFileName); //����� �о ����
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			OutputStream out = response.getOutputStream();
			
			int n;
			byte[] bytes = new byte[4096];
			
			while((n=bis.read(bytes,0,4096)) != -1) {
				out.write(bytes,0,n);
			}

			out.flush();
			out.close();
			bis.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
		return true;
		
	}
	
	
	public static void doFileDelete(String fileName, String path) {
		
		try {
			
			String filePath = path + File.separator + fileName;
			
			File f = new File(filePath);
			
			if(f.exists())
				f.delete(); //���� ����
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	
}
