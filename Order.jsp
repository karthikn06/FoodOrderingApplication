<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Last Order</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 20px auto;
    }
    h1 {
        color: #333;
        text-align: center;
        margin-top: 20px;
    }
    h2 {
        color: #555;
    }
    .order-details {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
    }
    .order-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #ccc;
        padding: 10px 0;
    }
    .order-item:last-child {
        border-bottom: none;
    }
    .order-item span {
        flex: 1;
    }
    .no-order {
        text-align: center;
        color: #888;
    }
    .back-button {
        text-align: center;
        margin-top: 20px;
    }
    .back-button a {
        text-decoration: none;
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Last Order</h1>
        
        <h2>Food Details</h2>
        <div class="order-details">
            <%
                // Database connection details
                String url = "jdbc:mysql://localhost:3306/FoodDB";
                String username = "root";
                String password = "Karthik";

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;
                
                try {
                    // Establishing connection
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, username, password);
                    
                    // SQL query to retrieve the last order's food details based on time
// SQL query to retrieve the orders with the same timestamp
String foodQuery = "SELECT OrderID, Name, Price, Time FROM OrderedFood WHERE Time = (SELECT MAX(Time) FROM OrderedFood)";
                    
                    // Create prepared statement for food details
                    statement = connection.prepareStatement(foodQuery);
                    
                    // Execute the query for food details
                    resultSet = statement.executeQuery();
                    
                    // Display food details
                    if (resultSet.next()) {
                        int orderId = resultSet.getInt("OrderID");
                        String foodItem = resultSet.getString("Name");
                        double price = resultSet.getDouble("Price");
                        Timestamp orderTime = resultSet.getTimestamp("Time");
            %>
            <div class="order-item">
                <span>Order ID: <%= orderId %></span>
                <span>Food Item: <%= foodItem %></span>
                <span>Price: $<%= price %></span>
                <span>Order Time: <%= orderTime %></span>
            </div>
            <% 
                    } else {
            %>
            <div class="no-order">No orders found</div>
            <% 
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    // Close resources
                    try {
                        if (resultSet != null) {
                            resultSet.close();
                        }
                        if (statement != null) {
                            statement.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException ex) {
                        out.println("Error: " + ex.getMessage());
                    }
                }
            %>
        </div>
        
        <div class="back-button">
            <a href="Cart.jsp">Back</a>
        </div>
    </div>
</body>
</html>
