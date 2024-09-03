﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FlightBooking.aspx.cs" Inherits="airplane.FlightBooking" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Flight Ticket Booking</title>
    <link rel="stylesheet" type="text/css" href="Allslection.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="logo-container">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/airplane.png" CssClass="logo" AlternateText="Flight" />
                <h1 class="site-title">FLIGHT</h1>
            </div>
        </div>

        <nav class="navbar">
            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="FlightBooking.aspx" CssClass="active">Home</asp:HyperLink>
            <asp:HyperLink ID="lnkContactUs" runat="server" NavigateUrl="FlightSelection.aspx">Flight list</asp:HyperLink>
            <asp:HyperLink ID="lnkAboutUs" runat="server" NavigateUrl="FlightBooking.aspx/#aboutUsSection">About Us</asp:HyperLink>
            <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="Register.aspx">SignUp</asp:HyperLink>
            <asp:HyperLink ID="lnkSignIn" runat="server" NavigateUrl="Login.aspx">SignIn</asp:HyperLink>
        </nav>


        <div class="main-content">
            <h1>Flight Ticket Booking</h1>
            <div class="booking-form">
                <asp:DropDownList ID="txtDepartureCity" runat="server" CssClass="input-text">
                    <asp:ListItem Value="">Type Departure City</asp:ListItem>
                    <asp:ListItem>New Delhi </asp:ListItem>
                    <asp:ListItem>Greater Noida</asp:ListItem>
                    <asp:ListItem>NewYork</asp:ListItem>
                    <asp:ListItem>Paris</asp:ListItem>
                    <asp:ListItem>London</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="txtDestinationCity" runat="server" CssClass="input-text">
                    <asp:ListItem Value="">Type Destination City</asp:ListItem>
                    <asp:ListItem>New Delhi </asp:ListItem>
                    <asp:ListItem>Greater Noida</asp:ListItem>
                    <asp:ListItem>NewYork</asp:ListItem>
                    <asp:ListItem>Paris</asp:ListItem>
                    <asp:ListItem>London</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtDate" runat="server" Placeholder="mm/dd/yyyy" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnSearchFlights" runat="server" Text="Search Flights" CssClass="search-button" OnClick="SearchFlights_Click" />
            </div>
        </div>

        <!-- Enhanced Airplane Card Section -->
      <div class="airplane-card">
    <div class="card-content">
        <h2 class="card-title">Special Offers on Flights!</h2>
        <p class="card-description">Book now to enjoy exclusive discounts on your next journey. Limited time offer!</p>
        <asp:Button ID="btnExploreOffers" runat="server" Text="Explore Offers" CssClass="explore-offers-button" />
    </div>
    <div class="card-image">
        <asp:Image ID="Image2" runat="server" ImageUrl="https://pilotinstitute.com/wp-content/uploads/2023/02/How-Much-Do-Airplanes-Cost.jpg" AlternateText="Flight" />
    </div>
</div>



        <!-- New Cancel Booking Section -->
        <div class="cancel-booking-section">
            <h1>Cancel Booking</h1>
            <div class="cancel-form">
                <asp:TextBox ID="txtBookingReference" runat="server" Placeholder="Enter Booking Reference" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel Booking" CssClass="cancel-button" OnClick="CancelBooking_Click" />
            </div>
        </div>

        <!-- Flight Details Section -->
        <div class="flight-details-container">
            <!-- Flight Card 1 -->
            <div class="flight-details-card">
                <div class="flight-info">
                    <h3 class="flight-name">AirIndia Express IX-2784</h3>
                    <p class="flight-time">20:55 - 23:25 | 2h 30m Non-Stop</p>
                    <p class="flight-price">₹3,596</p>
                </div>
                <div class="flight-meta">
                    <p class="emissions">Emissions: 164 Kg CO2</p>
                    <p class="ecash">eCash: ₹250</p>
                </div>
                <button class="view-fares-button">View Fares</button>
            </div>

            <!-- Flight Card 2 -->
            <div class="flight-details-card">
                <div class="flight-info">
                    <h3 class="flight-name">AirIndia Express IX-2785</h3>
                    <p class="flight-time">14:00 - 16:30 | 2h 30m Non-Stop</p>
                    <p class="flight-price">₹4,150</p>
                </div>
                <div class="flight-meta">
                    <p class="emissions">Emissions: 170 Kg CO2</p>
                    <p class="ecash">eCash: ₹300</p>
                </div>
                <button class="view-fares-button">View Fares</button>
            </div>

            <!-- Flight Card 3 -->
            <div class="flight-details-card">
                <div class="flight-info">
                    <h3 class="flight-name">AirIndia Express IX-2786</h3>
                    <p class="flight-time">09:00 - 11:30 | 2h 30m Non-Stop</p>
                    <p class="flight-price">₹3,800</p>
                </div>
                <div class="flight-meta">
                    <p class="emissions">Emissions: 160 Kg CO2</p>
                    <p class="ecash">eCash: ₹280</p>
                </div>
                <button class="view-fares-button">View Fares</button>
            </div>
        </div>

        <!-- About Us Section -->
        <!-- About Us Section -->
<!-- About Us Section -->
<!-- About Us Section -->
<div id="aboutUsSection" class="about-us-section">
    <h2>About Us</h2>
    <div class="about-us-content">
        <div class="about-us-text">
            <p>At <strong>FlightConnect</strong>, we are passionate about connecting people to their destinations with ease and efficiency. Our platform offers a seamless flight booking experience, providing you with the best options from airlines worldwide. Whether you’re planning a business trip, a vacation, or a quick getaway, our extensive network ensures that you find the perfect flight at the best price.</p>

            <h3>Our Mission</h3>
            <p>We aim to make travel accessible to everyone by offering competitive prices, a user-friendly interface, and comprehensive customer support. From searching for flights to booking and managing your itinerary, we’re with you every step of the way.</p>

            <h3>Why Choose Us?</h3>
            <ul>
                <li><strong>Comprehensive Search:</strong> Access flights from all major airlines globally.</li>
                <li><strong>Competitive Prices:</strong> Enjoy exclusive discounts and special offers.</li>
                <li><strong>Customer Support:</strong> Our dedicated team is here to assist you 24/7.</li>
                <li><strong>Secure Transactions:</strong> We prioritize your safety with encrypted and secure payment gateways.</li>
            </ul>

            <p>Whether you’re flying domestic or international, we strive to make your journey as smooth as possible. Trust FlightConnect to take care of your travel needs with professionalism and care.</p>
        </div>
        <div class="about-us-image-container">
            <asp:Image ID="aboutUsImage" runat="server" ImageUrl="https://m.media-amazon.com/images/I/715bAj9Ax3L._AC_UF1000,1000_QL80_.jpg" AlternateText="About Us Image" CssClass="about-us-image" />
        </div>
    </div>
</div>



        <!-- Contact Us Section -->
        <div id="contactUsSection" class="contact-us-section">
            <h2>Contact Us</h2>
            <p>If you have any questions or need assistance, please contact us at:</p>
            <p>Email: support@flightbooking.com</p>
            <p>Phone: +1 234 567 8900</p>
        </div>
    </form>
</body>
</html>