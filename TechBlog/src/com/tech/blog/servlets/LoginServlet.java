package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		User user=dao.getUserByEmailAndPassword(email, pass);
		
		if(user==null) {
//			user not found
//			response.getWriter().print("Not found");
			Message msg=new Message("Invalid Credentials ! Try Again","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg",msg);
			
			response.sendRedirect("login.jsp");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("user",user);
			System.out.println(user.getName());
			response.sendRedirect("profile.jsp");
		}
	}

}
