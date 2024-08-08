package net.shop.web.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.shop.dao.UserDAO;
import net.shop.model.User;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ServletInsertUser")
public class ServletInsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

       
    public ServletInsertUser() {
    	this.userDAO = new UserDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String is_admin = request.getParameter("is_admin");
		User newUser = new User(name, password,Integer.parseInt(is_admin));
		try {
			userDAO.insertUser(newUser);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/ServletShowList");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
