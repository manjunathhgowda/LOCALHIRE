using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class Payment : System.Web.UI.Page
    {
        string status4 = "completed and not paid";
        string status5 = "completed and paid";
        public static string wid;
        string workerid = viewacceptedworker.to; 
        string emplid = EMPLOYERDASHBOARD.emploid;
        
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM create_work where work_id='" + Session["wrkid"] + "'", con);
                SqlDataReader rd1 = cmd.ExecuteReader();
                if (rd1.Read())
                {
                    decimal amtt = Convert.ToDecimal(rd1["amount"]);
                    amt.Text = amtt.ToString();
                    decimal aa = (amtt / 60) * 1; //amt per minute


                    SqlCommand cmd1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + Session["wrkid"] + "'", con);
                    SqlDataReader rd2 = cmd1.ExecuteReader();
                    if (rd2.Read())
                    {
                        DateTime st = Convert.ToDateTime(rd2["work_start_time"]);
                        DateTime et = Convert.ToDateTime(rd2["work_end_time"]);

                        TimeSpan cc = et - st;
                        double xx = cc.TotalHours; //total hour consumed
                        hour.Text = xx.ToString("0.00");
                        double mm = cc.TotalMinutes; //hour to minutes
                        minutes.Text = mm.ToString("0.00");
                        decimal tt = aa * (decimal)mm; //amt per minute *Total minutes
                        TtlAmt.Text = tt.ToString("0.00");
                        txttotal.Text = TtlAmt.Text;

                    }
                    rd2.Close();
                }
                rd1.Close();
                con.Close();
            }
            
        }
        private void UpdateTotal()
        {
            // Check if both TextBoxes have valid numbers
            if (decimal.TryParse(TtlAmt.Text, out decimal num1) && decimal.TryParse(txtbonus.Text, out decimal num2))
            {
                // Perform the addition
                decimal sum = num1 + num2;
                // Update the text in textBox3
                txttotal.Text = sum.ToString();
            }
            else
            {
                // Clear the text in textBox3 if the input is invalid
                txttotal.Text = string.Empty;
            }
        }

        protected void Btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewacceptedworker.aspx");
        }

        protected void btnpay_Click(object sender, EventArgs e)
        {

                decimal amt = Convert.ToDecimal(txttotal.Text);
                con.Open();
                SqlCommand cmd = new SqlCommand("select Balance from employer where Id='" + emplid + "'", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    decimal balance = rd.GetDecimal(0);
                    if (amt > balance)
                    {
                        Response.Write("<script> alert('Insuffiecient Balance');</script>");
                    }
                    else
                    {
                        rd.Close();
                        SqlCommand cmd1 = new SqlCommand("update employer set Balance=Balance-@Balance where Id='" + emplid + "'", con);
                        cmd1.Parameters.AddWithValue("@Balance", Convert.ToDecimal(txttotal.Text));
                        cmd1.ExecuteNonQuery();
                        SqlCommand cmd2 = new SqlCommand("update worker set Balance=Balance+@Balance where Id='" + workerid + "'", con);
                        cmd2.Parameters.AddWithValue("@Balance", Convert.ToDecimal(txttotal.Text));
                        cmd2.ExecuteNonQuery();
                        SqlCommand cmd3 = new SqlCommand("update accepted_work set status=@status where worker_id='" + workerid + "' and work_id='" + Session["wrkid"]+"'", con);
                        cmd3.Parameters.AddWithValue("@status","paid");
                        cmd3.ExecuteNonQuery();

                        SqlCommand cm = new SqlCommand("update my_orders set status=@status where work_id='" + Session["wrkid"] + "' and worker_id='" + workerid + "' and status='"+status4+"'", con);
                        cm.Parameters.AddWithValue("@status", status5);
                        cm.ExecuteNonQuery();
                        Response.Write("<script> alert('Worker is paid successfully');</script>");
                        wid = workerid; //for worker feedback
                        string redirectScript = "setTimeout(function(){window.location.href='GiveFeedBack.aspx';},1000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirectScript", redirectScript, true);
                    }
                }
            con.Close();
        }

        protected void btntotal_Click(object sender, EventArgs e)
        {
            UpdateTotal();
        }
    }
}