package net.shop.web.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shop.dao.ItemDAO;
import net.shop.model.Item;


@WebServlet("/ServletShowListItem")
public class ServletShowListItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDAO itemDAO;

	
    public ServletShowListItem() {
    	this.itemDAO = new ItemDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loggedInUser = (String) request.getSession().getAttribute("loggedInUser");
		  if (loggedInUser == null) {
			  response.sendRedirect(request.getContextPath() + "/ServletShowLoginForm"); 
		  } else {
			  List< Item > listItem = itemDAO.selectAllItem();
		        request.setAttribute("listItem", listItem);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("ItemList.jsp");
		        dispatcher.forward(request, response);
		  }
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
