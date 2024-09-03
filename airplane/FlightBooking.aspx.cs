using System;
using System.Web.UI;

namespace airplane
{
    public partial class FlightBooking : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any page load logic here, if needed.
        }

        protected void SearchFlights_Click(object sender, EventArgs e)
        {
            // Code to handle search button click event.
            string departureCity = txtDepartureCity.Text;
            string destinationCity = txtDestinationCity.Text;
            string date = txtDate.Text;
            Response.Redirect("~/FlightSelection.aspx");

            // You can add your logic to process the search here.
            // For example, you might store the values in session variables, query a database, etc.
        }

        protected void CancelBooking_Click(object sender, EventArgs e)
        {
            // Code to handle the cancel booking button click event.
            string bookingReference = txtBookingReference.Text;

            // Add logic to process the cancellation here.
            // For example, validate the booking reference, remove the booking from the database, etc.

            // Redirect or provide feedback to the user.
            Response.Redirect("~/CancelBooking.aspx");
        }
    }
}
