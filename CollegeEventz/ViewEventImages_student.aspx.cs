using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeEventz
{
    public partial class ViewEventImages_student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string path = Request.QueryString["imagedata"];
                string[] imgpath = Directory.GetFiles(Server.MapPath(path));
                List<String> img = new List<String>();
                //List<ListItem> img = new List<ListItem>();
                foreach (string file in imgpath)
                {
                    string fileName = Path.GetFileName(file);

                    //img.Add(new ListItem(fileName, path + fileName ));
                    img.Add(String.Format(path + fileName));

                    ListView1.DataSource = img;
                    ListView1.DataBind();
                }
            }
        }
    }
}