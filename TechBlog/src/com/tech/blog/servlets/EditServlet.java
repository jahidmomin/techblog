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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.FileHelper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String about = request.getParameter("about");
		Part part = request.getPart("profile");
		String fileName = extractFileName(part);
		PrintWriter out = response.getWriter();

		//		System.out.println(fileName.equals(""));//empty aya to ?

		// get data from session and update it
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("user");

		user.setAbout(about);
		user.setEmail(email);
		user.setPassword(pass);
		user.setName(username);
		String oldFileName = user.getProfile();
		
		if (oldFileName.equals("default.jpg") && fileName.equals("")) {
			//agar old file ka name default.jpg hai & new file name empty to default.jpg rehna chahiye new name
			user.setProfile("default.jpg");
		}else if(fileName.equals("")){
			//agr new file empty hai to uska name old he rkhna 
			user.setProfile(oldFileName);
		}else {
			//agar new file name hai then update it.
			user.setProfile(fileName);
		}
		
		System.out.println(user.getProfile());
		System.out.println(oldFileName);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		if (dao.updateUser(user)) {

			//realpath webcontent tk ka path
			String path = request.getRealPath("/") + "profilepics" + File.separator + user.getProfile();
			String oldProfilepath = request.getRealPath("/") + "profilepics" + File.separator + oldFileName;
//			System.out.println(path);
			
					if (!oldFileName.equals("default.jpg")) {
						FileHelper.deleteFile(oldProfilepath);
					}
					
						if (FileHelper.saveFile(part.getInputStream(), path)) {
							Message msg = new Message("Profile Details Updated", "success", "alert-success");
							s.setAttribute("msg", msg);
						}else {
							Message msg = new Message("Something went wrongs", "error", "alert-danger");
							s.setAttribute("msg", msg);
						}
					
		}
		response.sendRedirect("profile.jsp");

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
