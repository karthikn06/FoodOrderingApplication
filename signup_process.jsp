<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    String userType = request.getParameter("user_type");

    // Check if passwords match
    if (!password.equals(confirmPassword)) {
        out.println("Passwords do not match.");
        return;
    }

    // Store user data in the database
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodDB", "root", "Karthik");

        PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, email, password, user_type) VALUES (?, ?, ?, ?)");
        ps.setString(1, username);
        ps.setString(2, email);
        ps.setString(3, password); // Store password as it is
        ps.setString(4, userType);
        ps.executeUpdate();

        con.close();

        // Redirect to Home.jsp after successful sign up
        response.sendRedirect("Home.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
