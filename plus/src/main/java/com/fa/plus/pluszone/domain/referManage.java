package com.fa.plus.pluszone.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class referManage {
	private long refNum;
	private String subject;
	private String rContent;
	private String regDate;
	private long classNum;
	
	private String originalFile;
	private List<MultipartFile> selectFile;
	private String saveFile;
	
	private long num;
	
	private String userId;
	private long memberIdx;

	public long getRefNum() {
		return refNum;
	}

	public void setRefNum(long refNum) {
		this.refNum = refNum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public long getClassNum() {
		return classNum;
	}

	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String getSaveFile() {
		return saveFile;
	}

	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	
}