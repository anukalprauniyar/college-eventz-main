using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace CollegeEventz
{
    public partial class Register_Event : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["New"] != null){
                coordinator.Text = Session["New"].ToString();
            }
            else
            {
                Response.Redirect("login_page.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect.Open();
            string checkuser = "select count(*) from EventRegistrationTable where eventtitle='" + eventtitle.Text + "'";
            SqlCommand com1 = new SqlCommand(checkuser, connect);
            Int32 temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            connect.Close();
            if (temp >= 1)
            {
                Response.Write("This Event is Already Exists");
            }
            else
            {
                try
                {
                    string imgextension = Path.GetExtension(boucher.FileName);
                    //SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    string imgpath;
                    
                    if (imgextension == ".pdf" || imgextension == ".jpg" || imgextension == ".jpeg" || imgextension == ".png")
                    {
                        if (boucher.HasFile)
                        {
                            boucher.SaveAs(Server.MapPath("~/Brochour/") + Path.GetFileName(boucher.FileName));
                            imgpath = "Brochour/" + Path.GetFileName(boucher.FileName);
                            connect.Open();
                            string insertQuery = "insert into EventRegistrationTable (eventtitle,startdate,enddate,eventtheme,url,brochour,department,quarter,coordinator) values (@title ,@startdate ,@enddate ,@theme ,@url ,@brochour ,@depart,@quart,@coordi)";
                            SqlCommand com = new SqlCommand(insertQuery, connect);
                            com.Parameters.AddWithValue("@title", eventtitle.Text);
                            com.Parameters.AddWithValue("@startdate", startdate.Text);
                            com.Parameters.AddWithValue("@enddate", enddate.Text);
                            com.Parameters.AddWithValue("@theme", eventtheme.Text);
                            com.Parameters.AddWithValue("@url", url.Text);
                            com.Parameters.AddWithValue("@depart", department.SelectedItem.ToString());
                            com.Parameters.AddWithValue("@quart", quarter.SelectedItem.ToString());
                            com.Parameters.AddWithValue("@coordi", coordinator.Text);
                            com.Parameters.AddWithValue("@brochour", imgpath);
                            com.ExecuteNonQuery();
                            //Response.Redirect("ViewRegistrationData.aspx");
                            //msg.Text = "Event Registered Successfully!!";
                            Response.Write("<script>alert('Event Registered Successfully!!');</script>");
                            connect.Close();

                        }
                        
                    }
                    else
                    {
                        imgpath= Path.GetFileName(boucher.FileName);
                        connect.Open();
                        string insertQuery = "insert into EventRegistrationTable (eventtitle,startdate,enddate,eventtheme,url,brochour,department,quarter,coordinator) values (@title ,@startdate ,@enddate ,@theme ,@url ,@brochour ,@depart,@quart,@coordi)";
                        SqlCommand com = new SqlCommand(insertQuery, connect);
                        com.Parameters.AddWithValue("@title", eventtitle.Text);
                        com.Parameters.AddWithValue("@startdate", startdate.Text);
                        com.Parameters.AddWithValue("@enddate", enddate.Text);
                        com.Parameters.AddWithValue("@theme", eventtheme.Text);
                        com.Parameters.AddWithValue("@url", url.Text);
                        com.Parameters.AddWithValue("@depart", department.SelectedItem.ToString());
                        com.Parameters.AddWithValue("@quart", quarter.SelectedItem.ToString());
                        com.Parameters.AddWithValue("@coordi", coordinator.Text);
                        com.Parameters.AddWithValue("@brochour",imgpath);
                        com.ExecuteNonQuery();
                        //Response.Redirect("ViewRegistrationData.aspx");
                        //msg.Text = "Event Registered Successfully!!";
                        Response.Write("<script>alert('Event Registered Successfully!!');</script>");
                        connect.Close();
                    }
                    
                        
                        

                    
                   

                }
                catch (Exception ex)
                {
                    Response.Write("Error:" + ex.ToString());
                }
            }
            

        }
        
    }

}