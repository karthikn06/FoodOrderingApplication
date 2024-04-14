<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background: url("bgs.jpg") no-repeat;
            background-position: center;        
            background-size: cover;
        }

        .login-container {
            width: 300px;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-container .input-group {
            margin-bottom: 15px;
        }

        .login-container .input-group label {
            display: block;
            margin-bottom: 5px;
        }

        .login-container .input-group input,
        .login-container .input-group select {
            width: calc(100% - 20px); /* Adjusted width to accommodate padding */
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .login-container button {
            width: calc(100% - 20px); /* Adjusted width to accommodate padding */
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class="login-container">
    <h2>Admin Login</h2>
    <form action="AdminLogin.jsp" method="post">
        <div class="input-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username">
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
        </div>
        <button type="submit">Login</button>
    </form>
</div>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Check if the username and password are "admin"
    if (username != null && password != null && username.equals("admin") && password.equals("admin")) {
        // Redirect to Employee.jsp
        response.sendRedirect("Employee.jsp");
    } else if (username != null || password != null) {
        // Redirect back to login page with an error message
        response.sendRedirect("AdminLogin.jsp?error=invalid");
    }
%>

</body>
</html>
