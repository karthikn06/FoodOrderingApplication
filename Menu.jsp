<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Your CSS styles for header and navigation */
        #header {
            display: flex;
            box-sizing: border-box;
            flex-direction: column;
            background: url('foodys back main.jpg') no-repeat center;
            height: 422px;
            width: 100%;
            margin-bottom: 20px;
        }

        .navbar {
            display: flex;
            justify-content: right;
            width: 100%;
            margin: 10px;
        }

        .navbar li:hover {
            background-color: #2980b9;
            border-radius: 5px;
        }

        .navbar li:hover a {
            color: #fff;
        }

        .navbar ul {
            padding: 0;
            margin: 0;
        }

        .navbar ul li {
            list-style: none;
            display: inline-block;
            margin: 0 10px;
        }

        a[href="#"] {
            text-decoration: none;
            cursor: pointer;
            font-size: 20px;
            color: rgb(255, 255, 255);
            font-weight: 1000;
        }

        a[href="index.html"],
        a[href="About.jsp"],
        a[href="Menu.jsp"],
        a[href="Cart.jsp"] {
            text-decoration: none;
            cursor: pointer;
            font-size: 20px;
            color: rgb(255, 255, 255);
            font-weight: 1000;
        }

        #banner {
            position: relative;
            display: flex;
            flex-direction: column;
            /* justify-content: center; */
            align-items: center;
            color: white;
            margin: 20px;
            margin-top: 0px;
        }

        #banner h1 {
            font-family: 'Arimo', sans-serif;
            font-size: 80px;
            color: white;
            font-weight: bolder;
            font-style: italic;
            margin: 20px;
            margin-bottom: 15px;
        }

        #banner p {
            font-family: 'Montserrat', sans-serif;
            font-size: 34px;
            color: white;
            text-align: center;
            margin: 10px;
            margin-bottom: 20px;
        }

        #banner input[type='text'] {
            width: 60%;
            height: 50px;
            margin: 10px;
            font-size: 15px;
            text-align: center;
            border-radius: 7px;
            border: none;
            font-family: 'Montserrat', sans-serif;
            font-size: 1.1rem;
        }

        /* Your CSS styles for the menu container */
        .menu-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Three columns */
            gap: 20px; /* Gap between items */
            padding: 20px;
        }

        .menu-item {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            text-align: center;
        }

        .menu-item img {
            width: 200px;
            height: 200px;
            object-fit: cover; /* Maintain aspect ratio */
            border-radius: 8px; /* Rounded corners */
        }

        .menu-item button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            margin: 10px auto;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .menu-item button:hover {
            background-color: #45a049;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div id="header">
        <div class="navbar">
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="About.jsp">About</a></li>
                <li><a href="Menu.jsp">Menu</a></li>
                <li><a href="Cart.jsp">Cart</a></li>
            </ul>
        </div>
        <div id="banner">
            <h1>FoodEase</h1>
            <p>"Hungry? food ease,instant relief!"</p>
        </div>
    </div>

    <div class="menu-container">
        <!-- Display food items -->
        <div class="menu-item">
            <img src="butter_chicken.jpg" alt="Butter Chicken">
            <h2>Butter Chicken</h2>
            <p>$10.00</p>
            <form method="post" action="AddToCart.jsp">
                <input type="hidden" name="itemName" value="Butter Chicken">
                <input type="hidden" name="itemPrice" value="10.00">
                <button type="submit" onclick="showAlert()">Add to Cart</button>
            </form>
        </div>
        <div class="menu-item">
            <img src="Panner_Tikka.jpg" alt="Paneer Tikka">
            <h2>Paneer Tikka</h2>
            <p>$8.00</p>
            <form method="post" action="AddToCart.jsp">
                <input type="hidden" name="itemName" value="Paneer Tikka">
                <input type="hidden" name="itemPrice" value="8.00">
                <button type="submit" onclick="showAlert()">Add to Cart</button>
            </form>
        </div>
        <div class="menu-item">
            <img src="Chicken_biriyani.jpg" alt="Chicken Biryani">
            <h2>Chicken Biryani</h2>
            <p>$12.00</p>
            <form method="post" action="AddToCart.jsp">
                <input type="hidden" name="itemName" value="Chicken Biryani">
                <input type="hidden" name="itemPrice" value="12.00">
                <button type="submit" onclick="showAlert()">Add to Cart</button>
            </form>
        </div>
        <div class="menu-item">
            <img src="Veg_Biriyani.jpg" alt="Veg Biriyani">
            <h2>Veg Biriyani</h2>
            <p>$10.00</p>
            <form method="post" action="AddToCart.jsp">
                <input type="hidden" name="itemName" value="Veg Biryani">
                <input type="hidden" name="itemPrice" value="10.00">
                <button type="submit" onclick="showAlert()">Add to Cart</button>
            </form>
        </div>
        <div class="menu-item">
            <img src="Masala_Dosa.jpg" alt="Masala Dosa">
            <h2>Masala Dosa</h2>
            <p>$12.00</p>
            <form method="post" action="AddToCart.jsp">
                <input type="hidden" name="itemName" value="Masala Dosa">
                <input type="hidden" name="itemPrice" value="12.00">
                <button type="submit" onclick="showAlert()">Add to Cart</button>
            </form>
        </div>
        <div class="menu-item">
            <img src="Burger.jpg" alt="Burger">
            <h2>Burger</h2>
            <p>$10.00</p>
            <form method="post" action="AddToCart.jsp">
                <input type="hidden" name="itemName" value="Burger">
                <input type="hidden" name="itemPrice" value="10.00">
                <button type="submit" onclick="showAlert()">Add to Cart</button>
            </form>
        </div>
        <!-- Add more menu items as needed -->
    </div>

    <script>
        function showAlert() {
            alert("Item added to cart successfully!");
        }
    </script>
</body>
</html>
