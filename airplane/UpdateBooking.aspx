<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateBooking.aspx.cs" Inherits="airplane.UpdateBooking" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Flight Information</title>
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="update-flight-container">
            <h2>Update Flight Information</h2>

            <!-- Flight Number -->
            <div class="form-group">
                <label>Flight Number:</label>
                <asp:TextBox ID="txtFlightNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Flight Time -->
            <div class="form-group">
                <label>Flight Time:</label>
                <asp:TextBox ID="txtFlightTime" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Flight Price -->
            <div class="form-group">
                <label>Flight Price:</label>
                <asp:TextBox ID="txtFlightPrice" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Emissions -->
            <div class="form-group">
                <label>Emissions (Kg CO2):</label>
                <asp:TextBox ID="txtEmissions" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- eCash -->
            <div class="form-group">
                <label>eCash (₹):</label>
                <asp:TextBox ID="txtECash" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update Flight" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </form>
</body>
</html>
