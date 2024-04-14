<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
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
    <h2>Login</h2>
    <form action="Login_process.jsp" method="post">
        <div class="input-group">
            <label for="username">User name:</label>
            <input type="text" id="username" name="username">
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
        </div>
        <div class="input-group">
            <label for="userType">User Type:</label>
            <select id="user_type" name="userType">
                <option value="customer">Customer</option>
            </select>
        </div>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
