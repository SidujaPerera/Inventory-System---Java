package net.shop.web.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletShowHome")
public class ServletShowHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletShowHome() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loggedInUser = (String) request.getSession().getAttribute("loggedInUser");
		  if (loggedInUser == null) {
			  response.sendRedirect(request.getContextPath() + "/ServletShowLoginForm"); 
		  } else {
			  RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
				dispatcher.forward(request, response);
		  }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
