using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace airplane
{
    public partial class FlightSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindConfirmedBookings();
            }
        }

        private void BindConfirmedBookings()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM ConfirmedBookings";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    gvConfirmedBookings.DataSource = dataTable;
                    gvConfirmedBookings.DataBind();
                }
            }
        }

        protected void gvConfirmedBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelBooking")
            {
                // Get the index of the row
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvConfirmedBookings.Rows[index];

                // Get the BookingID from the row
                string bookingID = row.Cells[0].Text;

                // Delete the booking
                DeleteBooking(bookingID);

                // Rebind the GridView
                BindConfirmedBookings();
            }
        }

        private void DeleteBooking(string bookingID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM ConfirmedBookings WHERE BookingID = @BookingID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@BookingID", bookingID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
