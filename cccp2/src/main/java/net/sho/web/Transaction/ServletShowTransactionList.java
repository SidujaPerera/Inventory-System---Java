package net.sho.web.Transaction;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.shop.dao.TransactionDAO;
import net.shop.model.Transaction;


        @WebServlet("/ServletShowTransactionList")
                        public class ServletShowTransactionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	                TransactionDAO transactionDAO;
 
	                
	                
	                
	                
                     public ServletShowTransactionList() {
    	transactionDAO = new TransactionDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		                 String loggedInUser = (String) request.getSession().getAttribute("loggedInUser");
		  if (loggedInUser == null) {
			  response.sendRedirect(request.getContextPath() + "/ServletShowLoginForm"); 
		  } else {
		              	        List< Transaction > listItem = transactionDAO.selectAllTransaction();
		        request.setAttribute("listItem", listItem);
		                        RequestDispatcher dispatcher = request.getRequestDispatcher("TransactionList.jsp");
		        dispatcher.forward(request, response);
		  }
	}


	                   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
