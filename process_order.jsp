<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Order</title>
</head>
<body>
<%
    // Retrieve form data
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String zip = request.getParameter("zip");

    // Get user id from session (assuming it's set in a previous step)
    int userId = -1; // Default value

    // Get user id from session attribute
    Object userIdObj = session.getAttribute("id");
    if (userIdObj != null && userIdObj instanceof Integer) {
        userId = (Integer) userIdObj;
    }

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/FoodDB";
    String username = "your_username";
    String password = "your_password";

    // SQL query to insert order
    String insertOrderQuery = "INSERT INTO orders (fullname, email, address, city, zip, user_id) VALUES (?, ?, ?, ?, ?, ?)";

    Connection connection = null;
    PreparedStatement orderStatement = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        connection = DriverManager.getConnection(url, username, password);
        orderStatement = connection.prepareStatement(insertOrderQuery);

        // Insert data into Orders table
        orderStatement.setString(1, fullname);
        orderStatement.setString(2, email);
        orderStatement.setString(3, address);
        orderStatement.setString(4, city);
        orderStatement.setString(5, zip);
        orderStatement.setInt(6, userId); // Set the user_id
        orderStatement.executeUpdate();

        // Redirect to a success page
        response.sendRedirect("success.jsp");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        // Redirect to an error page
        response.sendRedirect("error.jsp");
    } finally {
        // Close database connections
        try {
            if (orderStatement != null) {
                orderStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
