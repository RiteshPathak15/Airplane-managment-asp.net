<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FlightSelection.aspx.cs" Inherits="airplane.FlightSelection" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Flight Ticket Booking</title>
    <link rel="stylesheet" type="text/css" href="Allslection.css" />
    <script type="text/javascript">
        // JavaScript function to open the modal
        function openModal() {
            document.getElementById("fareModal").style.display = "block";
        }

        // JavaScript function to close the modal
        function closeModal() {
            document.getElementById("fareModal").style.display = "none";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <div class="logo-container">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/airplane.png" CssClass="logo" AlternateText="Flight" />
                <h1 class="site-title">FLIGHT</h1>
            </div>
        </div>

        <!-- Navigation Bar -->
         <nav class="navbar">
     <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="FlightBooking.aspx" CssClass="active">Home</asp:HyperLink>
     <asp:HyperLink ID="lnkContactUs" runat="server" NavigateUrl="FlightSelection.aspx">Flight list</asp:HyperLink>
     <asp:HyperLink ID="lnkAboutUs" runat="server" NavigateUrl="FlightBooking.aspx/#aboutUsSection">About Us</asp:HyperLink>
     <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="Register.aspx">SignUp</asp:HyperLink>
     <asp:HyperLink ID="lnkSignIn" runat="server" NavigateUrl="Login.aspx">SignIn</asp:HyperLink>
 </nav>

        <!-- Offer Section -->
        <div class="offer-section">
            <p>Get Flat 12% OFF on ICICI Bank Debit Cards. Use Code - YRICICIDC</p>
        </div>

        <!-- Flight Options -->
        <div class="flight-options">
            <asp:Repeater ID="FlightRepeater" runat="server">
                <ItemTemplate>
                    <div class="flight-card">
                        <div class="flight-info">
                            <h2 class="flight-number">AirIndia Express <%# Eval("FlightNumber") %></h2>
                            <p class="flight-details">
                                <%# Eval("DepartureTime") %> - <%# Eval("ArrivalTime") %> | <%# Eval("Duration") %> | ₹<%# Eval("Price") %>
                            </p>
                            <!-- Updated button with OnClientClick -->
                            <asp:Button ID="btnViewFares" runat="server" Text="View Fares" CssClass="view-fares-button" OnClientClick="openModal(); return false;" />
                        </div>
                        <div class="flight-emission">
                            <p>Emissions: <%# Eval("Emissions") %></p>
                            <span class="ecash">eCash: ₹<%# Eval("ECash") %></span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Modal for Viewing Fares and Entering Coupon Code -->
        <div id="fareModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Apply Coupon and Book Flight</h2>
                <asp:TextBox ID="txtCouponCode" runat="server" CssClass="input-text" placeholder="Enter Coupon Code"></asp:TextBox>
                <asp:Button ID="btnApplyCoupon" runat="server" Text="Apply Coupon" CssClass="apply-coupon-button" />
                <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm Booking" CssClass="confirm-booking-button" OnClick="btnConfirmBooking_Click" />
            <asp:Label ID="MessageLabel" runat="server" CssClass="confirmation-message" Visible="false"></asp:Label>
</div>
        </div>

    </form>

</body>
</html>