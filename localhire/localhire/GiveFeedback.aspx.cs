﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class GiveFeedback : System.Web.UI.Page
    {
        string workerid =Payment.wid;
        string emplid = EMPLOYERDASHBOARD.emploid;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT name FROM employer where Id='" + emplid + "'", con);
                SqlDataReader rd1 = cmd.ExecuteReader();
                if (rd1.Read())
                {
                    txt_name.Text = rd1[0].ToString();
                }
            }
        }
        protected void backskip_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewacceptedworker.aspx");
        }

        protected void send_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into workerfeedbacks values(@worker_id,@name,@response,@message)", con);
            cmd.Parameters.AddWithValue("@worker_id",workerid);
            cmd.Parameters.AddWithValue("@name", txt_name.Text);
            cmd.Parameters.AddWithValue("@response", RadioButtonList1.Text);       
            cmd.Parameters.AddWithValue("@message", txt_msg.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script> alert('Thank you for your feedback..');</script>");
            string redirectScript = "setTimeout(function(){window.location.href='viewacceptedworker.aspx';},1000);";
            ClientScript.RegisterStartupScript(this.GetType(), "redirectScript", redirectScript, true);

        }
    }
}