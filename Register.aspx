<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="CollegeComplaintBox.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .register-box {
            width: 350px;
            margin: 70px auto;
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

        .register-btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .message {
            display: block;
            margin-top: 15px;
            text-align: center;
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="register-box">

        <h2>Student Registration</h2>

        <asp:TextBox ID="txtName"
            runat="server"
            CssClass="input-box"
            Placeholder="Enter Name">
        </asp:TextBox>

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

        <asp:TextBox ID="txtConfirmPassword"
            runat="server"
            CssClass="input-box"
            TextMode="Password"
            Placeholder="Confirm Password">
        </asp:TextBox>

        <asp:Button ID="btnRegister"
            runat="server"
            Text="Register"
            CssClass="register-btn"
            OnClick="btnRegister_Click" />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

        <a href="Login.aspx" class="login-link">
            Already have an account? Login
        </a>

    </div>

</form>

</body>
</html>