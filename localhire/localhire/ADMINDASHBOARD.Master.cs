using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class ADMINDASHBOARD : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnfeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminViewFeedBacks.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homee.html");
        }

        protected void btnviewemployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEmployer.aspx");
        }

        protected void btnviewworker_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewWorker.aspx");
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminHome.aspx");
        }

        protected void btnwallet_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminwallet.aspx");
        }

        protected void btnbankacc_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbankacc.aspx");
        }
    }
}