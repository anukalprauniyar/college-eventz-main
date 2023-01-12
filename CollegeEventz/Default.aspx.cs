using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeEventz
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void click1(object sender, EventArgs e)
        {
            Response.Redirect("ViewUpcomingEvent.aspx");

        }
        protected void click2(object sender, EventArgs e)
        {
            Response.Redirect("ViewUploadedDetails.aspx");

        }
    }
}