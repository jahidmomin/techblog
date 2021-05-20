package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	private Connection con;
	
	/**
	 * @param con
	 */
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addLike(int pid,int uid) {
		boolean f=false;
		try {
			String q="insert into likes (pid,uid) values(?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(q);
			
			pstmt.setInt(1,pid);
			pstmt.setInt(2,uid);
			
			pstmt.executeUpdate();
			
			f=true;
		} catch (Exception e) {
			// TODO: handle exceptione
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLike(int pid) {
		// TODO Auto-generated method stub
		int count=0;
		try {
			String q="select count(*) from likes where pid=?";
			PreparedStatement pstmt=this.con.prepareStatement(q);
			
			pstmt.setInt(1,pid);
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		try {
			String q="select * from likes where pid=? and uid=?";
			PreparedStatement pstmt=this.con.prepareStatement(q);
			pstmt.setInt(1,pid);
			pstmt.setInt(2,uid);
			
			ResultSet rs=pstmt.executeQuery();
			
			if (rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteLike(int pid,int uid) {
		boolean f=false;
		try {
			String q="delete from likes where pid=? and uid=?";
			PreparedStatement pstmt=this.con.prepareStatement(q);
			pstmt.setInt(1,pid);
			pstmt.setInt(2,uid);
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		return f;
	}
}
