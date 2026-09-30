<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminDashboard.aspx.cs"
    Inherits="CollegeComplaintBox.Admin.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            font-family: Arial;
            margin: 0;
            background-color: #f4f6f8;
        }

        .header {
            background-color: #343a40;
            color: white;
            padding: 20px;
        }

        .container {
            width: 85%;
            margin: 30px auto;
        }

        .card {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ccc;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }

        .logout {
            background-color: #dc3545;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="header">
        <h2>College Complaint Box - Admin</h2>
    </div>

    <div class="container">

        <div class="card">

            <h2>Welcome, <asp:Label ID="lblName" runat="server"></asp:Label></h2>

            <p>Admin Dashboard</p>

            <hr />

            <h3>Complaint Management</h3>

            <br />

            <a href="ViewComplaints.aspx" class="btn">
                View All Complaints
            </a>

            <asp:Button ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="btn logout"
                OnClick="btnLogout_Click" />

        </div>

    </div>

</form>

</body>
</html>