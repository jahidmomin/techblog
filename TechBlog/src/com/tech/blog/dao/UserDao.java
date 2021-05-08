package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tech.blog.entities.User;


public class UserDao {
	//interact with db
	
	private Connection con;

	/**
	 * @param con
	 */
	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
//	to insert user data
	public boolean saveUser(User user) {
		boolean f=false;
		try {
//			user->Database
//			System.out.println("dao obj"+this.con);
			String query="INSERT INTO user(name,email,pass,gender,about) VALUES(?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
//			System.out.println(pstmt);
			
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
