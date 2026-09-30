<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="SubmitComplaint.aspx.cs"
    Inherits="CollegeComplaintBox.Student.SubmitComplaint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit Complaint</title>

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
            width: 60%;
            margin: 30px auto;
        }

        .card {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ccc;
        }

        .input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 18px 0;
            box-sizing: border-box;
        }

        .btn {
            padding: 12px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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
        <h2>College Complaint Box</h2>
    </div>

    <div class="container">

        <div class="card">

            <h2>Submit Complaint</h2>

            <asp:Label ID="lblCategory" runat="server"
                Text="Complaint Category">
            </asp:Label>

            <asp:DropDownList ID="ddlCategory"
                runat="server"
                CssClass="input">

                <asp:ListItem Text="-- Select Category --" Value="" />
                <asp:ListItem Text="Faculty" Value="Faculty" />
                <asp:ListItem Text="Computer Lab" Value="Computer Lab" />
                <asp:ListItem Text="Library" Value="Library" />
                <asp:ListItem Text="Cleanliness" Value="Cleanliness" />
                <asp:ListItem Text="Canteen" Value="Canteen" />
                <asp:ListItem Text="Transportation" Value="Transportation" />
                <asp:ListItem Text="Infrastructure" Value="Infrastructure" />
                <asp:ListItem Text="Other" Value="Other" />

            </asp:DropDownList>


            <asp:Label ID="lblSubject" runat="server"
                Text="Subject">
            </asp:Label>

            <asp:TextBox ID="txtSubject"
                runat="server"
                CssClass="input"
                Placeholder="Enter complaint subject">
            </asp:TextBox>


            <asp:Label ID="lblDescription" runat="server"
                Text="Description">
            </asp:Label>

            <asp:TextBox ID="txtDescription"
                runat="server"
                CssClass="input"
                TextMode="MultiLine"
                Rows="6"
                Placeholder="Describe your complaint">
            </asp:TextBox>


            <asp:Button ID="btnSubmit"
                runat="server"
                Text="Submit Complaint"
                CssClass="btn"
                OnClick="btnSubmit_Click" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</form>

</body>
</html>