package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int id;
	private String title;
	private String content;
	private String code;
	private String pic;
	private Timestamp crdate;
	private int catid;
	private int userid;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	/**
	 * @param id
	 * @param title
	 * @param content
	 * @param code
	 * @param pic
	 * @param crdate
	 * @param catid
	 */
	public Post(int id, String title, String content, String code, String pic, Timestamp crdate, int catid,int userid) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.code = code;
		this.pic = pic;
		this.crdate = crdate;
		this.catid = catid;
		this.userid=userid;

	}
	/**
	 * 
	 */
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param title
	 * @param content
	 * @param code
	 * @param pic
	 * @param catid
	 * @param crdate
	 */
	public Post(String title, String content, String code, String pic, int catid, Timestamp crdate,int userid) {
		super();
		this.title = title;
		this.content = content;
		this.code = code;
		this.pic = pic;
		this.crdate = crdate;
		this.catid = catid;
		this.userid=userid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Timestamp getCrdate() {
		return crdate;
	}
	public void setCrdate(Timestamp crdate) {
		this.crdate = crdate;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	
	
}	
