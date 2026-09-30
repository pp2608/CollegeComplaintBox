using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CollegeComplaintBox.Admin
{
    public partial class ViewComplaints : System.Web.UI.Page
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
                LoadComplaints();
            }
        }

        private void LoadComplaints()
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                    "CollegeComplaintBoxDB"
                ].ConnectionString;

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        c.ComplaintId,
                        u.Name,
                        u.Email,
                        c.Category,
                        c.Subject,
                        c.Description,
                        c.ComplaintDate,
                        c.Status,
                        c.AdminResponse
                    FROM dbo.Complaints c
                    INNER JOIN dbo.Users u
                        ON c.UserId = u.UserId
                    ORDER BY c.ComplaintDate DESC";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvComplaints.DataSource = dt;
                gvComplaints.DataBind();
            }
        }

        protected void gvComplaints_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteComplaint")
            {
                int complaintId;

                if (!int.TryParse(
                    e.CommandArgument.ToString(),
                    out complaintId))
                {
                    lblMessage.Text =
                        "Invalid complaint ID.";
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
                        DELETE FROM dbo.Complaints
                        WHERE ComplaintId = @ComplaintId";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue(
                        "@ComplaintId",
                        complaintId);

                    con.Open();

                    int rows =
                        cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        lblMessage.Text =
                            "Complaint deleted successfully!";

                        LoadComplaints();
                    }
                    else
                    {
                        lblMessage.Text =
                            "Complaint not found.";
                    }
                }
            }
        }
    }
}