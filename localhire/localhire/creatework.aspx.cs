using Microsoft.Ajax.Utilities;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class creatework : System.Web.UI.Page
    {
        string emailid = login.to;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");

        public void GenerateWorkID()
        {
            //generate auto id for work
            int id = 0;
            con.Open();
            SqlCommand cmd = new SqlCommand("select max(work_id) from create_work", con);
            var res = cmd.ExecuteScalar();
            if (res != DBNull.Value)
            {
                id = Convert.ToInt32(res);
                txt_id.Text =id.ToString();
            }
            if (id != 0)
            {
                id++;
                txt_id.Text =id.ToString();
            }
            else
            {
                id = 1;
                txt_id.Text =id.ToString();
            }
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GenerateWorkID();
                //retrive work categories from works table and assign to dropdownlist
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select categories from works ORDER BY categories ASC", con);
                SqlDataReader rd = cmd1.ExecuteReader();
                while (rd.Read())
                {
                    string value = rd["categories"].ToString();
                    categorylist.Items.Add(new ListItem(value, value));
                }
                rd.Close();
                con.Close();
            }

            //retrieve name,id,mobile from employer login
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from employer where email='" + emailid + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Label1.Text = reader["name"].ToString();
                Label2.Text = reader["mobile"].ToString();
                Label3.Text = reader["Id"].ToString();
            }
            reader.Close();
            con.Close();
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
                    decimal amt = Convert.ToDecimal(txt_pay.Text);
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("select Balance from employer where Id='" + Session["empid"] + "'", con);
                    SqlDataReader rd = cmd1.ExecuteReader();
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
                            SqlCommand cmd2 = new SqlCommand("update employer set Balance=Balance-@Balance where Id='" + Session["empid"] + "'", con);
                            cmd2.Parameters.AddWithValue("@Balance", Convert.ToDecimal(txt_pay.Text));
                            cmd2.ExecuteNonQuery();

                            SqlCommand cmd3 = new SqlCommand("update admin set Balance=Balance+@Balance", con);
                            cmd3.Parameters.AddWithValue("@Balance", txt_pay.Text);
                            cmd3.ExecuteNonQuery();

                            SqlCommand cmd = new SqlCommand("insert into create_work values(@category,@start_date,@start_time,@address,@description,@amount,@no_of_worker,@work_id,@employer_name,@employer_mobile,@employer_id)", con);
                            cmd.Parameters.AddWithValue("@category", categorylist.SelectedValue.ToString());
                            cmd.Parameters.AddWithValue("@start_date", DateTime.Parse(txt_date.Text));
                            cmd.Parameters.AddWithValue("@start_time", txt_time.Text);
                            cmd.Parameters.AddWithValue("@address", txt_address.Text);
                            cmd.Parameters.AddWithValue("@description", txt_description.Text);
                            cmd.Parameters.AddWithValue("@amount", Decimal.Parse(txt_salary.Text));
                            cmd.Parameters.AddWithValue("@no_of_worker", txt_no_of_worker.Text);
                            cmd.Parameters.AddWithValue("@work_id",Convert.ToInt32(txt_id.Text));
                            cmd.Parameters.AddWithValue("@employer_name", Label1.Text);
                            cmd.Parameters.AddWithValue("@employer_mobile", Label2.Text);
                            cmd.Parameters.AddWithValue("@employer_id", Label3.Text);
                            cmd.ExecuteNonQuery();

                            SqlCommand cmd4 = new SqlCommand("insert into earnings values(@Id,@name,@date,@amount)", con);
                            cmd4.Parameters.AddWithValue("@Id",Label3.Text);
                            cmd4.Parameters.AddWithValue("@name", Label1.Text);
                            cmd4.Parameters.AddWithValue("@date", DateTime.Now.Date);
                            cmd4.Parameters.AddWithValue("@amount", txt_pay.Text);
                            cmd4.ExecuteNonQuery();
                            con.Close();
                            Session["workid"] = txt_id.Text;
                            Response.Write("<script> alert('work posted successfully');</script>");
                            string redirectScript = "setTimeout(function(){window.location.href='employerhome.aspx';},1000);";
                            ClientScript.RegisterStartupScript(this.GetType(), "redirectScript", redirectScript, true);
                        }
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}