using System;
using System.Web.UI;

namespace airplane
{
    public partial class FlightBooking : Page
    {
        // Event handler for the "Search Flights" button
        protected void SearchFlights_Click(object sender, EventArgs e)
        {
            // Fetch input values from the form
            string departureCity = txtDepartureCity.SelectedValue;
            string destinationCity = txtDestinationCity.SelectedValue;
            string date = txtDate.Text;

            // Validate if the inputs are provided
            if (string.IsNullOrEmpty(departureCity) || string.IsNullOrEmpty(destinationCity) || string.IsNullOrEmpty(date))
            {
                // Handle invalid inputs (you can show a message or handle this as needed)
                Response.Write("<script>alert('Please fill in all fields.');</script>");
                return;
            }

            // Perform flight search logic here
            // For demonstration, we’ll just redirect to a "Search Results" page
            Response.Redirect($"SearchResults.aspx?departureCity={departureCity}&destinationCity={destinationCity}&date={date}");
        }

        // Event handler for the "Cancel Booking" button
        protected void CancelBooking_Click(object sender, EventArgs e)
        {
            // Fetch the booking reference input
            string bookingReference = txtBookingReference.Text;

            // Validate if the booking reference is provided
            if (string.IsNullOrEmpty(bookingReference))
            {
                // Handle invalid input (you can show a message or handle this as needed)
                Response.Write("<script>alert('Please provide a booking reference.');</script>");
                return;
            }

            // Perform booking cancellation logic here
            // For demonstration, we’ll just redirect to a cancellation confirmation page
            Response.Redirect($"CancelConfirmation.aspx?bookingReference={bookingReference}");
        }
    }
}
