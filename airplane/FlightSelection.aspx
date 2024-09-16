<%@ Page Title="All Tickets" Language="C#" AutoEventWireup="true" CodeFile="FlightSelection.aspx.cs" Inherits="airplane.FlightSelection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Tickets</title>
    <link rel="stylesheet" type="text/css" href="AllSlection.css" />
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
        <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="FlightBooking.aspx">Home</asp:HyperLink>
        <asp:HyperLink ID="lnkFlightList" runat="server" NavigateUrl="FlightSelection.aspx">Flight list</asp:HyperLink>
        <asp:HyperLink ID="lnkAboutUs" runat="server" NavigateUrl="FlightBooking.aspx/#aboutUsSection">About Us</asp:HyperLink>
        <asp:HyperLink ID="lnkSignUp" runat="server" NavigateUrl="Register.aspx">SignUp</asp:HyperLink>
        <asp:HyperLink ID="lnkSignIn" runat="server" NavigateUrl="Login.aspx">SignIn</asp:HyperLink>
    </nav>

    <form id="form1" runat="server">
        <div class="main-content">
            <h2>All Tickets</h2>
            <asp:GridView ID="gvConfirmedBookings" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="gvConfirmedBookings_RowCommand">
                <Columns>
                    <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                    <asp:BoundField DataField="FlightID" HeaderText="Flight ID" />
                    <asp:BoundField DataField="DepartureCity" HeaderText="Departure City" />
                    <asp:BoundField DataField="DestinationCity" HeaderText="Destination City" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Seat" HeaderText="Seat" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnCancel" runat="server" CommandName="CancelBooking" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancel" CssClass="btn cancel" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>



        </div>
    </form>
</body>
</html>
