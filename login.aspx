<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CollegeComplaintBox.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>College Complaint Box - Login</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .login-box {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #aaa;
        }

        h2 {
            text-align: center;
        }

        .input-box {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        .message {
            display: block;
            margin-top: 15px;
            text-align: center;
        }

        .register-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-box">

        <h2>College Complaint Box</h2>

        <asp:TextBox ID="txtEmail"
            runat="server"
            CssClass="input-box"
            Placeholder="Enter Email">
        </asp:TextBox>

        <asp:TextBox ID="txtPassword"
            runat="server"
            CssClass="input-box"
            TextMode="Password"
            Placeholder="Enter Password">
        </asp:TextBox>

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-btn"
            OnClick="btnLogin_Click" />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <a href="Register.aspx" class="register-link">
            New Student? Create an Account
        </a>

    </div>

</form>

</body>
</html>