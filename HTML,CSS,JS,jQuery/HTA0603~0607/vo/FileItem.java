package com.sample.vo;

import java.util.Date;

public class FileItem {
	
	private int no;
	private String title;
	private String description;
	private String filename;
	private Date createdDate;
	
	public FileItem() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	/**
	 * System.currentTimeMillis() 를 사용해서 13자리쨰부터 나오게 되면 앞에 숫자가 감춰지는 용도로 사용
	 * @return 숫자가 감춰진 파일명 출력을 위한 메소드
	 */
	public String getShortFilname() {
		if(filename == null) {
			return "";
		}
		return filename.substring(13);
	}
}
