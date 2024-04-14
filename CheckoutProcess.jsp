<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Retrieve form data
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    int zip = Integer.parseInt(request.getParameter("zip"));

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/FoodDB"; // Change to your database URL
    String user = "root"; // Change to your database username
    String password = "Karthik"; // Change to your database password

    // Attempt database connection
    try {
        Class.forName("com.mysql.jdbc.Driver"); // Load the MySQL driver
        Connection conn = DriverManager.getConnection(url, user, password);

        // Insert order details into Orders table
        String insertOrderQuery = "INSERT INTO Orders (name, phone, address, zip) VALUES (?, ?, ?, ?)";
        PreparedStatement orderPstmt = conn.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
        orderPstmt.setString(1, name);
        orderPstmt.setString(2, phone);
        orderPstmt.setString(3, address);
        orderPstmt.setInt(4, zip);
        orderPstmt.executeUpdate();

        // Get the generated order ID
        ResultSet generatedKeys = orderPstmt.getGeneratedKeys();
        int orderId = -1;
        if (generatedKeys.next()) {
            orderId = generatedKeys.getInt(1);
        }
        generatedKeys.close();
        orderPstmt.close();

        // Retrieve items from the Cart table
        String selectCartQuery = "SELECT item1_name, item1_price FROM Cart";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(selectCartQuery);

        // Insert food details into orderedfood table
        String insertFoodQuery = "INSERT INTO orderedfood ( Name, Price) VALUES (?, ?)";
        PreparedStatement foodPstmt = conn.prepareStatement(insertFoodQuery);
        while (rs.next()) {
            String foodName = rs.getString("item1_name");
            double price = rs.getDouble("item1_price");

            // Insert food details for each item in the cart
            foodPstmt.setString(1, foodName);
            foodPstmt.setDouble(2, price);
            foodPstmt.executeUpdate();
        }
        foodPstmt.close();

        // Clear the cart after placing the order
        String clearCartQuery = "DELETE FROM Cart";
        Statement clearStmt = conn.createStatement();
        clearStmt.executeUpdate(clearCartQuery);
        clearStmt.close();

        conn.close();
        response.sendRedirect("Order.jsp"); // Redirect to order confirmation page
    } catch (Exception e) {
        // Handle any errors
        out.println("Error: " + e.getMessage());
    }
%>
