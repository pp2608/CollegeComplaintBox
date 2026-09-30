using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CollegeComplaintBox.Admin
{
    public partial class UpdateComplaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null ||
                Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("../Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadComplaint();
            }
        }

        private void LoadComplaint()
        {
            if (Request.QueryString["id"] == null)
            {
                lblMessage.Text = "Complaint ID not found.";
                return;
            }

            int complaintId;

            if (!int.TryParse(
                Request.QueryString["id"],
                out complaintId))
            {
                lblMessage.Text = "Invalid complaint ID.";
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
                    SELECT ComplaintId,
                           Subject,
                           Description,
                           Status,
                           AdminResponse
                    FROM dbo.Complaints
                    WHERE ComplaintId = @ComplaintId";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@ComplaintId",
                    complaintId);

                con.Open();

                SqlDataReader reader =
                    cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtComplaintId.Text =
                        reader["ComplaintId"].ToString();

                    txtSubject.Text =
                        reader["Subject"].ToString();

                    txtDescription.Text =
                        reader["Description"].ToString();

                    ddlStatus.SelectedValue =
                        reader["Status"].ToString();

                    if (reader["AdminResponse"] != DBNull.Value)
                    {
                        txtResponse.Text =
                            reader["AdminResponse"].ToString();
                    }
                }
                else
                {
                    lblMessage.Text =
                        "Complaint not found.";
                }

                reader.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                lblMessage.Text = "Complaint ID not found.";
                return;
            }

            int complaintId;

            if (!int.TryParse(
                Request.QueryString["id"],
                out complaintId))
            {
                lblMessage.Text = "Invalid complaint ID.";
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
                    UPDATE dbo.Complaints
                    SET Status = @Status,
                        AdminResponse = @AdminResponse,
                        UpdatedDate = GETDATE()
                    WHERE ComplaintId = @ComplaintId";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@Status",
                    ddlStatus.SelectedValue);

                cmd.Parameters.AddWithValue(
                    "@AdminResponse",
                    txtResponse.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@ComplaintId",
                    complaintId);

                con.Open();

                cmd.ExecuteNonQuery();

                lblMessage.Text =
                    "Complaint updated successfully!";
            }
        }
    }
}