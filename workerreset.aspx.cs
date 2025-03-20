using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class workerreset : System.Web.UI.Page
    {
        string emailid = workerforgot .to;  //retrive email from workerforgot.aspx
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Labourhire\\localhire\\localhire\\App_Data\\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            if (txt_npass.Text == txt_cpass.Text)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update worker set password='" + txt_cpass.Text + "' where email='" + emailid + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('password reset successfully'); </script>");
                string redirectScript = "setTimeout(function(){window.location.href='login.aspx';},1000);";
                ClientScript.RegisterStartupScript(this.GetType(), "redirectScript", redirectScript, true);
            }
            else
            {
                Response.Write("<script> alert('password does not match'); </script>");
            }
        }
    }
}