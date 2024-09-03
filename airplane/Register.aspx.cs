using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airplane
{
    public partial class Register : Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string username = Username.Text;
            string email = Email.Text;
            string password = Password.Text;
            string confirmPassword = ConfirmPassword.Text;

            // Add your registration logic here
        }

    }
}