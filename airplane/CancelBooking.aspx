<%@ Page Title="Manage Bookings" Language="C#" AutoEventWireup="true" CodeFile="CancelBooking.aspx.cs" Inherits="airplane.CancelBooking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://thumbs.dreamstime.com/b/airplane-soaring-dusky-sky-over-river-sunset-dusk-fluffy-clouds-painting-atmosphere-horizon-stunning-314160082.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .manage-bookings-container {
            width: 100vh;
            height: 70vh;
            margin: 100px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .manage-bookings-container .welcome {
            width: 100%;
            background: url('https://img.freepik.com/free-photo/planes-wing-cuts-through-sky-cotton-candy-clouds-during-radiant-sunset_91128-4456.jpg') center;
            background-size: cover;
            padding: 30px;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .manage-bookings-container .bookings-form {
            width: 100%;
            padding: 30px;
        }
        .bookings-form h2 {
            padding:5px;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .bookings-form table {
            width: 100%;
            border-collapse: collapse;
        }
        .bookings-form table, .bookings-form th, .bookings-form td {
            border: 1px solid #ddd;
        }
        .bookings-form th, .bookings-form td {
            padding: 10px;
            text-align: center;
        }
        .bookings-form tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .bookings-form input[type="button"] {
            background: #ff4d4d;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px;
            cursor: pointer;
        }
        .bookings-form input[type="button"]:hover {
            background: #cc0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="manage-bookings-container">
            <div class="welcome">
                <div>
                    <h2>Manage Your Bookings</h2>
                    <p>View and manage your booked flights.</p>
                </div>
            </div>
            <div class="bookings-form">
                <h2>Your Bookings</h2>
                <asp:GridView ID="BookingsGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="BookingsGridView_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                        <asp:BoundField DataField="FlightDetails" HeaderText="Flight Details" />
                        <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="CancelButton" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%# Eval("BookingID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
