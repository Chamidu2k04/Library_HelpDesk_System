package com.helpdesk.servlets;

import com.helpdesk.utils.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/submitTicket")
public class SubmitTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO tickets(username, category, description, email, mobile) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, category);
            stmt.setString(3, description);
            stmt.setString(4, email);
            stmt.setString(5, mobile);

            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("viewTickets"); // redirect to view tickets
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
