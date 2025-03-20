using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class login : System.Web.UI.Page
    {
        public static string to;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //label for invalid message
            msglbl1.Visible = false;
            msglbl2.Visible = false;
            msglbl3.Visible = false;
        }

        //worker login
        protected void workerlogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from worker where email='" + txt_email1.Text + "'and password='" + txt_pass1.Text + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {              
                to= txt_email1.Text;
                Response.Redirect("workerhome.aspx");
            }
            else
            {
                msglbl1.Visible = true;
                msglbl1.Text = "your username or password are Invalid";
                msglbl1.ForeColor = System.Drawing.Color.Red;
            }
        }

        //employer login
        protected void employerlogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from employer where email='" + txt_email2.Text + "'and password='" + txt_pass2.Text + "'", con);

            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {

                to= txt_email2.Text;
                Response.Redirect("employerhome.aspx");
            }
            else
            {
                msglbl2.Visible = true;
                msglbl2.Text = "your username or password are Invalid";
                msglbl2.ForeColor = System.Drawing.Color.Red;
            }
        }

        //admin login
        protected void adminlogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from admin where email='" + txt_email3.Text + "'and password='" + txt_pass3.Text + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            if (temp == 1)
            {
                to = txt_email3.Text;
                Response.Redirect("adminHome.aspx");
            }
            else
            {
                msglbl3.Visible = true;
                msglbl3.Text = "your username or password are Invalid";
                msglbl3.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}