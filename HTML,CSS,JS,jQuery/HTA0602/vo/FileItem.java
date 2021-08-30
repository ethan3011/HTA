package com.sample.vo;

import java.util.Date;

public class FileItem {
	
	private int no;
	private String title;
	private String description;
	private String fileName;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	public String getShortFileName() {
		if(fileName == null) {
			return "";
		}
		return fileName.substring(13);
	}
}
