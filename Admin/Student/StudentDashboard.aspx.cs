using System;

namespace CollegeComplaintBox.Student
{
    public partial class StudentDashboard : System.Web.UI.Page
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
                lblName.Text = Session["Name"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Login.aspx");
        }
    }
}