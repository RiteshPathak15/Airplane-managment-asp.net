BookingConfrim:
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
        <form id="form1" runat="server">
            <div class="confirmation-details">
                <asp:Label ID="lblDepartureCity" runat="server" CssClass="details-label" /><br /><br />
                <asp:Label ID="lblDestinationCity" runat="server" CssClass="details-label" /><br /><br />
                <asp:Label ID="lblDate" runat="server" CssClass="details-label" /><br /><br />
                <asp:Label ID="lblCurrentSeat" runat="server" CssClass="details-label" /><br /><br />
            </div>

            <div class="update-section">
                <h3>Update Your Booking</h3>
                <div>
                    <asp:Label ID="lblSelectNewSeat" runat="server" Text="Select New Seat" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="NewSeatDropdown" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select a seat" Value="" />
                    </asp:DropDownList>
                </div>
                <asp:Button ID="ConfirmBookingButton" runat="server" Text="Confirm Booking" CssClass="btn btn-primary" OnClick="ConfirmBookingButton_Click" /><br />
                <br />
                <asp:Button ID="UpdateBookingButton" runat="server" Text="Update" CssClass="btn btn-primary" OnClientClick="return confirmUpdate();" OnClick="UpdateBookingButton_Click" /><br />
                <br />
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
        </form>
    </div>
</body>
</html>