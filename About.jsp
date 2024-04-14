<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Food Ease</title>
    <style>
        /* General styles */

body {
    font-family: 'Montserrat', sans-serif;
    margin: 0;
    padding: 0;
}

#header {
    display: flex;
    box-sizing: border-box;
    flex-direction: column;
    /* justify-content: space-between; */
    /* align-items: center; */
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
    color: #fff; /* Change text color on hover if desired */
  }

.navbar ul li {
    list-style: none;
    display: inline-block;
    margin: 10px;
    margin-bottom: 0px;
    padding: 5px;
}

a[href="index.html"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}

a[href="About.jsp"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}

a[href="Menu.jsp"] {
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


main {
    padding: 20px;
}

section {
    margin-bottom: 30px;
}

h2 {
    color: #061168;
}

p {
    line-height: 1.6;
}

/* Footer styles */

footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 20px;
}

/* Styles specific to the team members section */

.team-member {
    text-align: center;
    margin-bottom: 20px;
}

.team-member img {
    width: 150px;
    border-radius: 50%;
    margin-bottom: 10px;
}

/* Responsive styles */

@media (max-width: 768px) {
    header {
        padding: 10px;
    }

    nav ul li {
        display: block;
        margin-bottom: 10px;
    }

    main {
        padding: 10px;
    }

  
}

    </style>
</head>
<body>
   
        <header id="header">
            <nav class="navbar">
                <ul>
                    <li> <a href="index.html"> Home </a> </li>
                    <li> <a href="About.jsp"> About</a> </li>
                    <li> <a href="Menu.jsp"> Menu</a> </li>
                    
                </ul>
            </nav>
            <div id="banner">
                <h1>FoodEase</h1>
                <p>"Hungry? food ease,instant relief!"</p>
            </div>
    </header>
    
    <main>
        <section>
            <h2>Welcome to Food Ease!</h2>
            <p>Are you tired of the hassle of deciding what to cook for dinner? Or perhaps you're too busy to step out for lunch? Food Ease is here to rescue you from hunger pangs and culinary indecision!</p>
            <p>Food Ease is your go-to platform for convenient, reliable, and delicious food delivery. With just a few clicks, you can browse through a wide range of cuisines, select your favorite dishes, and have them delivered straight to your doorstep.</p>
            <p>Our mission is simple: to make your dining experience hassle-free and enjoyable. Whether you're craving a comforting bowl of noodles, a cheesy pizza, or a healthy salad, Food Ease has got you covered.</p>
        </section>
        
        <section>
            <h2>Why Choose Food Ease?</h2>
            <ul>
                <li>Wide Selection: Explore a diverse range of cuisines and dishes from top-rated restaurants.</li>
                <li>Convenience: Order anytime, anywhere, and enjoy doorstep delivery in no time.</li>
                <li>Reliability: Rest assured knowing that your orders are handled with care and delivered promptly.</li>
                <li>Quality Assurance: We partner with trusted restaurants to ensure that you receive fresh, tasty meals every time.</li>
                <li>Customer Satisfaction: Your satisfaction is our priority. We strive to provide excellent service and support at every step of your food ordering journey.</li>
            </ul>
        </section>
        
        <section>
            <h2>Join the Food Ease Community!</h2>
            <p>Experience the convenience and joy of food delivery with Food Ease today! Sign up now to explore our menu, place your orders, and embark on a culinary adventure from the comfort of your home or office.</p>
        </section>
    </main>
    
    
</body>
</html>
