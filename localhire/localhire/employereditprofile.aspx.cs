using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{

    public partial class employereditprofile : System.Web.UI.Page
    { 
        string emailid = login.to; //from login page
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //retrive existing data from table and asign to text fields
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from employer where email='" + emailid + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txt_name.Text = reader["name"].ToString();
                    txt_email.Text = reader["email"].ToString();
                    txt_mobile.Text = reader["mobile"].ToString();
                    txt_address.Text = reader["address"].ToString();
                    string pp = reader["ProfilePicture"].ToString();
                    ProfilePicture.ImageUrl = pp;
                    txt_pass.Text = reader["password"].ToString();
                }
                reader.Close();
                con.Close();
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //update profile picture section
            if (ProfilePictureUpload.HasFile)
            {
                string fileName = Path.GetFileName(ProfilePictureUpload.FileName);
                string filePath = Server.MapPath("~/images/" + fileName);
                ProfilePictureUpload.SaveAs(filePath);
                con.Open();
                SqlCommand cmd = new SqlCommand("update employer set ProfilePicture=@pp where email='" + emailid + "'", con);
                cmd.Parameters.AddWithValue("@pp", "~/images/" + fileName);
                cmd.ExecuteNonQuery();
                ProfilePicture.ImageUrl = "~/images/" + fileName;
                Session["pp"] = ProfilePicture.ImageUrl;  //for dashboard
                con.Close();

            }

            //update password section
            if (txt_pass.Text == "")
            {

            }
            else
            {
                con.Open();
                SqlCommand cmd3 = new SqlCommand("update employer set password=@pass where email='" + emailid + "'", con);
                cmd3.Parameters.AddWithValue("@pass", txt_pass.Text);
                cmd3.ExecuteNonQuery();
                con.Close();
                Response.Write("<script> alert('updated');</script>");
            }

            //update other details section
            con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from employer where email='" + emailid + "'", con);
                SqlDataReader rd = cmd1.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Close();
                    SqlCommand cmd2 = new SqlCommand("update employer set name=@name,email=@mail,mobile=@mbl,address=@add where email='" + emailid + "'", con);
                    cmd2.Parameters.AddWithValue("@name", txt_name.Text);
                    cmd2.Parameters.AddWithValue("@mail", txt_email.Text);
                    cmd2.Parameters.AddWithValue("@mbl", txt_mobile.Text);
                    cmd2.Parameters.AddWithValue("@add", txt_address.Text);
                                    
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script> alert('updated successfully');</script>");
                    Session["username"] = txt_name.Text; //for dashboard
                    

                }         
        }
    }
}