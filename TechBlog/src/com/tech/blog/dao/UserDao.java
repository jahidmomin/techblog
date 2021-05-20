package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
//	to insert user data for registration
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
	
	//login
	public User getUserByEmailAndPassword(String email,String pass) {
		User user=null;
		try {
			String query="select * from user where email=? and pass=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,email);
			pstmt.setString(2,pass);
			
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()) {
				//db se data nikal kr user ka obj banao and send them to servlet
				user=new User();
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("pass"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean s=false;
		try {
			String query="Update user set name=? , email=? , pass=? ,about=?,gender=?,profile=? where id=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getAbout());
			pstmt.setString(5,user.getGender());
			pstmt.setString(6,user.getProfile());
			pstmt.setInt(7,user.getId());
			
			pstmt.executeUpdate();
			s=true;
			
		} catch (Exception e) {	
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;

	}
	
	public String getUserById(int id) { 
		String name=null;
		try {
			String query="select * from user where id=?";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setInt(1,id);
			pstmt.executeQuery();
			
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()) {
				name=rs.getString(2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
}
