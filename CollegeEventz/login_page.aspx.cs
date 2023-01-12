using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace CollegeEventz
{
    public partial class login_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                string uid = username.Text.Replace("-","");
                string pass = password.Text.Replace("-","");
                //Response.Write(uid+"\t"+pass);
                con.Open();
                string checkuser = "select Replace(employeecode,'-','') from FacultyDataTable where Replace(employeecode,'-','') ='" + uid +"' ";

                SqlCommand com1 = new SqlCommand(checkuser, con);
                string temp = com1.ExecuteScalar().ToString();
                Response.Write(temp);
                con.Close();
                if (temp == uid)
                {
                    con.Open();
                    //string checkpass = "select employeecode from FacultyDataTable where Name='" + uid + "'";
                    //SqlCommand com = new SqlCommand(checkpass, con);
                    //string Password  = com.ExecuteScalar().ToString();
                    string user = "select Name from FacultyDataTable where Replace(employeecode,'-','') ='" + uid + "' ";
                    SqlCommand com2 = new SqlCommand(user, con);
                    string Username = com2.ExecuteScalar().ToString();
                    con.Close();
                    if (temp == pass)
                    {
                        Session["New"] = Username;

                        Response.Redirect("Register_Event.aspx");
                        Response.Write("<script>alert('Login Successfully!!');</script>");

                    }
                    else
                    {
                       
                        msg.Text = "Password is Not Correct";
                        msg.ForeColor = System.Drawing.Color.Red;
                    }

                }
                else
                {
                    msg1.Text = "Username is Not Correct";
                    msg1.ForeColor = System.Drawing.Color.Red;
                    //Response.Write("Username is Not Correct");
                }
                //con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}