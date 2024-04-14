<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Last Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        #lastOrder {
            margin-top: 20px;
        }

        #lastOrder p {
            margin: 10px 0;
        }

        #lastOrder table {
            width: 100%;
            border-collapse: collapse;
        }

        #lastOrder th, #lastOrder td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        #lastOrder th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Last Order</h1>
        <div id="lastOrder">
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
                    stmt = conn.createStatement();

                    // SQL query to retrieve the last order
                    String sql = "SELECT * FROM Orders ORDER BY order_id DESC LIMIT 1";
                    rs = stmt.executeQuery(sql);

                    // Display last order details in a table
                    if (rs.next()) {
                        out.println("<table>");
                        out.println("<tr><th>Order ID</th><th>Customer Name</th><th>Order Date</th><th>Order Total</th></tr>");
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("order_id") + "</td>");
                        out.println("<td>" + rs.getString("customer_name") + "</td>");
                        out.println("<td>" + rs.getDate("order_date") + "</td>");
                        out.println("<td>$" + rs.getDouble("order_total") + "</td>");
                        out.println("</tr>");
                        out.println("</table>");
                    } else {
                        out.println("<p>No last order found.</p>");
                    }

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
        </div>
    </div>
</body>
</html>
