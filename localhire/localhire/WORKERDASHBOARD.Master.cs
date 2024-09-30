using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class WORKERDASHBOARD : System.Web.UI.MasterPage
    {
        string emailid = login.to; //from login
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["pp"] == null && Session["usernane"] == null) //session from edit profile
            {
                //display name and profile pic at dashboard
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from worker where email='" + emailid + "'", con);
                SqlDataReader dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    Label1.Text = dr1["name"].ToString();
                    username.Text = dr1["name"].ToString();
                    logo2.ImageUrl = dr1["ProfilePicture"].ToString();
                    logo3.ImageUrl = dr1["ProfilePicture"].ToString();

                }
                dr1.Close();
                con.Close();
            }
            else
            {
                //display name and profile pic at dashboard from edit profile
                Label1.Text = (string)Session["username"];
                username.Text = (string)Session["username"];
                logo2.ImageUrl = (string)Session["pp"];
                logo3.ImageUrl = (string)Session["pp"];
            }

            //display worker id at dashboard from login
            con.Open();
            SqlCommand cmd2 = new SqlCommand("select * from worker where email='" + emailid + "'", con);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                workerid.Text = dr2["id"].ToString();
            }
            dr2.Close();
            con.Close();
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("workereditprofile.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("id");
            Response.Redirect("Homee.html");
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("workerhome.aspx");
        }

        protected void btnmyorder_Click(object sender, EventArgs e)
        {
            try
            {
                //retrieve all work id from myorder table
                con.Open();
                SqlCommand cmddd = new SqlCommand("select work_id from create_work ", con);
                SqlDataReader rdr = cmddd.ExecuteReader();
                while (rdr.Read())
                {
                    int idd =Convert.ToInt32(rdr["work_id"]);

                    //ckeck existence of work id and worker id in same row of table
                    string checkExistenceQuery = "SELECT  count(*) FROM my_orders WHERE work_id = '" + idd + "' AND worker_id ='" + workerid.Text + "'";   //work id and worker id

                    SqlCommand checkExistenceCommand = new SqlCommand(checkExistenceQuery, con);
                    int count = (int)checkExistenceCommand.ExecuteScalar();
                    //if not exisits
                    if (count == 0)
                    {
                        //retrieve data from create_work table
                        SqlCommand cmd = new SqlCommand("select * from create_work where work_id='"+idd+"'", con);
                        SqlDataReader rd = cmd.ExecuteReader();

                        //retrieve data from worker table table
                        SqlCommand cmd1 = new SqlCommand("select * from worker where Id=@workerid", con);
                        cmd1.Parameters.AddWithValue("@workerid", workerid.Text);
                        SqlDataReader rd1 = cmd1.ExecuteReader();
                        while(rd1.Read())
                        {
                            string wid = rd1["Id"].ToString();
                            string wname = rd1["name"].ToString();
                            string wmbl = rd1["mobile"].ToString();
                            string gender = rd1["gender"].ToString();
                            string profile = rd1["ProfilePicture"].ToString();
                            while(rd.Read())
                            {
                                int id = Convert.ToInt32(rd["work_id"]);
                                string wrktype = rd["category"].ToString();
                                DateTime date = Convert.ToDateTime(rd["start_date"]);
                                string time = rd["start_time"].ToString();
                                string address = rd["address"].ToString();
                                string description = rd["description"].ToString();
                                decimal amt = Convert.ToDecimal(rd["amount"]);
                                int noofworker = Convert.ToInt32(rd["no_of_worker"]);
                                string empid = rd["employer_id"].ToString();
                                string empmbl = rd["employer_mobile"].ToString();
                                string empname = rd["employer_name"].ToString();

                                //insert retrieved data from 2 table to my_order table
                                SqlCommand c = new SqlCommand("insert into my_orders values(@work_id,@worker_id,@worker_name,@worker_mbl,@worker_gender,@worker_profile,@work_type,@start_date,@start_time,@address,@description,@amount,@no_of_worker,@employer_id,@employer_name,@employer_mobile,@status)", con);
                                c.Parameters.AddWithValue("@work_id", id);
                                c.Parameters.AddWithValue("@worker_id", wid);
                                c.Parameters.AddWithValue("@worker_name", wname);
                                c.Parameters.AddWithValue("@worker_mbl", wmbl);
                                c.Parameters.AddWithValue("@worker_gender", gender);
                                c.Parameters.AddWithValue("@worker_profile", profile);
                                c.Parameters.AddWithValue("@work_type", wrktype);
                                c.Parameters.AddWithValue("@start_date", date);
                                c.Parameters.AddWithValue("@start_time", time);
                                c.Parameters.AddWithValue("@address", address);
                                c.Parameters.AddWithValue("@description", description);
                                c.Parameters.AddWithValue("@amount", amt);
                                c.Parameters.AddWithValue("@no_of_worker", noofworker);
                                c.Parameters.AddWithValue("@employer_id", empid);
                                c.Parameters.AddWithValue("@employer_name", empname);
                                c.Parameters.AddWithValue("@employer_mobile", empmbl);
                                c.Parameters.AddWithValue("@status", "ordered");
                                c.ExecuteNonQuery();
                            }
                            rd.Close();
                        }                                          
                        rd1.Close();
                    }
                    else
                    {
                        Response.Write("<script> alert('exists'); </script>");
                    }
                }
                rdr.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            Session["username"] = Label1.Text;    //session for my orders
            Session["workerid"] = workerid.Text; //session created for retrieve data at my orders
            Response.Redirect("myorder.aspx");
        }
        protected void btnfeedback_Click(object sender, EventArgs e)
        {
            Session["workerid"] = workerid.Text;
            Response.Redirect("workerviewfeedback.aspx");
        }

        protected void btnbank_Click(object sender, EventArgs e)
        {
            Session["workerid"] = workerid.Text;    //session created for retrieve data at my bank
            Response.Redirect("workerbankacc.aspx");
        }

        protected void btnwallet_Click(object sender, EventArgs e)
        {
            Session["workerid"] = workerid.Text; //session created for retrieve data at my wallet
            Response.Redirect("workerwallet.aspx");
        }
    }
}