package com.proj3;

public class ReviewDTO {
	
	private int re_num; // �� �ϳ��� ���� ��ȣ
	private String re_id; // ����� ���̵�,fk(client)
	private String category; //ī�װ�
	private String subject; // �� ����
	private String content; // �� ����
	private int hitCount; // ��ȸ��
	private String cdate; // �� ���� ��¥
	private int dat_count; //��� ���� �޴� ���� �߰���
	private String fileSubject;
	private String fileName; // ���ε��� ���� �̸�
	
	
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRe_id() {
		return re_id;
	}
	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSubject() {
		return fileSubject;
	}
	public void setFileSubject(String fileSubject) {
		this.fileSubject = fileSubject;
	}
	public int getDat_count() {
		return dat_count;
	}
	public void setDat_count(int dat_count) {
		this.dat_count = dat_count;
	}

	

}