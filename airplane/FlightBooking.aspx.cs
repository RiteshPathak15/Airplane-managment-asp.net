using System;
using System.Data.SqlClient;
using System.Web;
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
            // Check if both departure and destination cities and date are selected
            if (string.IsNullOrEmpty(txtDepartureCity.SelectedValue) ||
                string.IsNullOrEmpty(txtDestinationCity.SelectedValue) ||
                string.IsNullOrEmpty(txtDate.Text))
            {
                // Handle error: Ensure all fields are selected
                Response.Write("<script>alert('Please select both departure and destination cities, and enter a date.');</script>");
                return;
            }

            // Retrieve selected values
            string departureCity = txtDepartureCity.SelectedValue;
            string destinationCity = txtDestinationCity.SelectedValue;
            string date = txtDate.Text; // Date as string

            // Set up the query to fetch flights from the Flights table
            string query = "SELECT FlightID, FlightNumber, DepartureCity, ArrivalCity, Date, Duration, Price, Emissions, ECash " +
                           "FROM Flights WHERE DepartureCity = @DepartureCity AND ArrivalCity = @DestinationCity AND Date = @Date";

            // Get the connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            // Use SqlConnection and SqlCommand to retrieve flight data
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@DepartureCity", departureCity);
                        cmd.Parameters.AddWithValue("@DestinationCity", destinationCity);
                        cmd.Parameters.AddWithValue("@Date", date);

                        // Execute the query and bind the result to the GridView
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                        else
                        {
                            // Handle no results found
                            Response.Write("<script>alert('No flights found for the selected criteria.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors during the database query
                    Response.Write("<script>alert('Error occurred while searching for flights: " + ex.Message + "');</script>");
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Confirm")
            {
                // Get the index of the row that triggered the command
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];

                // Retrieve FlightID from the selected row
                string flightID = GridView1.DataKeys[rowIndex].Value.ToString();

                // Process booking confirmation
                ConfirmBooking(flightID);
            }
        }
       

        private bool CancelBooking(string bookingReference)
        {
            // Implement the logic to cancel the booking
            // This could involve querying the database and updating records

            // For demonstration purposes, return true
            // Replace this with actual cancellation logic
            return true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve form values
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string message = txtMessage.Text.Trim();

            // Validate form values
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(message))
            {
                // Handle validation error
                MessageLabel.Text = "Please fill in all fields.";
                return;
            }

            // Insert data into database
            string query = "INSERT INTO ContactUs (FirstName, LastName, Email, Phone, Message) " +
                           "VALUES (@FirstName, @LastName, @Email, @Phone, @Message)";

            // Get the connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Phone", phone);
                        cmd.Parameters.AddWithValue("@Message", message);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Successful submission
                            MessageLabel.Text = "Thank you for contacting us. We will get back to you soon.";
                            // Optionally, clear form fields
                            txtFirstName.Text = "";
                            txtLastName.Text = "";
                            txtEmail.Text = "";
                            txtPhone.Text = "";
                            txtMessage.Text = "";
                        }
                        else
                        {
                            // Handle error
                            MessageLabel.Text = "An error occurred while submitting your contact information. Please try again.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors during the database query
                    MessageLabel.Text = "Error occurred while submitting contact form: " + ex.Message;
                }
            }
        }

        private void ConfirmBooking(string flightID)
        {
            // Here, you would typically handle the booking confirmation, such as inserting into a booking table
            // For now, just redirect to BookingConfirmation page with query string parameters

            // Get selected values from controls
            string departureCity = txtDepartureCity.SelectedValue;
            string destinationCity = txtDestinationCity.SelectedValue;
            string date = txtDate.Text;

            // Retrieve price for the selected flight
            string price = string.Empty;
            string query = "SELECT Price FROM Flights WHERE FlightID = @FlightID";

            // Get the connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FlightID", flightID);
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            price = Convert.ToDecimal(result).ToString("0.00");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors during the database query
                    Response.Write("<script>alert('Error occurred while retrieving price: " + ex.Message + "');</script>");
                    return;
                }
            }

            // Ensure all fields are selected
            if (string.IsNullOrEmpty(departureCity) || string.IsNullOrEmpty(destinationCity) || string.IsNullOrEmpty(date) || string.IsNullOrEmpty(price))
            {
                // Handle error: Ensure all fields are selected
                Response.Write("<script>alert('Please select departure city, destination city, date, and ensure price is available.');</script>");
                return;
            }

            // Redirect to BookingConfirmation page with query string parameters
            Response.Redirect("BookingConfirmation.aspx?flightID=" + flightID +
                   "&departureCity=" + HttpUtility.UrlEncode(departureCity) +
                   "&destinationCity=" + HttpUtility.UrlEncode(destinationCity) +
                   "&date=" + date +
                   "&price=" + price);
        }

    }
}
