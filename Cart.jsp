<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .cart-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .cart-items {
            margin-bottom: 30px;
        }

        .cart-item {
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-bottom: 15px;
            position: relative;
        }

        .cart-item p {
            margin: 0;
        }

        .cart-item p strong {
            font-weight: bold;
        }

        .remove-button {
            position: absolute;
            top: 5px;
            right: 5px;
            background-color: #e74c3c;
            color: #fff;
            border: none;
            border-radius: 50%;
            padding: 5px 8px;
            cursor: pointer;
        }

        .remove-button:hover {
            background-color: #c0392b;
        }

        .checkout-form {
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .checkout-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .checkout-form input[type="text"],
        .checkout-form input[type="tel"],
        .checkout-form input[type="email"],
        .checkout-form input[type="number"],
        .checkout-form textarea,
        .checkout-form input[type="button"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .checkout-form input[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .checkout-form input[type="button"]:hover {
            background-color: #45a049;
        }

        /* Back to Menu link */
        .back-to-menu {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .back-to-menu:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h1>Your Cart</h1>
        <div class="cart-items">
            <%
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/FoodDB"; // Change to your database URL
                String user = "root"; // Change to your database username
                String password = "Karthik"; // Change to your database password

                // Attempt database connection
                try {
                    Class.forName("com.mysql.jdbc.Driver"); // Load the MySQL driver
                    Connection conn = DriverManager.getConnection(url, user, password);

                    // Retrieve items from the Cart table
                    String query = "SELECT item1_name, item1_price FROM Cart";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    // Display the items in the cart
                    while (rs.next()) {
                        String itemName = rs.getString("item1_name");
                        double itemPrice = rs.getDouble("item1_price");
            %>
            <div class="cart-item" id="<%= itemName %>">
                <p><strong><%= itemName %></strong> - $<%= itemPrice %></p>
                <button class="remove-button" onclick="removeItem('<%= itemName %>')">Remove</button>
            </div>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    // Handle any errors
                    out.println("Error: " + e.getMessage());
                }
            %>
        </div>

        <!-- Back button to go back to menu.jsp -->
        <a href="Menu.jsp" class="back-to-menu">Back to Menu</a>

        <!-- Checkout form -->
        <div class="checkout-form">
            <h2>Checkout</h2>
            <form id="checkoutForm" action="CheckoutProcess.jsp" method="post">
                <input type="text" name="name" placeholder="Your Name" required><br>
                <input type="tel" name="phone" placeholder="Your Phone" required><br>
                <textarea name="address" placeholder="Your Address" rows="4" required></textarea><br>
                <input type="number" name="zip" placeholder="ZIP Code" required><br>
                <input type="button" value="Place Order" onclick="placeOrder()">
            </form>
        </div>
    </div>

    <script>
        function removeItem(itemName) {
            if (confirm("Are you sure you want to remove " + itemName + " from the cart?")) {
                var cartItem = document.getElementById(itemName);
                cartItem.parentNode.removeChild(cartItem);
            }
        }

        function placeOrder() {
            // You may add validation here if needed
            // Submit the form
            document.getElementById("checkoutForm").submit();
            // Show success message
            alert("Your order has been placed successfully!");
        }
    </script>
</body>
</html>
