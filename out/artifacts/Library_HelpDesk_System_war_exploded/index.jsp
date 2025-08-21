<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Library Helpdesk</title>
    <link rel="stylesheet" href="CSS/Styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<header>
    <h1>Library Helpdesk</h1>
</header>

<nav>
    <a href="#">Home</a>
    <a href="submit-ticket.jsp">Submit New Ticket</a>
    <a href="viewTickets" class="active">View Tickets</a>
</nav>

    <table class="ticket-list">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Category</th>
            <th>Description</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ticket" items="${tickets}">
            <tr>
                <td>${ticket.id}</td>
                <td>${ticket.username}</td>
                <td>${ticket.category}</td>
                <td>${ticket.description}</td>
                <td>${ticket.email}</td>
                <td>${ticket.mobile}</td>
                <td><span class="status ${ticket.status.toLowerCase()}">${ticket.status}</span></td>
                <td class="ticket-actions">
                    <a href="edit-ticket.jsp?id=${ticket.id}"><button class="edit">Edit</button></a>
                    <a href="deleteTicket?id=${ticket.id}" onclick="return confirm('Are you sure?');"><button class="delete">Delete</button></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

<footer>
    <p>&copy; 2025 Library Helpdesk | All Rights Reserved</p>
</footer>
</body>
</html>
