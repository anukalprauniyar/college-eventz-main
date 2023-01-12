using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace CollegeEventz
{
    public partial class UploadDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                username.Text = Session["New"].ToString();
            }
            else
            {
                Response.Redirect("login_page.aspx");
            }
            string pathToCreate = "~/EventImages/" + eventname.Text;
            if (!Directory.Exists(Server.MapPath(pathToCreate)))
            {
                Directory.CreateDirectory(Server.MapPath(pathToCreate));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string detail_filepath = detailevent.PostedFile.FileName;//getting the file path
                string detail_filename = Path.GetFileName(detail_filepath);//getting the file name
                string detail_extension = Path.GetExtension(detail_filename);//getting the file extension
                string imgextension = Path.GetExtension(imageevent.FileName);
                string imgpath;
                string type = String.Empty;
                SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                //connect.Open();
                if (detail_extension == ".pdf")
                {
                    /*switch(extension)// this switch code validate the files which allow to upload only PDf
                    {
                        case ".pdf":
                            type = "application/pdf";
                            break;
                    }*/
                    if (detailevent.HasFile)
                    {
                        detailevent.SaveAs(Server.MapPath("~/EventDetails(Pdf File)/") + detail_filename);
                    }
                    if (imgextension == ".jpg" || imgextension == ".jpeg" || imgextension == ".png")
                    {

                        if (imageevent.HasFile)
                        {
                            string pdfpath = "EventDetails(Pdf File)/" + detail_filename;

                            connect.Open();
                            string insertQuery = "insert into EventDetailsTable (eventname, eventdetails, eventimage, username) values (@name ,@detail, @image, @username)";
                            SqlCommand com = new SqlCommand(insertQuery, connect);
                            com.Parameters.AddWithValue("@name", eventname.SelectedItem.ToString());
                            com.Parameters.AddWithValue("@username", username.Text);
                            com.Parameters.AddWithValue("@detail", pdfpath);
                            imgpath = "~/EventImages" + "/" + eventname.Text + "/";
                            com.Parameters.AddWithValue("@image", imgpath);
                            com.ExecuteNonQuery();
                            connect.Close();
                            foreach (HttpPostedFile file in imageevent.PostedFiles)
                            {
                                string imgname = Path.GetFileName(file.FileName);
                                file.SaveAs(Server.MapPath("~/EventImages"+"/"+eventname.Text+"/")+ imgname);
                            }
                            Response.Write("<script>alert('Event Details Uploaded Successfully!!');</script>");



                        }

                    }
                    else
                    {
                        msg1.Text = "Only Support jpeg,jpg and png file.";
                        msg1.ForeColor = System.Drawing.Color.Red;
                    }
                    
                    
                    
                }
                else
                {
                    msg.Text = "Only Support pdf file.";
                    msg.ForeColor = System.Drawing.Color.Red;
                }

                
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }
        

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

       /* protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            string delQuery = "DELETE FROM EventDetailsTable";
            SqlCommand com = new SqlCommand(delQuery, connect);
            com.ExecuteNonQuery();
            connect.Close();
        }*/
    }
}