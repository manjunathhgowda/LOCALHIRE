using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void btnmore_Click(object sender, EventArgs e)
        {
            btnmore.Visible = false;
            Panel1.Visible = true;
        }

        protected void btnless_Click(object sender, EventArgs e)
        {
            btnmore.Visible = true;
            Panel1.Visible = false;
        }
    }
}