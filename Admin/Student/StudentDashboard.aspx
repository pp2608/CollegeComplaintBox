<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StudentDashboard.aspx.cs"
    Inherits="CollegeComplaintBox.Student.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Student Dashboard</title>

    <style>

        body {
            font-family: Arial;
            margin: 0;
            background-color: #f4f6f8;
        }

        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
        }

        .container {
            width: 80%;
            margin: 30px auto;
        }

        .card {
            background-color: white;
            padding: 25px;
            margin: 15px 0;
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

        <h2>College Complaint Box</h2>

    </div>

    <div class="container">

        <div class="card">

            <h2>
                Welcome,
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </h2>

            <p>Student Dashboard</p>

            <br />

            <a href="SubmitComplaint.aspx" class="btn">
                Submit Complaint
            </a>

            <a href="MyComplaints.aspx" class="btn">
                My Complaints
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