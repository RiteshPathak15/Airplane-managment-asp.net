<%@ Page Title="Booking Confirmation" Language="C#" AutoEventWireup="true" CodeFile="BookingConfirmation.aspx.cs" Inherits="airplane.BookingConfirmation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Confirmation</title>
    <link rel="stylesheet" type="text/css" href="AllSlection.css" />
    <script type="text/javascript">
        function confirmUpdate() {
            return confirm("Are you sure you want to update your booking?");
        }
    </script>
</head>
<body>
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

    <div class="container">
        <h2>Booking Confirmation</h2>
        <div class="booking-details">
            <p><strong>Booking Number:</strong>
                <asp:Label ID="BookingNumberLabel" runat="server" /></p>
            <p><strong>Flight:</strong>
                <asp:Label ID="FlightDetailsLabel" runat="server" /></p>
            <p><strong>Seat:</strong>
                <asp:Label ID="SeatNumberLabel" runat="server" /></p>
            <p><strong>Passenger:</strong>
                <asp:Label ID="PassengerNameLabel" runat="server" /></p>
            <p><strong>Date:</strong>
                <asp:Label ID="BookingDateLabel" runat="server" /></p>
        </div>

        <div class="update-section">
            <h3>Update Your Booking</h3>
            <form id="updateForm" runat="server">
                <div>
                    <asp:Label ID="lblSelectNewFlight" runat="server" Text="Select New Flight"></asp:Label>
                    <asp:DropDownList ID="NewFlightDropdown" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Alternate flight you can take" Value="" />
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="lblSelectNewSeat" runat="server" Text="Select New Seat"></asp:Label>
                    <asp:DropDownList ID="NewSeatDropdown" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Seat availability" Value="" />
                    </asp:DropDownList>
                </div>
                <asp:Button ID="ConfirmBookingButton" runat="server" Text="Confirm Booking" CssClass="btn btn-primary" OnClick="ConfirmBookingButton_Click" /><br />
                <br />
                <asp:Button ID="UpdateBookingButton" runat="server" Text="Update" CssClass="btn btn-primary" OnClientClick="return confirmUpdate();" OnClick="UpdateBookingButton_Click" /><br />
                <br />
            </form>
        </div>

        <!-- Message Label -->
        <div class="message-section">
            <asp:Label ID="MessageLabel" runat="server" CssClass="message-label" />
        </div>
        <br />
        <br />

        <!-- Table Section -->
        <div class="table-section">
            <asp:Panel ID="TablePanel" runat="server" Visible="false">
                <!-- Table will be dynamically added here -->
            </asp:Panel>
        </div>
    </div>
</body>
</html>
