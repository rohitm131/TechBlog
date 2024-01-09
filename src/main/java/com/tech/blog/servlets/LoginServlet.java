package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try(PrintWriter out = response.getWriter()) {
    		
    		//fetch username and password from request
    		String userEmail = request.getParameter("email");
    		String userPassword = request.getParameter("password");
    		
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
    		
    		if(u == null) {
    			
    			//out.println("Invalid Details!! Try Again...");
    			Message msg = new Message("Invalid Details!! Try Again...", "error", "alert-danger");
    			HttpSession s = request.getSession();
    			s.setAttribute("msg", msg);
    			response.sendRedirect("login_page.jsp");    			
    		} else {
    			
    			HttpSession s = request.getSession();
    			s.setAttribute("currentUser", u);
    			response.sendRedirect("profile.jsp");
    			
    		}
    		    		
    	}
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter();
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
