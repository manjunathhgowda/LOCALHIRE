using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace localhire
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txt_name.Text = "";
                txt_email1.Text = "";
                txt_msg.Text = "";
            }

        }
        protected void send_Click(object sender, EventArgs e)
        {     
           
                // Create a MailMessage object with the user's inputs
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(txt_email1.Text);
                mail.To.Add("mylabours001@gmail.com");
                mail.Subject = "New message from your website";
                mail.Body = "Name: " + txt_name.Text + "\n"
                          + "Email: " + txt_email1.Text + "\n"
                          + "Message: " + txt_msg.Text;

                // Create a SmtpClient object and send the message
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("mylabours001@gmail.com", "iahd edky ohqh kids");
                smtp.EnableSsl = true;
                try
                {
                    smtp.Send(mail);
                    // Display a success message                 
                    Response.Write("<script> alert('Thank you for your message. We will get back to you soon..');</script>");
                }
                catch (Exception ex)
                {
                  // Display an error message                    
                    Response.Write("<script> alert('An error occurred while sending your message. Please try again later...');</script>");
                }
        }
    }
}