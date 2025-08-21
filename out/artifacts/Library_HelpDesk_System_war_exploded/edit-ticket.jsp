<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, com.helpdesk.utils.DBConnection" %>

<%
    String id = request.getParameter("id");
    String errorMsg = null;
    ResultSet rs = null;

    if(id != null) {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tickets WHERE id=?");
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            if(!rs.next()) {
                errorMsg = "Ticket not found!";
            }
        } catch(Exception e) {
            errorMsg = "Error fetching ticket: " + e.getMessage();
        }
    } else {
        errorMsg = "No ticket ID provided!";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Ticket - Library Helpdesk</title>
    <link rel="stylesheet" href="CSS/Styles.css">
</head>
<body>
<header>
    <h1>Library Helpdesk - Edit Ticket</h1>
</header>

<nav>
    <a href="#">Home</a>
    <a href="submit-ticket.jsp">Submit New Ticket</a>
    <a href="viewTickets" class="active">View Tickets</a>
</nav>

<main class="container">
    <h2>Edit Ticket</h2>

    <%
        if(errorMsg != null) {
    %>
    <p style="color:red;"><%= errorMsg %></p>
    <%
    } else {
    %>

    <form action="editTicket" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

        <label>Username</label>
        <input type="text" name="username" value="<%= rs.getString("username") %>" readonly>

        <label>Category</label>
        <select name="category">
            <option <%= rs.getString("category").equals("Borrow & Return")?"selected":"" %>>Borrow & Return</option>
            <option <%= rs.getString("category").equals("Accounts & Membership")?"selected":"" %>>Accounts & Membership</option>
            <option <%= rs.getString("category").equals("Book Search Help")?"selected":"" %>>Book Search Help</option>
            <option <%= rs.getString("category").equals("Tech Support")?"selected":"" %>>Tech Support</option>
            <option <%= rs.getString("category").equals("Account Issue")?"selected":"" %>>Account Issue</option>
            <option <%= rs.getString("category").equals("Other")?"selected":"" %>>Other</option>
        </select>

        <label>Description</label>
        <textarea name="description" rows="5"><%= rs.getString("description") %></textarea>

        <label>Email</label>
        <input type="email" name="email" value="<%= rs.getString("email") %>">

        <label>Mobile</label>
        <input type="tel" name="mobile" value="<%= rs.getString("mobile") %>">

        <label>Status</label>
        <select name="status">
            <option <%= rs.getString("status").equals("Ongoing")?"selected":"" %>>Ongoing</option>
            <option <%= rs.getString("status").equals("Resolved")?"selected":"" %>>Resolved</option>
            <option <%= rs.getString("status").equals("Pending")?"selected":"" %>>Pending</option>
        </select>

        <button type="submit">Update Ticket</button>
    </form>

    <%
        } // end else
    %>
</main>

<footer>
    <p>&copy; 2025 Library Helpdesk | All Rights Reserved</p>
</footer>
</body>
</html>
