package net.sho.web.Transaction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShowGetFromStockForm")
public class ShowGetFromStockForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShowGetFromStockForm() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loggedInUser = (String) request.getSession().getAttribute("loggedInUser");
        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/ServletShowLoginForm");
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("RemoveStock.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int item_id;
        int quantity;

        try {
            item_id = Integer.parseInt(request.getParameter("item_id"));
            quantity = Integer.parseInt(request.getParameter("quantity"));

            if (item_id < 0 || quantity < 0) {
                // Handle validation error
                request.setAttribute("error", "Negative values are not allowed.");
                doGet(request, response);
                return;
            }

            // Proceed with removing the stock
            // Your code to remove the stock goes here...

            response.sendRedirect(request.getContextPath() + "/ServletShowListItem");
        } catch (NumberFormatException e) {
            // Handle invalid number format error
            request.setAttribute("error", "Invalid number format.");
            doGet(request, response);
        }
    }

}
