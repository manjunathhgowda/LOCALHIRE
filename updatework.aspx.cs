using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class updatework : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //retrive work categories from works table and assign to dropdownlist
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select categories from works", con);
                SqlDataReader rd = cmd1.ExecuteReader();
                while (rd.Read())
                {
                    string value = rd["categories"].ToString();
                    categorylist.Items.Add(new ListItem(value, value));
                }
                rd.Close();
                con.Close();
            }

            int id = Convert.ToInt32(Session["wrkid"]);
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from create_work where work_id='" + id + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string idd = reader["work_id"].ToString();
                    txt_id.Text = idd;
                    categorylist.SelectedValue = reader["category"].ToString();

                    DateTime date = (DateTime)reader["start_date"];
                    txt_date.Text = date.ToShortDateString();

                    DateTime time=(DateTime)reader["start_time"];
                    txt_time.Text= time.ToShortTimeString();
                    txt_address.Text = reader["address"].ToString();
                    txt_description.Text = reader["description"].ToString();
                    int sal=Convert.ToInt32(reader["amount"]);
                    txt_salary.Text = sal.ToString();
                    txt_no_of_worker.Text = reader["no_of_worker"].ToString();
                }
                reader.Close();
                con.Close();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime today = DateTime.Today;
                DateTime a = DateTime.Parse(txt_date.Text);
                DateTime time = DateTime.Now;
                DateTime b = DateTime.Parse(txt_time.Text);
                if (a.Date < today.Date) //entered date is less than to todays date
                {
                    Response.Write("<script> alert('Invalid Date');</script>");
                }
                else if (a == today && b < time) //entered date is todays date and time is less than present time
                {
                    Response.Write("<script> alert('Invalid Time');</script>");
                }
                else
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("update create_work set category=@category,start_date=@start_date,start_time=@start_time,address=@address,description=@description,amount=@amount,no_of_worker=@no_of_worker where work_id='" + Session["wrkid"] + "'", con);
                    cmd2.Parameters.AddWithValue("@category", categorylist.SelectedValue.ToString());
                    cmd2.Parameters.AddWithValue("@start_date", DateTime.Parse(txt_date.Text));
                    cmd2.Parameters.AddWithValue("@start_time", txt_time.Text);
                    cmd2.Parameters.AddWithValue("@address", txt_address.Text);
                    cmd2.Parameters.AddWithValue("@description", txt_description.Text);
                    cmd2.Parameters.AddWithValue("@amount", Decimal.Parse(txt_salary.Text));
                    cmd2.Parameters.AddWithValue("@no_of_worker", txt_no_of_worker.Text);
                    cmd2.ExecuteNonQuery();
                    
                    SqlCommand cmd3 = new SqlCommand("update my_orders set work_type=@category,start_date=@start_date,start_time=@start_time,address=@address,description=@description,amount=@amount,no_of_worker=@no_of_worker where work_id='" + Session["wrkid"] + "'", con);
                    cmd3.Parameters.AddWithValue("@category", categorylist.SelectedValue.ToString());
                    cmd3.Parameters.AddWithValue("@start_date", DateTime.Parse(txt_date.Text));
                    cmd3.Parameters.AddWithValue("@start_time", txt_time.Text);
                    cmd3.Parameters.AddWithValue("@address", txt_address.Text);
                    cmd3.Parameters.AddWithValue("@description", txt_description.Text);
                    cmd3.Parameters.AddWithValue("@amount", Decimal.Parse(txt_salary.Text));
                    cmd3.Parameters.AddWithValue("@no_of_worker", txt_no_of_worker.Text);
                    cmd3.ExecuteNonQuery();

                    SqlCommand cmd4 = new SqlCommand("update accepted_work set no_of_worker=@no_of_worker where work_id='" + Session["wrkid"] + "'", con);                
                    cmd4.Parameters.AddWithValue("@no_of_worker", txt_no_of_worker.Text);
                    cmd4.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script> alert('Work updated successfully');</script>");
                    string redirectScript = "setTimeout(function(){window.location.href='mybookings.aspx';},500);";
                    ClientScript.RegisterStartupScript(this.GetType(), "redirectScript", redirectScript, true);
                }
            }
            
            catch(Exception ex)
            {      
                Response.Write("<script> alert('Check Your Date or Time Now...Date must be have format like dd/MM/yyyy and Time Must be have format like hh:mm AM or PM');</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("mybookings.aspx");
        }
    }
}