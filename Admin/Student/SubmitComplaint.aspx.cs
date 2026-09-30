using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CollegeComplaintBox.Student
{
    public partial class SubmitComplaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null ||
                Session["Role"] == null ||
                Session["Role"].ToString() != "Student")
            {
                Response.Redirect("../Login.aspx");
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "")
            {
                lblMessage.Text = "Please select a category.";
                return;
            }

            if (txtSubject.Text.Trim() == "")
            {
                lblMessage.Text = "Please enter the subject.";
                return;
            }

            if (txtDescription.Text.Trim() == "")
            {
                lblMessage.Text = "Please enter the complaint description.";
                return;
            }

            string connectionString =
                ConfigurationManager.ConnectionStrings[
                    "CollegeComplaintBoxDB"
                ].ConnectionString;

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO Complaints
                    (UserId, Category, Subject, Description, Status)
                    VALUES
                    (@UserId, @Category, @Subject, @Description, 'Pending')";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"]));

                cmd.Parameters.AddWithValue(
                    "@Category",
                    ddlCategory.SelectedValue);

                cmd.Parameters.AddWithValue(
                    "@Subject",
                    txtSubject.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Description",
                    txtDescription.Text.Trim());

                con.Open();

                cmd.ExecuteNonQuery();

                lblMessage.Text =
                    "Complaint submitted successfully!";

                ddlCategory.SelectedIndex = 0;
                txtSubject.Text = "";
                txtDescription.Text = "";
            }
        }
    }
}