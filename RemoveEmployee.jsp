<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Remove Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            padding: 10px;
            width: 60%;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #f44336;
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-transform: uppercase;
        }

        input[type="submit"]:hover {
            background-color: #d32f2f;
        }

        p {
            text-align: center;
            margin-top: 20px;
        }

        .success-message {
            color: #4CAF50;
        }

        .error-message {
            color: #f44336;
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
    <h1>Remove Employee</h1>

    <form action="RemoveEmployee.jsp" method="post">
        <label>Employee ID:</label>
        <input type="text" name="employeeId"><br><br>
        
        <input type="submit" value="Remove Employee">
    </form>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            String employeeId = request.getParameter("employeeId");

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/FoodDB";
            String username = "root";
            String password = "Karthik";

            // Register JDBC driver and open connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Prepare statement to remove employee
            String sql = "DELETE FROM Employees WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, employeeId);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p class='success-message'>Employee with ID " + employeeId + " removed successfully!</p>");
            } else {
                out.println("<p class='error-message'>No employee found with ID " + employeeId + ".</p>");
            }

        } catch (Exception e) {
            out.println("<p class='error-message'>Error: " + e.getMessage() + "</p>");
        } finally {
            // Finally block to close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                out.println("<p class='error-message'>Error: " + se.getMessage() + "</p>");
            }
        }
    %>

    <!-- Back button -->
    <div class="back-button-container">
        <button class="back-button" onclick="window.history.back()">Back</button>
    </div>

</body>
</html>
