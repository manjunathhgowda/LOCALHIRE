using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace localhire
{
    public partial class myorder : System.Web.UI.Page
    {
        public static string empid;
        string status = "ordered";
        string status1 = "accepted";
        string status2 = "rejected";
        string status3 = "in progress";
        string status4 = "completed and not paid";
        string status5 = "completed and paid";
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PLoad();             
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT count(*) FROM my_orders where worker_id='" + Session["workerid"] + "' and (status='" + status + "' OR status='" + status1 + "' OR status='" + status3 + "' OR status='" + status4 + "' OR status='" + status5 + "')", con);
                int count = (int)cmd.ExecuteScalar();
                order.Text = count.ToString(); 
                
                //retrieve created work and assign to gridview
                SqlCommand cmdx = new SqlCommand("SELECT Distinct * FROM my_orders where worker_id='" + Session["workerid"] + "' and (status='" + status + "'  OR status='" + status1 + "'  OR status='" + status3 + "'  OR status='" + status4 + "' OR status='" + status5 + "')", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmdx);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                dataTable.DefaultView.Sort = "work_id DESC"; //descending order
                dataTable = dataTable.DefaultView.ToTable();
                GridView1.DataBind();
                con.Close();
            }           
        }

        protected void PLoad()
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT count(*) FROM my_orders where worker_id='" + Session["workerid"] + "' and (status='" + status + "'  OR status='" + status1 + "'  OR status='" + status3 + "'  OR status='" + status4 + "' OR status='" + status5 + "')", con);
            int count = (int)cmd1.ExecuteScalar();
            order.Text = count.ToString();

            SqlCommand cmd = new SqlCommand("select DISTINCT * from my_orders where worker_id='" + Session["workerid"] +"' and (status = '"+status+ "'  OR status='" + status1 + "'  OR status='" + status3 + "'  OR status='" + status4 + "' OR status='" + status5 + "')", con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            dt.DefaultView.Sort = "work_id DESC"; //descending order
            dt = dt.DefaultView.ToTable();
            GridView1.DataBind();
            con.Close() ;
        }

        protected void btn_accept_Click(object sender, EventArgs e)
        {
            con.Open();
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string workid = GridView1.DataKeys[rowindex]["work_id"].ToString();
            SqlCommand cmmdd = new SqlCommand("SELECT start_date FROM my_orders WHERE work_id = '" + workid + "' AND worker_id ='" + Session["workerid"] + "'", con);
            SqlDataReader reader = cmmdd.ExecuteReader();
            if (reader.Read())
            {
                DateTime date = Convert.ToDateTime(reader["start_date"]);
                if (date < DateTime.Today)
                {
                    Response.Write("<script> alert('Work date is over..'); </script>");
                }
                else
                {
                    SqlCommand cmdd = new SqlCommand("SELECT status FROM accepted_work WHERE work_id = '" + workid + "' AND worker_id ='" + Session["workerid"] + "'", con);
                    SqlDataReader rdd = cmdd.ExecuteReader();
                    if (rdd.Read())
                    {
                        string status = rdd["status"].ToString();
                        if (status == "not paid")
                        {
                            Response.Write("<script> alert('aldready accepted and you are not paid yet..'); </script>");
                        }
                        else if (status == "paid")
                        {
                            Response.Write("<script> alert('work aldready completed and payment is aldready done, check your wallet'); </script>");
                        }
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("SELECT DISTINCT * FROM my_orders WHERE work_id = '" + workid + "' AND worker_id ='" + Session["workerid"] + "'", con);
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.Read())
                        {
                            string name = rd["worker_name"].ToString();
                            string mobile = rd["worker_mbl"].ToString();
                            string gender = rd["worker_gender"].ToString();
                            string profile = rd["worker_profile"].ToString();
                            int noofworker = Convert.ToInt32(rd["no_of_worker"]);

                            SqlCommand cmd1 = new SqlCommand("SELECT count(*) FROM accepted_work WHERE work_id = '" + workid + "'", con);
                            int count = (int)cmd1.ExecuteScalar();
                            if (count == 0)
                            {
                                
                                SqlCommand c = new SqlCommand("insert into accepted_work values(@work_id,@worker_id,@worker_name,@worker_mobile,@worker_gender,@worker_profile,@no_of_worker,@accepted_no_of_worker,@work_start_time,@work_end_time,@status)", con);
                                c.Parameters.AddWithValue("@work_id", workid);
                                c.Parameters.AddWithValue("@worker_id", Session["workerid"]);
                                c.Parameters.AddWithValue("@worker_name", name);
                                c.Parameters.AddWithValue("@worker_mobile", mobile);
                                c.Parameters.AddWithValue("@worker_gender", gender);
                                c.Parameters.AddWithValue("@worker_profile", profile);
                                c.Parameters.AddWithValue("@no_of_worker", noofworker);
                                c.Parameters.AddWithValue("@accepted_no_of_worker", 1);
                                c.Parameters.AddWithValue("@work_start_time", DBNull.Value);
                                c.Parameters.AddWithValue("@work_end_time", DBNull.Value);
                                c.Parameters.AddWithValue("@status", "not paid");
                                c.ExecuteNonQuery();

                                //update status as accepted
                                SqlCommand cm = new SqlCommand("update my_orders set status=@status where work_id='" + workid + "' and worker_id='" + Session["workerid"] + "'", con);
                                cm.Parameters.AddWithValue("@status", status1);
                                cm.ExecuteNonQuery();
                                Response.Write("<script> alert('Work accepted successfully'); </script>");
                            }
                            else
                            {
                                SqlCommand cmd2 = new SqlCommand("SELECT sum(accepted_no_of_worker) as accepted_no_of_worker  FROM accepted_work WHERE work_id = '" + workid + "'", con);
                                object aa = cmd2.ExecuteScalar();
                                int sum = Convert.ToInt32(aa);
                                if (noofworker == sum)
                                {
                                    Response.Write("<script> alert('Spots already filled..'); </script>");
                                }
                                else
                                {
                                    SqlCommand c = new SqlCommand("insert into accepted_work values(@work_id,@worker_id,@worker_name,@worker_mobile,@worker_gender,@worker_profile,@no_of_worker,@accepted_no_of_worker,@work_start_time,@work_end_time,@status)", con);
                                    c.Parameters.AddWithValue("@work_id", workid);
                                    c.Parameters.AddWithValue("@worker_id", Session["workerid"]);
                                    c.Parameters.AddWithValue("@worker_name", name);
                                    c.Parameters.AddWithValue("@worker_mobile", mobile);
                                    c.Parameters.AddWithValue("@worker_gender", gender);
                                    c.Parameters.AddWithValue("@worker_profile", profile);
                                    c.Parameters.AddWithValue("@no_of_worker", noofworker);
                                    c.Parameters.AddWithValue("@accepted_no_of_worker", 1);
                                    c.Parameters.AddWithValue("@work_start_time", DBNull.Value);
                                    c.Parameters.AddWithValue("@work_end_time", DBNull.Value);
                                    c.Parameters.AddWithValue("@status", "not paid");
                                    c.ExecuteNonQuery();

                                    //update status as accepted
                                    SqlCommand cm = new SqlCommand("update my_orders set status=@status where work_id='" + workid + "' and worker_id='" + Session["workerid"] + "'", con);
                                    cm.Parameters.AddWithValue("@status", status1);
                                    cm.ExecuteNonQuery();
                                    Response.Write("<script> alert('Work accepted successfully'); </script>");
                                }
                            }

                        }
                        rd.Close();                     
                    }
                }
            }
            reader.Close ();
            con.Close();
            PLoad();
        }
        protected void btn_reject_Click(object sender, EventArgs e)
        {
            con.Open();
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string workid = GridView1.DataKeys[rowindex]["work_id"].ToString();
            SqlCommand cm1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + workid + "' and worker_id='" + Session["workerid"]+"'", con);
            SqlDataReader rd2 = cm1.ExecuteReader();
            if (rd2 != null && rd2.HasRows)
            {
                if (rd2.Read())
                {
                    if (rd2.IsDBNull(0) && rd2.IsDBNull(1))
                    {
                        SqlCommand cm = new SqlCommand("update my_orders set status=@status where work_id='" + workid + "' and worker_id='" + Session["workerid"] + "'", con);
                        cm.Parameters.AddWithValue("@status", status2);
                        cm.ExecuteNonQuery();

                        SqlCommand cmd2 = new SqlCommand("delete from accepted_work where work_id='" + workid + "' and worker_id='" + Session["workerid"]+"'", con);
                        cmd2.ExecuteNonQuery();
                        Response.Write("<script> alert('This work is successfully rejected by you... '); </script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('You can not reject..when work started or completed'); </script>");
                    }
                }
            }
            else
            {
                //update status as accepted
                SqlCommand cm2 = new SqlCommand("update my_orders set status=@status where work_id='" + workid + "' and worker_id='" + Session["workerid"] + "'", con);
                cm2.Parameters.AddWithValue("@status", status2);
                cm2.ExecuteNonQuery();
                Response.Write("<script> alert('This work is successfully rejected by you... '); </script>");
            }
            rd2.Close();
            con.Close();

           PLoad();
        }

        protected void btnfeeback_Click(object sender, EventArgs e)
        {
            con.Open();
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string workid = GridView1.DataKeys[rowindex]["work_id"].ToString();
            SqlCommand cm1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + workid + "' and worker_id='" + Session["workerid"] + "'", con);
            SqlDataReader rd2 = cm1.ExecuteReader();
            if (rd2 != null && rd2.HasRows)
            {
                if (rd2.Read())
                {
                    if (rd2.IsDBNull(0) && rd2.IsDBNull(1))
                    {
                       
                        Response.Write("<script> alert('You can not give feedback before completion of work'); </script>");
                    }
                    else
                    {
                        SqlCommand c = new SqlCommand("SELECT employer_id FROM my_orders where work_id='" + workid + "'", con);
                        SqlDataReader r = c.ExecuteReader();
                        if (r.Read())
                        {
                            empid = r.GetString(0); //for feedback page
                            Response.Redirect("GiveFeedback2.aspx");
                        }                       
                    }
                }
            }
            else
            {
                Response.Write("<script> alert('You can not give feedback without did a work'); </script>");
            }
            rd2.Close();
            con.Close();
        }
    }
}