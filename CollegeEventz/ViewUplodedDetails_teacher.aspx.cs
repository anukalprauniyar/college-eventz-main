using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace CollegeEventz
{
    public partial class ViewUplodedDetails_teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = SqlDataSourceupload;
            GridView1.DataBind();
                     
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSourceupload;
            GridView1.DataBind();
            Label10.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSourceupload;
            GridView1.DataBind();
            Label10.Text = "";
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
            Label Id = GridView1.Rows[e.RowIndex].FindControl("Label9") as Label;
            Label name = GridView1.Rows[e.RowIndex].FindControl("Label20") as Label;
            TextBox username = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;

            FileUpload details = GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
            FileUpload images = GridView1.Rows[e.RowIndex].FindControl("FileUpload2") as FileUpload;
            string pathToCreate = "~/EventImages/" + name.Text;
            if (!Directory.Exists(Server.MapPath(pathToCreate)))
            {
                Directory.CreateDirectory(Server.MapPath(pathToCreate));
            }
            string detail_filepath = details.PostedFile.FileName;//getting the file path
            string detail_filename = Path.GetFileName(detail_filepath);//getting the file name
            string detail_extension = Path.GetExtension(detail_filename);//getting the file extension
            string imgextension = Path.GetExtension(images.FileName);
            string type = String.Empty;
            string imgpath;
            if (detail_extension == ".pdf")
            {
                
                if (details.HasFile)
                {
                    details.SaveAs(Server.MapPath("~/EventDetails(Pdf File)/") + detail_filename);
                }
                if (imgextension == ".jpg" || imgextension == ".jpeg" || imgextension == ".png")
                {

                    if (images.HasFile)
                    {
                        string pdfpath = "EventDetails(Pdf File)/" + detail_filename;
                        foreach (HttpPostedFile file in images.PostedFiles)
                        {
                            string imgname = Path.GetFileName(file.FileName);
                            file.SaveAs(Server.MapPath("~/EventImages" + "/" + name.Text + "/") + imgname);
                        }
                        imgpath = "~/EventImages" + "/" + name.Text + "/";
                        string updatedata = "Update EventDetailsTable set username='" + username.Text+ "', eventdetails='" + pdfpath + "', eventimage='" + imgpath + "' where Id='" + Id.Text + "'";
                        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                        connect.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = updatedata;
                        cmd.Connection = connect;
                        cmd.ExecuteNonQuery();
                        connect.Close();
                        
                        Label10.Text = "Data Updated Successfully";
                        Response.Write("<script>alert('Event Updated Successfully!!');</script>");
                        GridView1.EditIndex = -1;
                        SqlDataSourceupload.DataBind();
                        GridView1.DataSource = SqlDataSourceupload;
                        GridView1.DataBind();
                    }
                }
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label Id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
            string updatedata = "delete from EventDetailsTable where Id=" + Id.Text;
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            SqlCommand cmd = new SqlCommand(updatedata, connect);
            //cmd.CommandText = updatedata;
            //cmd.Connection = connect;
            cmd.ExecuteNonQuery();
            Label10.Text = "Data deleted Successfully";
            GridView1.EditIndex = -1;
            SqlDataSourceupload.DataBind();
            GridView1.DataSource = SqlDataSourceupload;
            GridView1.DataBind();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}