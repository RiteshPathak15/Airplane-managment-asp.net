<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="airplane.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Flight Booking</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Container Styles */
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Header Styles */
        .header {
            background-image: url('../images/airplane.png');
            background-size: cover;
            background-position: center;
            height: 200px;
            display: flex;
            align-items: center;
            padding: 0 20px;
        }

        .logo-container {
            display: flex;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 8px;
        }

        .logo {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .site-title {
            font-size: 2em;
            color: #333;
            margin: 0;
        }

        /* Navigation Bar */
        .navbar {
            background-color: #ffeb3b;
            padding: 10px 0;
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: -10px;
        }

        .navbar a {
            color: #000;
            text-decoration: none;
            padding: 10px 20px;
            border-bottom: 2px solid transparent;
            transition: background-color 0.3s, border-bottom 0.3s;
        }

        .navbar a:hover, .navbar a.active {
            background-color: #ffeb3b;
            border-bottom: 2px solid #000;
        }

        /* Main Content */
        .main-content {
            text-align: center;
            padding: 50px;
            background-color: white;
            border-radius: 8px;
            margin: 20px auto;
            max-width: 600px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        /* Section Styles */
        .section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            margin-top: 0;
            color: #333;
        }

        /* Card Styles */
        .airplane-card {
            text-align: center;
            padding: 30px;
            background-color: #fff;
            border-radius: 16px;
            margin: 30px auto;
            max-width: 600px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .airplane-card:hover {
            transform: scale(1.05);
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.15);
        }

        .card-title {
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .card-description {
            margin: 15px 0 25px;
            color: #555;
            font-size: 1.1em;
            line-height: 1.6;
        }

        .explore-offers-button {
            padding: 12px 25px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s, transform 0.3s ease;
            box-shadow: 0 8px 15px rgba(0, 123, 255, 0.2);
        }

        .explore-offers-button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 12px 20px rgba(0, 123, 255, 0.3);
        }

        /* Footer */
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        /* Additional Styling as Required */
        /* Additional CSS classes from the provided code */
        .form-group, .form-control, .btn, .btn-primary, .offer-section, .flight-details-container, .flight-details-card {
            /* Add other styles from the provided code as needed */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <div class="logo-container">
                <img src="~/images/logo.png" alt="Logo" class="logo" />
                <h1 class="site-title">Flight Booking Portal</h1>
            </div>
        </div>

        <!-- Navigation Bar -->
        <nav class="navbar">
            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="Home.aspx" CssClass="active">Home</asp:HyperLink>
            <asp:HyperLink ID="lnkContactUs" runat="server" NavigateUrl="Contact.aspx">Contact Us</asp:HyperLink>
            <asp:HyperLink ID="lnkAboutUs" runat="server" NavigateUrl="About.aspx">About Us</asp:HyperLink>
            <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="SignUp.aspx">SignUp</asp:HyperLink>
            <asp:HyperLink ID="lnkSignIn" runat="server" NavigateUrl="SignIn.aspx">SignIn</asp:HyperLink>
        </nav> 

        <!-- Main Content -->
        <div class="main-content">
            <!-- Section: Flight Offers -->
            <div class="section airplane-card">
                <h2 class="card-title">Discover Our Latest Flight Offers</h2>
                <p class="card-description">Get the best deals on flights to your favorite destinations!</p>
                <button class="explore-offers-button">Explore Offers</button>
            </div>

            <!-- Section: Booking Form -->
            <div class="section booking-form">
                <h2>Book Your Flight Now</h2>
                <div class="form-group">
                    <label for="flight">Select Flight:</label>
                    <asp:DropDownList ID="ddlFlights" runat="server" CssClass="form-control">
                        
                    </asp:DropDownList>
                </div>
                <button type="button" class="btn btn-primary">Book Now</button>
            </div>

            <!-- Section: Customer Reviews or Other Content -->
            <div class="section">
                <h2>What Our Customers Are Saying</h2>
                <p>Read customer reviews to learn more about their experience.</p>
                <!-- Customer reviews content -->
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2024 Flight Booking. All rights reserved.
        </div>
    </form>
</body>
</html>
