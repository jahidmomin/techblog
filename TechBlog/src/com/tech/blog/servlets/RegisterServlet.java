package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Thread.sleep(400);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String check=request.getParameter("check");
		PrintWriter out=response.getWriter();
		if (check==null) {
			out.print("check terms & conditions");
		} else {
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
//			store in User object
			User user=new User(username,email,pass,gender,about);
//			out.print(user.getName());
//			out.print(user.getEmail());
//			out.print(user.getPassword());
//			out.print(user.getGender());
//			out.print(user.getAbout());
//			DAO ka object and usko data send krege

			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if (dao.saveUser(user)) {
				out.print("done");
			}else {
				out.print("something went wrongs !");
			}
		}
	}

}
