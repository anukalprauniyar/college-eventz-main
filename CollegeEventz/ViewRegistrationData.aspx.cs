using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Drawing;

namespace CollegeEventz
{
    public partial class ViewRegistrationData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                //GridView1.DataSource = SqlDataSourceRegistration;
                //GridView1.DataBind();
  
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSourceRegistration;
            GridView1.DataBind();
            Label10.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.LightGray;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSourceRegistration;
            GridView1.DataBind();
            Label10.Text = "";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            Label Id = GridView1.Rows[e.RowIndex].FindControl("Label9") as Label;
            TextBox eventtitle = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox startdate = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            TextBox enddate = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            TextBox eventtheme = GridView1.Rows[e.RowIndex].FindControl("TextBox11") as TextBox;
            Label department = GridView1.Rows[e.RowIndex].FindControl("Label26") as Label;
            DropDownList quarter = GridView1.Rows[e.RowIndex].FindControl("DropDownList3") as DropDownList;
            TextBox coordinator = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox url = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            FileUpload brochour = GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
            string imgextension = Path.GetExtension(brochour.FileName);
            
            string imgpath;
            if (imgextension == ".pdf" || imgextension == ".jpg" || imgextension == ".jpeg" || imgextension == ".png")
            {
                if (brochour.HasFile)
                {
                    brochour.SaveAs(Server.MapPath("~/Brochour/") + Path.GetFileName(brochour.FileName));
                    imgpath = "Brochour/" + Path.GetFileName(brochour.FileName);
                    string updatedata = "Update EventRegistrationTable set eventtitle='" + eventtitle.Text + "',startdate='" + startdate.Text + "', enddate='" + enddate.Text + "', eventtheme='" + eventtheme.Text + "', quarter='" + quarter.SelectedItem.ToString() + "', coordinator='" + coordinator.Text + "',  url='" + url.Text + "', brochour='" + imgpath + "' where Id='" + Id.Text + "'";
                    SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    connect.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = updatedata;
                    cmd.Connection = connect;
                    cmd.ExecuteNonQuery();
                    Label10.Text = "Data Updated Successfully";
                    Response.Write("<script>alert('Event Updated Successfully!!');</script>");
                    GridView1.EditIndex = -1;
                    SqlDataSourceRegistration.DataBind();
                    GridView1.DataSource = SqlDataSourceRegistration;
                    GridView1.DataBind();
                }
            }
            else { 
                imgpath = Path.GetFileName(brochour.FileName);
                string updatedata = "Update EventRegistrationTable set eventtitle='" + eventtitle.Text + "',startdate='" + startdate.Text + "', enddate='" + enddate.Text + "', eventtheme='" + eventtheme.Text + "', quarter='" + quarter.SelectedItem.ToString() + "', coordinator='" + coordinator.Text + "',  url='" + url.Text + "', brochour='" + imgpath + "' where Id='"+Id.Text+"'";
                SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                connect.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = updatedata;
                cmd.Connection = connect;
                cmd.ExecuteNonQuery();
                Label10.Text = "Data Updated Successfully";
                Response.Write("<script>alert('Event Updated Successfully!!');</script>");
                GridView1.EditIndex = -1;
                SqlDataSourceRegistration.DataBind();
                GridView1.DataSource = SqlDataSourceRegistration;
                GridView1.DataBind();
            }

            }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label Id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
            string updatedata = "delete from EventRegistrationTable where Id="+Id.Text;
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            SqlCommand cmd = new SqlCommand(updatedata,connect);
            //cmd.CommandText = updatedata;
            //cmd.Connection = connect;
            cmd.ExecuteNonQuery();
            Label10.Text = "Data deleted Successfully";
            GridView1.EditIndex = -1;
            SqlDataSourceRegistration.DataBind();
            GridView1.DataSource = SqlDataSourceRegistration;
            GridView1.DataBind();
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            string start = "2021-08-11";// startdate.Text;
            string end = "2022-07-25";// enddate.Text;
            string data = "select * from EventRegistrationTable where startdate>='"+start+"' AND enddate<='"+end+"'";
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            SqlCommand cmd = new SqlCommand(data, connect);
            //cmd.ExecuteNonQuery();
            //SqlDataSourceRegistration.DataBind();
            //GridView1.DataSource = SqlDataSourceRegistration;
            //GridView1.DataBind();


            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = connect;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }



        }



        /*protected void Gvbind()
{
string cs = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
using(SqlConnection con= new SqlConnection(cs))
{
con.Open();
SqlCommand cmd = new SqlCommand("Select brochour from EventRegistrationTable",con);
SqlDataReader dr = cmd.ExecuteReader();
if (dr.HasRows == true)
{
GridView1.DataSource = dr;
GridView1.DataBind();
}

}
}*/
    }
}