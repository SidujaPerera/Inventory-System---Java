package net.shop.web.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shop.dao.UserDAO;


@WebServlet("/ServletCheckLogin")
public class ServletCheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    
    public ServletCheckLogin() {
    	 this.userDAO = new UserDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("name");
	    String password = request.getParameter("password");
	    boolean isValidUser  = userDAO.login(username,password);
	    
	    if (isValidUser == true) {
	        request.getSession().setAttribute("loggedInUser", username);
	        response.sendRedirect(request.getContextPath() + "/ServletShowHome");
	      } else {
	        request.setAttribute("error", "Invalid username or password");
	        request.getRequestDispatcher("Login.jsp").forward(request, response); 
	      }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
