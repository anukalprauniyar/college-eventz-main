using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Windows;

namespace CollegeEventz
{
    public partial class viewEventImages : System.Web.UI.Page
    {
   

        protected void Page_Load(object sender, EventArgs e)
        {
            /* string maincon = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
             SqlConnection conn = new SqlConnection(maincon);
             string sqlquery = "SELECT [eventname,eventimage] FROM [EventDetailsTable]";
             SqlCommand com = new SqlCommand(sqlquery, conn);
             conn.Open();
             SqlDataAdapter sda = new SqlDataAdapter();
             sda.SelectCommand = com;
             DataSet ds = new DataSet();
             sda.Fill(ds);
             DataList1.DataSource = ds;
             DataList1.DataBind();
             conn.Close();*/
            if (!IsPostBack)
            {
                string path=Request.QueryString["imagedata"];
                string[] imgpath = Directory.GetFiles(Server.MapPath(path));
                List<String> img = new List<String>();
                //List<ListItem> img = new List<ListItem>();
                foreach (string file in imgpath)
                {
                    string fileName = Path.GetFileName(file);

                    //img.Add(new ListItem(fileName, path + fileName ));
                    img.Add(String.Format(path+fileName));
                    
                    ListView1.DataSource = img;
                    ListView1.DataBind();
                }
            }
        }

        protected void ListView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
          
        }
    }
}