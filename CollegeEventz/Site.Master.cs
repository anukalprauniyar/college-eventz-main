using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeEventz
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void LogOut_button(object sender, EventArgs e)
        {
            Session["New"]="Null";
            Response.Redirect("login_page.aspx");

        }
    }
}