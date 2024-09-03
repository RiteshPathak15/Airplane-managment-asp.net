using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airplane
{
    public partial class BookingConfirmation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate booking details based on reservation ID or session data
                BookingNumberLabel.Text = Session["BookingNumber"]?.ToString() ?? "N/A";
                FlightDetailsLabel.Text = Session["FlightDetails"]?.ToString() ?? "N/A";
                SeatNumberLabel.Text = Session["SeatNumber"]?.ToString() ?? "N/A";
                PassengerNameLabel.Text = Session["PassengerName"]?.ToString() ?? "N/A";
                BookingDateLabel.Text = Session["BookingDate"]?.ToString() ?? "N/A";

                // Populate dropdowns for new flight and seat options
                PopulateDropDowns();
            }
        }

        protected void ConfirmBookingButton_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Booking confirmed!');</script>");

            // Handle confirmation logic here
            MessageLabel.Text = "Booking Confirmed!";
            GenerateBookingTable(); // Generate table on confirmation

        }

        protected void UpdateBookingButton_Click(object sender, EventArgs e)
        {
            // Handle the booking update logic here
            string newFlight = NewFlightDropdown.SelectedValue;
            string newSeat = NewSeatDropdown.SelectedValue;

            // Perform update logic here
            MessageLabel.Text = $"Booking Updated to Flight: {newFlight}, Seat: {newSeat}";
            GenerateBookingTable(); // Generate table on update
        }

        private void PopulateDropDowns()
        {
            // Replace with your logic to get flight options
            NewFlightDropdown.Items.Add(new ListItem("Flight 1", "1"));
            NewFlightDropdown.Items.Add(new ListItem("Flight 2", "2"));
            NewFlightDropdown.Items.Add(new ListItem("Flight 3", "3"));

            // Replace with your logic to get seat options
            NewSeatDropdown.Items.Add(new ListItem("Seat 1", "1"));
            NewSeatDropdown.Items.Add(new ListItem("Seat 2", "2"));
            NewSeatDropdown.Items.Add(new ListItem("Seat 3", "3"));
        }

        private void GenerateBookingTable()
        {
            TablePanel.Controls.Clear(); // Clear any previous controls
            TablePanel.Visible = true; // Show the panel

            Table table = new Table();
            table.CssClass = "booking-table";

            // Add headers
            TableRow headerRow = new TableRow();
            headerRow.Cells.Add(new TableHeaderCell { Text = "Booking Number" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Flight" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Seat" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Passenger" });
            headerRow.Cells.Add(new TableHeaderCell { Text = "Date" });
            table.Rows.Add(headerRow);

            // Add data row
            TableRow dataRow = new TableRow();
            dataRow.Cells.Add(new TableCell { Text = BookingNumberLabel.Text });
            dataRow.Cells.Add(new TableCell { Text = FlightDetailsLabel.Text });
            dataRow.Cells.Add(new TableCell { Text = SeatNumberLabel.Text });
            dataRow.Cells.Add(new TableCell { Text = PassengerNameLabel.Text });
            dataRow.Cells.Add(new TableCell { Text = BookingDateLabel.Text });
            table.Rows.Add(dataRow);

            // Add table to the panel
            TablePanel.Controls.Add(table);
        }
    }
}
