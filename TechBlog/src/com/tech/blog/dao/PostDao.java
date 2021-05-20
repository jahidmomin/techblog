package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;

public class PostDao {
	Connection con;
	ResultSet rs;
	/**
	 * PostDao 
	 * handles all post related funcationlities .
	 * db operations
	 */
	public PostDao(Connection con) {
		super();
		this.con=con;
	}
	
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list=new ArrayList<Category>();
		try {
			String query="select * from categories";
			Statement st=con.createStatement();
			rs=st.executeQuery(query);
			while (rs.next()) {
				int cid=rs.getInt(1);
				String name=rs.getString(2);
				String desc=rs.getString(3);
				Category c=new Category(cid, name, desc);
				list.add(c);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean f=false;
		try {
			String query="INSERT INTO posts(title,content,code,pic,catid,userid) VALUES (?,?,?,?,?,?)";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,post.getTitle());
			pstmt.setString(2,post.getContent());
			pstmt.setString(3,post.getCode());
			pstmt.setString(4,post.getPic());
			pstmt.setInt(5,post.getCatid());
			pstmt.setInt(6,post.getUserid());
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Post> getAllPosts(){
		List<Post> list=new ArrayList<Post>();
		try {
			String query="select * from posts order by id desc";
			Statement st=this.con.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while(rs.next()) {
				int id=rs.getInt("id");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String code=rs.getString("code");
				String pic=rs.getString("pic");
				Timestamp crdate=rs.getTimestamp("crdate");
				int catid=rs.getInt("catid");
				int userid=rs.getInt("userid");
				
				Post p=new Post(id, title, content, code, pic, crdate, catid, userid);
				list.add(p);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	//getPostById
	public List<Post> getPostById(int cid) {
		System.out.println(cid);
		List<Post> list=new ArrayList<Post>();
		try {
			String query="SELECT * FROM posts WHERE catid = ?";
			
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1,cid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				int id=rs.getInt("id");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String code=rs.getString("code");
				String pic=rs.getString("pic");
				Timestamp crdate=rs.getTimestamp("crdate");
				int userid=rs.getInt("userid");

				
				Post p=new Post(id, title, content, code, pic, crdate, cid, userid);
				list.add(p);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	
	}
	
	public Post getPostByPostId(int Pid) {
		Post post=null;
		try {
			String query="SELECT * FROM posts WHERE id = ?";
			
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1,Pid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				int id=rs.getInt("id");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String code=rs.getString("code");
				String pic=rs.getString("pic");
				Timestamp crdate=rs.getTimestamp("crdate");
				int userid=rs.getInt("userid");
				int cid=rs.getInt("catid");
				
				post=new Post(id, title, content, code, pic, crdate, cid, userid);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return post;
	}
}
