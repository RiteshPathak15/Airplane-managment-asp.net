<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="airplane.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://thumbs.dreamstime.com/b/airplane-soaring-dusky-sky-over-river-sunset-dusk-fluffy-clouds-painting-atmosphere-horizon-stunning-314160082.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .login-container {
            width: 80vh;
            height:50vh;
            margin: 100px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
        }
        .login-container .welcome {
           width: 100%;
background: url('https://img.freepik.com/free-photo/planes-wing-cuts-through-sky-cotton-candy-clouds-during-radiant-sunset_91128-4456.jpg') ;
background-size: cover;
            padding: 30px;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .login-container .login-form {
            width: 100%;
            padding: 30px;
        }
        .login-form h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .login-form input[type="email"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .login-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #00AEEF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-form input[type="submit"]:hover {
            background: #007bb5;
        }
        .login-form .forgot-password {
            text-align: right;
            margin-top: 10px;
        }
        .login-form .signup {
            text-align: center;
            margin-top: 10px;
        }
        .login-form .signup a {
            color: #00AEEF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="welcome">
                <div>
                    <h2>Welcome Back</h2>
                    <p>Please log in using your personal information to stay connected with us.</p>
                </div>
            </div>
            <div class="login-form">
                <h2>Login</h2>
                <asp:TextBox ID="Email" runat="server" type="email" placeholder="Email" CssClass="form-control" />
                <asp:TextBox ID="Password" runat="server" type="password" placeholder="Password" CssClass="form-control" />
                <asp:LinkButton ID="ForgotPassword" runat="server" CssClass="forgot-password">Forgot password?</asp:LinkButton> <br/><br />
                <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" CssClass="btn btn-primary" />
                <div class="signup">
                    Don't have an account? <asp:LinkButton ID="SignupLink" runat="server" PostBackUrl="~/FlightBooking.aspx" >Signup</asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

