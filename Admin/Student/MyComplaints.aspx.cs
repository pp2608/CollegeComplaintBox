using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CollegeComplaintBox.Student
{
    public partial class MyComplaints : System.Web.UI.Page
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
                        ComplaintId,
                        Category,
                        Subject,
                        Description,
                        ComplaintDate,
                        Status,
                        AdminResponse
                    FROM dbo.Complaints
                    WHERE UserId = @UserId
                    ORDER BY ComplaintDate DESC";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"]));

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvComplaints.DataSource = dt;
                gvComplaints.DataBind();
            }
        }
    }
}