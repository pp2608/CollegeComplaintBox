using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CollegeComplaintBox
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Check name
            if (txtName.Text.Trim() == "")
            {
                lblMessage.Text = "Please enter your name.";
                return;
            }

            // Check email
            if (txtEmail.Text.Trim() == "")
            {
                lblMessage.Text = "Please enter your email.";
                return;
            }

            // Check password
            if (txtPassword.Text.Trim() == "")
            {
                lblMessage.Text = "Please enter a password.";
                return;
            }

            // Check confirm password
            if (txtConfirmPassword.Text.Trim() == "")
            {
                lblMessage.Text = "Please confirm your password.";
                return;
            }

            // Check passwords match
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            string connectionString =
                ConfigurationManager.ConnectionStrings[
                    "CollegeComplaintBoxDB"
                ].ConnectionString;

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                // Check if email already exists
                string checkQuery =
                    "SELECT COUNT(*) FROM Users WHERE Email=@Email";

                SqlCommand checkCmd =
                    new SqlCommand(checkQuery, con);

                checkCmd.Parameters.AddWithValue(
                    "@Email",
                    txtEmail.Text.Trim());

                con.Open();

                int count =
                    Convert.ToInt32(checkCmd.ExecuteScalar());

                if (count > 0)
                {
                    lblMessage.Text =
                        "Email already registered.";

                    return;
                }

                // Insert new student
                string query = @"
                    INSERT INTO Users
                    (Name, Email, Password, Role)
                    VALUES
                    (@Name, @Email, @Password, 'Student')";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@Name",
                    txtName.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Email",
                    txtEmail.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Password",
                    txtPassword.Text.Trim());

                cmd.ExecuteNonQuery();

                lblMessage.Text =
                    "Registration successful! You can now login.";

                txtName.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }
    }
}