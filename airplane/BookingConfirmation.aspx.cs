using System;
using System.Data;
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
                // Retrieve query string parameters
                string departureCity = Request.QueryString["departureCity"];
                string destinationCity = Request.QueryString["destinationCity"];
                string date = Request.QueryString["date"];
                string currentSeat = Request.QueryString["seat"]; // Added for current seat

                // Check if the query string parameters are not null or empty
                if (!string.IsNullOrEmpty(departureCity) && !string.IsNullOrEmpty(destinationCity) && !string.IsNullOrEmpty(date))
                {
                    // Display the retrieved values
                    lblDepartureCity.Text = "Departure City: " + departureCity;
                    lblDestinationCity.Text = "Destination City: " + destinationCity;
                    lblDate.Text = "Date: " + date;

                    // Display the current seat
                    lblCurrentSeat.Text = "Current Seat: " + (string.IsNullOrEmpty(currentSeat) ? "Not assigned" : currentSeat);

                    // Populate the dropdown with available seats
                    PopulateAvailableSeats();
                }
                else
                {
                    // Handle missing or invalid query string parameters
                    lblDepartureCity.Text = "Error: Invalid booking information.";
                }
            }
        }

        private void PopulateAvailableSeats()
        {
            // Example seat options; ideally, these would be fetched from a database or another source
            var seats = new[] { "1A", "1B", "2A", "2B", "3A", "3B" };
            NewSeatDropdown.Items.Clear();
            NewSeatDropdown.Items.Add(new ListItem("Select a seat", ""));
            foreach (var seat in seats)
            {
                NewSeatDropdown.Items.Add(new ListItem(seat, seat));
            }
        }

        protected void ConfirmBookingButton_Click(object sender, EventArgs e)
        {
            // Save the booking details (in a real application, this would involve database operations)
            string departureCity = Request.QueryString["departureCity"];
            string destinationCity = Request.QueryString["destinationCity"];
            string date = Request.QueryString["date"];
            string selectedSeat = lblCurrentSeat.Text.Replace("Current Seat: ", "");

            SaveBooking(departureCity, destinationCity, date, selectedSeat);

    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your booking has been confirmed! Thank you.');", true);

        }

        private void SaveBooking(string departureCity, string destinationCity, string date, string seat)
        {
            // Implement saving logic here
            // For example, save to a database or session
        }

        protected void UpdateBookingButton_Click(object sender, EventArgs e)
        {
            // Get the selected seat from the dropdown
            string newSeat = NewSeatDropdown.SelectedValue;
            if (!string.IsNullOrEmpty(newSeat))
            {
                // Update the booking with the new seat (implement your update logic here)
                // For demonstration, we’ll just update the label
                lblCurrentSeat.Text = "Current Seat: " + newSeat;
                MessageLabel.Text = "Booking updated with new seat: " + newSeat;
            }
            else
            {
                MessageLabel.Text = "Please select a seat to update.";
            }
        }
    }
}
