<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.helpdesk.utils.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Ticket</title>
    <link rel="stylesheet" href="CSS/Styles.css">
</head>
<body>
<header>
    <h1>Library Helpdesk - View Ticket</h1>
</header>

<nav>
    <a href="#">Home</a>
    <a href="submit-ticket.jsp">Submit New Ticket</a>
    <a href="viewTickets" class="active">View Tickets</a>
</nav>

    <h2>Ticket Details</h2>
    <%
        String id = request.getParameter("id");
        if(id != null) {
            try {
                Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tickets WHERE id=?");
                stmt.setString(1, id);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()) {
    %>
    <p><strong>ID:</strong> <%= rs.getInt("id") %></p>
    <p><strong>Username:</strong> <%= rs.getString("username") %></p>
    <p><strong>Category:</strong> <%= rs.getString("category") %></p>
    <p><strong>Description:</strong> <%= rs.getString("description") %></p>
    <p><strong>Email:</strong> <%= rs.getString("email") %></p>
    <p><strong>Mobile:</strong> <%= rs.getString("mobile") %></p>
    <p><strong>Status:</strong> <span class="status"><%= rs.getString("status") %></span></p>
    <%
                }
                conn.close();
            } catch(Exception e) { e.printStackTrace(); }
        }
    %>

<footer>
    <p>&copy; 2025 Library Helpdesk | All Rights Reserved</p>
</footer>
</body>
</html>
