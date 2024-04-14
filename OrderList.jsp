<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }
  .container {
    width: 80%;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  h2 {
    text-align: center;
    color: #333;
  }
  .order {
    background-color: #f9f9f9;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  }
  .order p {
    margin: 5px 0;
  }
  .back-button-container {
    text-align: center;
    margin-top: 20px;
  }
  .back-button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    text-transform: uppercase;
  }
  .back-button:hover {
    background-color: #45a049;
  }
</style>
</head>
<body>

<div class="container">
  <h2>Order List</h2>

  <%
  // Initialize the database connection
  Connection conn = null;
  try {
      // Load the JDBC driver (optional for some databases, required for others)
      Class.forName("com.mysql.cj.jdbc.Driver");

      // Establish the database connection
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodDB", "root", "Karthik");

      // Use the connection here (execute queries, etc.)
      PreparedStatement ps = conn.prepareStatement("SELECT * FROM orderedfood");
      ResultSet rs = ps.executeQuery();

      // Process the ResultSet and display data as needed
      while (rs.next()) { 
  %>
      <div class="order">
        <p><strong>Order ID:</strong> <%= rs.getInt("OrderID") %></p>
        <p><strong>Name:</strong> <%= rs.getString("Name") %></p>
        <p><strong>Price:</strong> <%= rs.getDouble("Price") %></p>
        <p><strong>Date:</strong> <%= rs.getDate("Date") %></p>
        <p><strong>Time:</strong> <%= rs.getTime("Time") %></p>
      </div>
  <%
      }
      rs.close();
      ps.close();
  } catch (Exception e) {
      e.printStackTrace();
  } finally {
      // Close the connection in a finally block to ensure it's always closed
      if (conn != null) {
          try {
              conn.close();
          } catch (SQLException e) {
              e.printStackTrace();
          }
      }
  }
  %>

  <!-- Back button -->
  <div class="back-button-container">
    <button class="back-button" onclick="window.history.back()">Back</button>
  </div>

</div>

</body>
</html>
