<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add to Cart</title>
</head>
<body>
    <%
        // Retrieve form data
        String itemName = request.getParameter("itemName");
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/FoodDB"; // Change to your database URL
        String user = "root"; // Change to your database username
        String password = "Karthik"; // Change to your database password

        // Attempt database connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL driver
            Connection conn = DriverManager.getConnection(url, user, password);

            // Insert the item into the Cart table
            String insertQuery = "INSERT INTO Cart (item1_name, item1_price) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, itemName);
            pstmt.setDouble(2, itemPrice);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            // Redirect back to the menu page
            response.sendRedirect("Menu.jsp");
        } catch (Exception e) {
            // Handle any errors
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>
