using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airplane
{
    public partial class FlightBooking : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initial setup can go here
            }
        }

        protected void SearchFlights_Click(object sender, EventArgs e)
        {
            // Check if both departure and destination are selected
            if (string.IsNullOrEmpty(txtDepartureCity.SelectedValue) || string.IsNullOrEmpty(txtDestinationCity.SelectedValue))
            {
                // Handle error: Ensure both cities are selected
                Response.Write("<script>alert('Please select both departure and destination cities.');</script>");
                return;
            }

            // Perform flight search by rebinding GridView
            GridView1.DataBind();
        }

        protected void CancelBooking_Click(object sender, EventArgs e)
        {
            string bookingReference = txtBookingReference.Text.Trim();

            if (string.IsNullOrEmpty(bookingReference))
            {
                // Display error message if booking reference is not provided
                Response.Write("<script>alert('Please enter a valid booking reference.');</script>");
                return;
            }

            // Cancel booking logic using booking reference
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["airplane_listConnectionString2"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    // Query to cancel booking based on booking reference
                    string query = "DELETE FROM bookings WHERE BookingReference = @BookingReference";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@BookingReference", bookingReference);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Booking has been cancelled successfully.');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('No booking found with the provided reference.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error occurred while cancelling the booking: " + ex.Message + "');</script>");
                }
            }
        }

        protected void ConfirmBooking_Click(object sender, EventArgs e)
        {
            // Get selected values from controls
            string departureCity = txtDepartureCity.SelectedValue;
            string destinationCity = txtDestinationCity.SelectedValue;
            string date = txtDate.Text;

            // Ensure all fields are selected
            if (string.IsNullOrEmpty(departureCity) || string.IsNullOrEmpty(destinationCity) || string.IsNullOrEmpty(date))
            {
                // Handle error: Ensure all fields are selected
                Response.Write("<script>alert('Please select departure city, destination city, and date.');</script>");
                return;
            }

            // Redirect to BookingConfirmation page with query string parameters using string concatenation
            Response.Redirect("BookingConfirmation.aspx?departureCity=" + departureCity + "&destinationCity=" + destinationCity + "&date=" + date);
        }
    }
}
