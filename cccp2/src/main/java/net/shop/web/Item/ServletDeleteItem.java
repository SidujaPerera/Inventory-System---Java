package net.shop.web.Item;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shop.dao.ItemDAO;


@WebServlet("/ServletDeleteItem")
public class ServletDeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItemDAO itemDAO;   
    
    public ServletDeleteItem() {
    	this.itemDAO = new ItemDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			itemDAO.deleteItem(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 response.sendRedirect(request.getContextPath() + "/ServletShowListItem");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
