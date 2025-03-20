using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class viewacceptedworker : System.Web.UI.Page
    {
        public static string to;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");       
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                PLoad();
                con.Open();
                SqlCommand cmdx = new SqlCommand("SELECT worker_id,worker_name,worker_mobile,worker_gender,worker_profile,status FROM accepted_work where work_id='" + Session["wrkid"] + "'", con);
                SqlDataReader rd = cmdx.ExecuteReader();
                if (rd.Read())
                {
                    rd.Close();
                   Panel1.Visible = false;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmdx);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    GridView1.DataSource = dataTable;
                   dataTable = dataTable.DefaultView.ToTable();
                    GridView1.DataBind();
                    con.Close();
                }
                else
                {
                  Panel1.Visible = true;
                }
            }

        }
        protected void PLoad()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from accepted_work where work_id='" + Session["wrkid"] + "'", con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("mybookings.aspx");
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {
            int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string workerid = GridView1.DataKeys[rowindex]["worker_id"].ToString();
            con.Open();
            SqlCommand cmdd = new SqlCommand("SELECT status,worker_id FROM accepted_work WHERE work_id = '" + Session["wrkid"] + "' AND worker_id ='" +workerid+ "'", con);
            SqlDataReader rdd = cmdd.ExecuteReader();
            if (rdd.Read())
            {
                string status = rdd["status"].ToString();
                string wrkrid = rdd["worker_id"].ToString();
                to = wrkrid; //for payment

                if (status == "paid")
                {
                    Response.Write("<script> alert('you aldready paid to this worker'); </script>");
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + Session["wrkid"] + "'", con);
                    SqlDataReader rd2 = cmd1.ExecuteReader();
                    if (rd2 != null && rd2.HasRows)
                    {
                        if (rd2.Read())
                        {
                            if (rd2.IsDBNull(0))
                            {
                                Response.Write("<script> alert('work is not started yet..'); </script>");
                            }
                            else if (rd2.IsDBNull(1))
                            {
                                Response.Write("<script> alert('work is not completed yet..'); </script>");
                            }
                            else
                            {
                                Response.Redirect("Payment.aspx");
                            }
                        }
                    }
                    rd2.Close();
                }
            }
            rdd.Close();

            con.Close();
           
        }
    }
}