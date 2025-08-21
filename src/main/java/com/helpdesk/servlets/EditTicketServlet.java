package com.helpdesk.servlets;

import com.helpdesk.utils.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/editTicket")
public class EditTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String status = request.getParameter("status");

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE tickets SET category=?, description=?, email=?, mobile=?, status=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, category);
            stmt.setString(2, description);
            stmt.setString(3, email);
            stmt.setString(4, mobile);
            stmt.setString(5, status);
            stmt.setString(6, id);
            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("viewTickets");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
