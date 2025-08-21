<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Ticket - Library Helpdesk</title>
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

<main class="container">
    <h2>Submit a New Ticket</h2>
    <form action="submitTicket" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>

        <label for="category">Issue Category</label>
        <select id="category" name="category" required>
            <option>Borrow & Return</option>
            <option>Accounts & Membership</option>
            <option>Book Search Help</option>
            <option>Tech Support</option>
            <option>Account Issue</option>
            <option>Other</option>
        </select>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="10" required></textarea>

        <label for="email">Email (optional)</label>
        <input type="email" id="email" name="email">

        <label for="mobile">Mobile Number (optional)</label>
        <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}">

        <button type="submit">Submit Ticket</button>
    </form>
</main>

<footer>
    <p>&copy; 2025 Library Helpdesk | All Rights Reserved</p>
</footer>
</body>
</html>
