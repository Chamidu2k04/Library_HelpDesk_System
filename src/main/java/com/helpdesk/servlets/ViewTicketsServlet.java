package com.helpdesk.servlets;

import com.helpdesk.utils.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/viewTickets")
public class ViewTicketsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, String>> tickets = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM tickets");

            while (rs.next()) {
                Map<String, String> ticket = new HashMap<>();
                ticket.put("id", rs.getString("id"));
                ticket.put("username", rs.getString("username"));
                ticket.put("category", rs.getString("category"));
                ticket.put("description", rs.getString("description"));
                ticket.put("email", rs.getString("email"));
                ticket.put("mobile", rs.getString("mobile"));
                ticket.put("status", rs.getString("status"));
                tickets.add(ticket);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("tickets", tickets);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
