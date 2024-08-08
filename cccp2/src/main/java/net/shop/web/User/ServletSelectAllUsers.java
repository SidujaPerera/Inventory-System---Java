package net.shop.web.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.shop.dao.UserDAO;
import net.shop.model.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;

@WebServlet("/ServletSelectAllUser")
public class ServletSelectAllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;   
   
    public ServletSelectAllUsers() {
    	this.userDAO = new UserDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,IOException, ServletException {
		List< User > listUser = userDAO.selectAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserList.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
