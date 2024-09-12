using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls; // Add this namespace

namespace airplane
{
    public partial class FlightSelection : System.Web.UI.Page
    {

        // Flight class to hold flight information
        public class Flight
        {
            public string FlightNumber { get; set; }
            public string DepartureTime { get; set; }
            public string ArrivalTime { get; set; }
            public string Duration { get; set; }
            public string Price { get; set; }
            public string Emissions { get; set; }
            public string ECash { get; set; }
            public string Deal { get; set; }
        }

        // Page load event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the flight data
                List<Flight> flights = new List<Flight>
                {
                    new Flight { FlightNumber = "IX-2784", DepartureTime = "20:55", ArrivalTime = "23:25", Duration = "2h 30m Non-Stop", Price = "₹3,596", Emissions = "164 Kg CO2", ECash = "₹250", Deal = "Get Flat 12% OFF on ICICI Bank Debit Cards. Use Code - YRICICIDC" },
                    // Add more flight details as needed
                };

                // Bind the flight data to the repeater control
                FlightRepeater.DataSource = flights;
                FlightRepeater.DataBind();
            }
        }

        protected void btnApplyCoupon_Click(object sender, EventArgs e)
        {
            // Retrieve the entered coupon code
            string couponCode = txtCouponCode.Text.Trim();


        }

       protected void btnConfirmBooking_Click(object sender, EventArgs e)
{
    // Retrieve the entered coupon code (if needed)
    string couponCode = txtCouponCode.Text.Trim();

    // Perform booking confirmation logic here
    // For example, save the booking to the database

    // Register a JavaScript alert
    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your booking has been confirmed! Thank you.');", true);
}


    }
}