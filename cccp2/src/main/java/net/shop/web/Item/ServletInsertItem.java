package net.shop.web.Item;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shop.dao.ItemDAO;
import net.shop.model.Item;

@WebServlet("/ServletInsertItem")
public class ServletInsertItem extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemDAO itemDAO;

    public ServletInsertItem() {
        this.itemDAO = new ItemDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int item_id = Integer.parseInt(request.getParameter("Item_id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String employee = request.getParameter("employee");

        // Validate input values
        if (item_id < 0 || price < 0 || quantity < 0) {
            // Handle invalid input, such as returning an error message or redirecting to an error page
            response.sendRedirect(request.getContextPath() + "/Error.jsp");
            return;
        }

        Item newItem = new Item(item_id, name, price, quantity, employee);
        try {
            itemDAO.insertItem(newItem);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/ServletShowListItem");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
