package com.tech.blog.entities;

public class Category {
	private int cid;
	private String name;
	private String desc;
	/**
	 * @param cid
	 * @param name
	 * @param desc
	 */
	public Category(int cid, String name, String desc) {
		super();
		this.cid = cid;
		this.name = name;
		this.desc = desc;
	}
	/**
	 * @param name
	 * @param desc
	 */
	public Category(String name, String desc) {
		super();
		this.name = name;
		this.desc = desc;
	}
	/**
	 * 
	 */
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
