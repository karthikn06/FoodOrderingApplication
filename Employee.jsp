<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
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

        div {
            width: 300px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2 {
            margin-top: 0;
            color: #333;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Employee Management System</h1>

    <div>
        
        <form action="AddEmployee.jsp" method="get">
            <input type="submit" value="Add Employee">
        </form>
    </div>

    <div>
        <form action="ViewEmployee.jsp" method="get">
            <input type="submit" value="View Employee">
        </form>
    </div>

    <div>
        <form action="SearchEmployee.jsp" method="get">
            <input type="submit" value="Search Employee">
        </form>
    </div>

    <div>
        <form action="RemoveEmployee.jsp" method="get">
            <input type="submit" value="Remove Employee">
        </form>
    </div>

    <div>
        <form action="OrderList.jsp" method="get">
            <input type="submit" value="Order">
        </form>
    </div>

</body>
</html>
