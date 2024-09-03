using System;
using System.Data; // Assuming you use DataTable or similar for data handling
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airplane
{
    public partial class CancelBooking : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            // Example data loading. Replace with actual data source
            DataTable bookings = new DataTable();
            bookings.Columns.Add("BookingID");
            bookings.Columns.Add("FlightDetails");
            bookings.Columns.Add("BookingDate");

            // Add some sample data
            bookings.Rows.Add("1", "Flight ABC123", "2024-09-01");
            bookings.Rows.Add("2", "Flight XYZ456", "2024-09-15");

            BookingsGridView.DataSource = bookings;
            BookingsGridView.DataBind();
        }

        protected void BookingsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                int bookingId = Convert.ToInt32(e.CommandArgument);
                ProcessCancellation(bookingId);
            }
        }

        private void ProcessCancellation(int bookingId)
        {
            // Implement cancellation logic here, e.g., remove booking from the database
            // For example:
            // BookingManager.CancelBooking(bookingId);

            // Reload bookings to reflect the change
            LoadBookings();
        }
    }
}
