package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.FileHelper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String code=request.getParameter("code");
		int catid=Integer.parseInt(request.getParameter("catid"));
		Part part=request.getPart("pic");
		String fileName = extractFileName(part);
		
		PrintWriter out=response.getWriter();
	
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("user");
		Post post=new Post(title, content, code, fileName, catid, null,user.getId());
		
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		String path=request.getRealPath("/")+ "blogpics" + File.separator + fileName;
		if (dao.savePost(post)) {
			if (FileHelper.saveFile(part.getInputStream(), path)) {
				out.print("done");
			}
		}else {
			out.print("error");
		}
//		out.print(title);
//		out.print(content);
//		out.print(code);
//		out.print(catid);
//		out.print(fileName);
		
		
	}
	 String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
