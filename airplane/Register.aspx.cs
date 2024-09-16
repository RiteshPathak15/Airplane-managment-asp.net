using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace airplane
{
    public partial class Register : System.Web.UI.Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string username = Username.Text;
            string email = Email.Text;
            string password = Password.Text;
            string confirmPassword = ConfirmPassword.Text;

            if (password != confirmPassword)
            {
                // Passwords do not match
                // Handle error (e.g., show a message to the user)
                return;
            }

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["FlightBookingDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Users (Username, Email, Password) VALUES (@Username, @Email, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // No hashing
                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect to login page or show success message
            Response.Redirect("Login.aspx");
        }
    
}
}
