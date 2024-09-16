using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace airplane
{
    public partial class Login : System.Web.UI.Page
    {
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = Email.Text;
            string password = Password.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); 

                    int userCount = (int)cmd.ExecuteScalar();

                    if (userCount > 0)
                    {
                        // Redirect to a dashboard or home page
                        Response.Redirect("FlightBooking.aspx");
                    }
                    else
                    {
                        // Invalid credentials

                    }
                }
            }
        }
    }
}
