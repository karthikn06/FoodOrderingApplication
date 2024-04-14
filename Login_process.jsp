<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
// Retrieve username, password, and user type from the request
String username = request.getParameter("username");
String password = request.getParameter("password");
String userType = request.getParameter("userType");

// JDBC driver name, database URL, username, and password
String jdbcDriver = "com.mysql.cj.jdbc.Driver";
String dbUrl = "jdbc:mysql://localhost:3306/FoodDB";
String dbUsername = "root";
String dbPassword = "Karthik";

// Connection, Statement, and ResultSet objects
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Register JDBC driver
    Class.forName(jdbcDriver);

    // Open a connection
    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

    // Construct the SQL query to check if the provided credentials exist in the database
    String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND user_type = ?";
    
    // Prepare the statement
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, username);
    pstmt.setString(2, password);
    pstmt.setString(3, userType);
    
    // Execute the query
    rs = pstmt.executeQuery();

    // Check if any rows were returned (i.e., if the credentials were found)
 // Check if any rows were returned (i.e., if the credentials were found)
    if (rs.next()) {
        // Check if the username, password, and userType match the special case
        if (username.equals("Admin") && password.equals("Admin") && userType.equals("Admin")) {
            // Redirect to Employee.jsp
            response.sendRedirect("Employee.jsp");
        } else {
            // Valid credentials other than the special case, redirect to success page
            response.sendRedirect("Home.jsp");
        }
    } else {
        // Invalid credentials, redirect back to login page with an error message
        response.sendRedirect("Login.jsp?error=invalid");
    }

} catch (SQLException se) {
    se.printStackTrace();
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close resources
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException se) {
        se.printStackTrace();
    }
}
%>
