<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ViewComplaints.aspx.cs"
    Inherits="CollegeComplaintBox.Admin.ViewComplaints" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>View Complaints</title>

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
            width: 95%;
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
            background-color: #343a40;
            color: white;
            padding: 10px;
        }

        .grid td {
            padding: 10px;
            border: 1px solid #ddd;
            vertical-align: middle;
        }

        /* Action column */
        .grid td:last-child {
            min-width: 170px;
            white-space: nowrap;
            text-align: center;
        }

        .update-btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 8px;
        }

        .update-btn:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            display: inline-block;
            background-color: #dc3545;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .delete-btn:hover {
            background-color: #c82333;
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

            <h2>All Complaints</h2>

            <a href="AdminDashboard.aspx" class="back-btn">
                ← Back to Dashboard
            </a>

            <asp:GridView ID="gvComplaints"
                runat="server"
                CssClass="grid"
                AutoGenerateColumns="False"
                EmptyDataText="No complaints found."
                DataKeyNames="ComplaintId"
                OnRowCommand="gvComplaints_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="ComplaintId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="Name"
                        HeaderText="Student Name" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

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

                    <asp:TemplateField HeaderText="Action">

                        <ItemTemplate>

                            <asp:HyperLink
                                ID="lnkUpdate"
                                runat="server"
                                CssClass="update-btn"
                                Text="Update"
                                NavigateUrl='<%# "UpdateComplaint.aspx?id=" + Eval("ComplaintId") %>'>
                            </asp:HyperLink>

                            <asp:LinkButton
                                ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="delete-btn"
                                CommandName="DeleteComplaint"
                                CommandArgument='<%# Eval("ComplaintId") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this complaint?');">
                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

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