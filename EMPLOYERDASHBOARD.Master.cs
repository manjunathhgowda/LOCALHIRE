using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class EMPLOYERDASHBOARD : System.Web.UI.MasterPage
    {
        public static string emploid;
        string emailid = login.to; //from login page 
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["pp"]== null && Session["usernane"]==null)  //session from edit profile
            {
                //display profile pic and username at dashboard from login
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from employer where email='" + emailid + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Label1.Text = dr["name"].ToString();
                    username.Text = dr["name"].ToString();
                    //empid.Text = dr["id"].ToString();
                    logo2.ImageUrl = dr["ProfilePicture"].ToString();
                    logo3.ImageUrl = dr["ProfilePicture"].ToString();
                   
                }
                
                con.Close();
            }
            else
            {
                ////display profile pic and username at dashboard from edit profile
                Label1.Text = (string)Session["username"];
                username.Text = (string)Session["username"];
                logo2.ImageUrl = (string)Session["pp"];
                logo3.ImageUrl = (string)Session["pp"];
            }

            //display  employer id at dashboard
            con.Open();
            SqlCommand cmd2 = new SqlCommand("select * from employer where email='" + emailid + "'", con);
            SqlDataReader dr1 = cmd2.ExecuteReader();
            if (dr1.Read())
            {
                empid.Text = dr1["id"].ToString();
            }
            con.Close ();
            Session["empid"] = empid.Text; //session created for retrieve data at my bookings page
            emploid = empid.Text; //employee id for payment;
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("empid");
            Response.Redirect("Homee.html");
        }

        protected void btnbooking_Click(object sender, EventArgs e)
        {

            Response.Redirect("mybookings.aspx");
           
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("employerhome.aspx");
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("employereditprofile.aspx");
        }
        protected void btnfeedback_Click(object sender, EventArgs e)
        {
            Session["empid"] = empid.Text;
            Response.Redirect("employerviewfeedback.aspx");
        }

        protected void btnwallet_Click(object sender, EventArgs e)
        {
            Session["empid"] = empid.Text;
            Response.Redirect("employerwallet.aspx");
        }

        protected void btnbank_Click(object sender, EventArgs e)
        {
            Session["empid"] = empid.Text;
            Response.Redirect("employerbankacc.aspx");
        }
    }
}