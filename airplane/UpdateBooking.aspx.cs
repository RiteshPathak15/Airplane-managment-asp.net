using System;
using System.Web.UI;

namespace airplane
{
    public partial class UpdateBooking : Page
    {
protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialization code here, e.g., fetching existing flight details for editing.
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Capture the input values
            string flightNumber = txtFlightNumber.Text.Trim();
            string flightTime = txtFlightTime.Text.Trim();
            string flightPrice = txtFlightPrice.Text.Trim();
            string emissions = txtEmissions.Text.Trim();
            string eCash = txtECash.Text.Trim();

            // Validate inputs (add your validation logic here)

            // Update flight details in the database or perform other actions

            // Example: Show a message on successful update
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Flight details updated successfully!');", true);

            // Optionally, redirect to another page
            // Response.Redirect("FlightList.aspx");
        }
    }
}
