using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class adminfeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txt_name.Text = "";
                RadioButtonList1.Text = "";
                ratingList.SelectedValue = "";
                txt_email1.Text = "";
                txt_msg.Text = "";
            }
        }

        protected void send_Click(object sender, EventArgs e)
        {
            con.Open();
           
            SqlCommand cmd = new SqlCommand("insert into TeamFeedback values(@name,@email,@response,@rating,@feedback)", con);
            cmd.Parameters.AddWithValue("@name", txt_name.Text);
            cmd.Parameters.AddWithValue("@email", txt_email1.Text);
            cmd.Parameters.AddWithValue("@response", RadioButtonList1.Text);
            cmd.Parameters.AddWithValue("@rating", ratingList.SelectedValue);
            cmd.Parameters.AddWithValue("@feedback", txt_msg.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script> alert('Thank you for your feedback..');</script>");
        }
    }
}