<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Get the item ID parameter from the request
    int itemId = Integer.parseInt(request.getParameter("id"));

    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/FoodDB";
        String username = "root";
        String password = "Karthik";

        // Establishing connection
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        // SQL query to delete the item from the cart
        String query = "DELETE FROM cart WHERE id = ?";
        
        // Create prepared statement
        statement = connection.prepareStatement(query);
        
        // Set the item ID parameter
        statement.setInt(1, itemId);
        
        // Execute the update
        statement.executeUpdate();
        
        // Redirect back to the cart page after removal
        response.sendRedirect("Cart.jsp");
    } catch (Exception e) {
        // Handle exceptions
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            // Handle SQL exceptions during resource closing
            out.println("Error closing resources: " + ex.getMessage());
        }
    }
%>
