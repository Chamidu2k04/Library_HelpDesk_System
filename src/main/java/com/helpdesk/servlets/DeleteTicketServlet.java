package com.helpdesk.servlets;

import com.helpdesk.utils.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deleteTicket")
public class DeleteTicketServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM tickets WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("viewTickets");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
