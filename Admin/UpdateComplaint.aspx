<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="UpdateComplaint.aspx.cs"
    Inherits="CollegeComplaintBox.Admin.UpdateComplaint" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Update Complaint</title>

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
            width: 60%;
            margin: 30px auto;
        }

        .card {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ccc;
        }

        .label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        .input {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            box-sizing: border-box;
        }

        .btn {
            padding: 12px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 18px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .message {
            display: block;
            margin-top: 15px;
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

            <h2>Update Complaint</h2>

            <a href="ViewComplaints.aspx" class="back-btn">
                ← Back to Complaints
            </a>

            <asp:Label ID="lblComplaintId"
                runat="server"
                CssClass="label"
                Text="Complaint ID">
            </asp:Label>

            <asp:TextBox ID="txtComplaintId"
                runat="server"
                CssClass="input"
                ReadOnly="true">
            </asp:TextBox>

            <asp:Label ID="lblSubject"
                runat="server"
                CssClass="label"
                Text="Subject">
            </asp:Label>

            <asp:TextBox ID="txtSubject"
                runat="server"
                CssClass="input"
                ReadOnly="true">
            </asp:TextBox>

            <asp:Label ID="lblDescription"
                runat="server"
                CssClass="label"
                Text="Description">
            </asp:Label>

            <asp:TextBox ID="txtDescription"
                runat="server"
                CssClass="input"
                TextMode="MultiLine"
                Rows="5"
                ReadOnly="true">
            </asp:TextBox>

            <asp:Label ID="lblStatus"
                runat="server"
                CssClass="label"
                Text="Status">
            </asp:Label>

            <asp:DropDownList ID="ddlStatus"
                runat="server"
                CssClass="input">

                <asp:ListItem Text="Pending" Value="Pending" />
                <asp:ListItem Text="In Progress" Value="In Progress" />
                <asp:ListItem Text="Resolved" Value="Resolved" />

            </asp:DropDownList>

            <asp:Label ID="lblResponse"
                runat="server"
                CssClass="label"
                Text="Admin Response">
            </asp:Label>

            <asp:TextBox ID="txtResponse"
                runat="server"
                CssClass="input"
                TextMode="MultiLine"
                Rows="5"
                Placeholder="Enter response for the student">
            </asp:TextBox>

            <asp:Button ID="btnUpdate"
                runat="server"
                Text="Update Complaint"
                CssClass="btn"
                OnClick="btnUpdate_Click" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</form>

</body>

</html>