using System;
using System.Web.UI;

namespace airplane
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Code that runs on initial page load
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Retrieve email and password values
            string email = Email.Text;
            string password = Password.Text;

            // Example logic for user authentication
            // Replace this with actual authentication logic, such as checking against a database
            if (email == "test@example.com" && password == "password123")
            {
                // Redirect to another page on successful login
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Show error message if login fails
                Response.Write("<script>alert('Invalid email or password.');</script>");
            }
        }
    }
}
