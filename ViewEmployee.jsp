<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .back-button-container {
            text-align: center;
            margin-top: 20px;
        }

        .back-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-transform: uppercase;
        }

        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>View Employees</h1>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/FoodDB";
            String username = "root";
            String password = "Karthik";

            // Register JDBC driver and open connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Create statement to execute SQL
            stmt = conn.createStatement();

            // Execute query to fetch all employees
            String sql = "SELECT * FROM Employees";
            rs = stmt.executeQuery(sql);

            // Display employee details
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Phone</th><th>Address</th><th>Department</th><th>DOB</th><th>Joining Date</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getLong("phone") + "</td>");
                out.println("<td>" + rs.getString("address") + "</td>");
                out.println("<td>" + rs.getString("department") + "</td>");
                out.println("<td>" + rs.getDate("dob") + "</td>");
                out.println("<td>" + rs.getDate("joiningDate") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Finally block to close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                out.println("<p>Error: " + se.getMessage() + "</p>");
            }
        }
    %>

    <!-- Back button -->
    <div class="back-button-container">
        <button class="back-button" onclick="window.history.back()">Back</button>
    </div>
</body>
</html>
