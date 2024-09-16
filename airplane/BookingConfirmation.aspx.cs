using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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
                string flightID = Request.QueryString["flightID"]; // Added for flightID

                // Check if the query string parameters are not null or empty
                if (!string.IsNullOrEmpty(departureCity) && !string.IsNullOrEmpty(destinationCity) && !string.IsNullOrEmpty(date))
                {
                    // Display the retrieved values
                    lblDepartureCity.Text = "Departure City: " + departureCity;
                    lblDestinationCity.Text = "Destination City: " + destinationCity;
                    lblDate.Text = "Date: " + date;
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
            // Retrieve booking details from query string or controls
            string departureCity = Request.QueryString["departureCity"];
            string destinationCity = Request.QueryString["destinationCity"];
            string date = Request.QueryString["date"];
            string selectedSeat = lblCurrentSeat.Text.Replace("Current Seat: ", ""); // Make sure lblCurrentSeat is defined
            string flightID = Request.QueryString["flightID"]; // Retrieve flightID from query string

            try
            {
                // Ensure selectedSeat is not empty
                if (!string.IsNullOrEmpty(selectedSeat) && !string.IsNullOrEmpty(flightID))
                {
                    // Save the booking details
                    SaveBooking(departureCity, destinationCity, date, selectedSeat, flightID);

                    // Redirect to FlightSelection page
                    Response.Redirect("FlightSelection.aspx");
                }
                else
                {
                    MessageLabel.Text = "Please select a seat before confirming your booking.";
                }
            }
            catch (Exception ex)
            {
                // Log or handle the error as needed
                MessageLabel.Text = "Error confirming booking: " + ex.Message;
            }
        }

        private void SaveBooking(string departureCity, string destinationCity, string date, string seat, string flightID)
        {
            // Retrieve the connection string from the web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Prepare the SQL query to insert booking details
                string insertQuery = "INSERT INTO ConfirmedBookings (FlightID, DepartureCity, DestinationCity, Date, Seat) " +
                                     "VALUES (@FlightID, @DepartureCity, @DestinationCity, @Date, @Seat)";
                SqlCommand command = new SqlCommand(insertQuery, connection);
                command.Parameters.AddWithValue("@FlightID", flightID);
                command.Parameters.AddWithValue("@DepartureCity", departureCity);
                command.Parameters.AddWithValue("@DestinationCity", destinationCity);
                command.Parameters.AddWithValue("@Date", date);
                command.Parameters.AddWithValue("@Seat", seat);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        protected void UpdateBookingButton_Click(object sender, EventArgs e)
        {
            string newSeat = NewSeatDropdown.SelectedValue;
            string flightID = Request.QueryString["flightID"]; // Ensure you have flightID in your query string

            if (!string.IsNullOrEmpty(newSeat) && !string.IsNullOrEmpty(flightID))
            {
                try
                {
                    // Update the flight with the new seat
                    UpdateFlightSeat(flightID, newSeat);
                    lblCurrentSeat.Text = "Current Seat: " + newSeat;
                    MessageLabel.Text = "Booking updated with new seat: " + newSeat;
                }
                catch (Exception ex)
                {
                    // Log or handle the error as needed
                    MessageLabel.Text = "Error updating booking: " + ex.Message;
                }
            }
            else
            {
                MessageLabel.Text = "Please select a seat to update.";
            }
        }

        private void UpdateFlightSeat(string flightID, string newSeat)
        {
            // Retrieve the connection string from the web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Flights SET Seat = @NewSeat WHERE FlightID = @FlightID";
                SqlCommand command = new SqlCommand(updateQuery, connection);
                command.Parameters.AddWithValue("@NewSeat", newSeat);
                command.Parameters.AddWithValue("@FlightID", flightID);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
