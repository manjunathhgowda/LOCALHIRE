using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace localhire
{
    public partial class workerforgot : System.Web.UI.Page
    {
        string randomcode;
        public static string to;

        public void GenerateOTP()
        {
            string from, pass, messagebody;
            Random rand = new Random();
            randomcode = (rand.Next(1000, 9999)).ToString();
            MailMessage message = new MailMessage();
            to = (txt_email.Text).ToString();
            from = "mylabours001@gmail.com";
            pass = "iahd edky ohqh kids";
            messagebody = "Your OTP is " + randomcode;
            message.To.Add(to);
            message.From = new MailAddress(from);
            message.Body = messagebody;
            message.Subject = "Password Reset Code";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(from, pass);
            try
            {
                Label1.Text = randomcode;
                smtp.Send(message);
                Response.Write("<script> alert('OTP is sent to your e mail');</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from worker where email='" + txt_email.Text.Trim() + "'", con);
            var c = (int)cmd.ExecuteScalar();
            if (c > 0)
            {
                GenerateOTP();
            }
            else
            {
                Response.Write("<script> alert('worker does not exist');</script>");
            
            }

        }

        protected void btnverify_Click(object sender, EventArgs e)
        {
            if (Label1.Text == (txt_pass.Text).ToString())
            {
                to = txt_email.Text;
                Response.Redirect("workerreset.aspx");
            }
            else
            {
                Response.Write("<script> alert('Wrong OTP');</script>");
            }
        }
    }
}