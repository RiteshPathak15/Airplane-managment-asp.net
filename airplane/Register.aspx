<%@ Page Title="Register Page" Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="airplane.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://thumbs.dreamstime.com/b/airplane-soaring-dusky-sky-over-river-sunset-dusk-fluffy-clouds-painting-atmosphere-horizon-stunning-314160082.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        .register-container {
            width: 80vh;
            height: 60vh;
            margin: 100px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
        }
        .register-container .welcome {
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
        .register-container .register-form {
            width: 100%;
            padding: 30px;
        }
        .register-form h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .register-form input[type="text"],
        .register-form input[type="email"],
        .register-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .register-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #00AEEF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .register-form input[type="submit"]:hover {
            background: #007bb5;
        }
        .register-form .login-link {
            text-align: center;
            margin-top: 10px;
        }
        .register-form .login-link a {
            color: #00AEEF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <div class="welcome">
                <div>
                    <h2>Join Us</h2>
                    <p>Create an account to enjoy our services and stay connected.</p>
                </div>
            </div>
            <div class="register-form">
                <h2>Register</h2>
                <asp:TextBox ID="Username" runat="server" type="text" placeholder="Username" CssClass="form-control" />
                <asp:TextBox ID="Email" runat="server" type="email" placeholder="Email" CssClass="form-control" />
                <asp:TextBox ID="Password" runat="server" type="password" placeholder="Password" CssClass="form-control" />
                <asp:TextBox ID="ConfirmPassword" runat="server" type="password" placeholder="Confirm Password" CssClass="form-control" />
                <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" CssClass="btn btn-primary" />
                <div class="login-link">
                                       Already have an account? <asp:LinkButton ID="LoginLink" runat="server" PostBackUrl="~/Login.aspx">Login</asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
