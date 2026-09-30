<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="MyComplaints.aspx.cs"
    Inherits="CollegeComplaintBox.Student.MyComplaints" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>My Complaints</title>

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
            width: 90%;
            margin: 30px auto;
        }

        .card {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px #ccc;
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

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background-color: #007bff;
            color: white;
            padding: 12px;
        }

        .grid td {
            padding: 12px;
            border: 1px solid #ddd;
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

            <h2>My Complaints</h2>

            <a href="StudentDashboard.aspx" class="back-btn">
                ← Back to Dashboard
            </a>

            <asp:GridView ID="gvComplaints"
                runat="server"
                CssClass="grid"
                AutoGenerateColumns="False"
                EmptyDataText="No complaints found.">

                <Columns>

                    <asp:BoundField
                        DataField="ComplaintId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="Subject"
                        HeaderText="Subject" />

                    <asp:BoundField
                        DataField="Description"
                        HeaderText="Description" />

                    <asp:BoundField
                        DataField="ComplaintDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:BoundField
                        DataField="Status"
                        HeaderText="Status" />

                    <asp:BoundField
                        DataField="AdminResponse"
                        HeaderText="Admin Response" />

                </Columns>

            </asp:GridView>

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</form>

</body>

</html>