using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CollegeComplaintBox
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please enter email and password.";
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
                    SELECT UserId, Name, Role
                    FROM dbo.Users
                    WHERE Email = @Email
                    AND Password = @Password";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["UserId"] =
                        reader["UserId"].ToString();

                    Session["Name"] =
                        reader["Name"].ToString();

                    Session["Role"] =
                        reader["Role"].ToString();

                    string role =
                        reader["Role"].ToString();

                    reader.Close();

                    if (role == "Admin")
                    {
                        Response.Redirect(
                            "Admin/AdminDashboard.aspx");
                    }
                    else if (role == "Student")
                    {
                        Response.Redirect(
                            "Student/StudentDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text =
                            "Invalid user role.";
                    }
                }
                else
                {
                    reader.Close();

                    lblMessage.Text =
                        "Invalid Email or Password.";
                }
            }
        }
    }
}