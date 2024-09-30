using Microsoft.SqlServer.Server;
using Microsoft.VisualBasic.ApplicationServices;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace localhire
{
    public partial class mybookings : System.Web.UI.Page
    {

        string status1 = "accepted";
        string status3 = "in progress";
        string status4 = "completed and not paid";
      

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PLoad();
                con.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from create_work where employer_id='" + Session["empid"] + "'", con);
                int count=(int)cmd.ExecuteScalar();
                book.Text = count.ToString();

                SqlCommand cmdx = new SqlCommand("SELECT employer_id,employer_name, work_id, category, start_date, start_time, address, amount, description,no_of_worker FROM create_work where employer_id='" + Session["empid"] + "'", con);
                SqlDataReader rd = cmdx.ExecuteReader();
                if (rd.Read())
                {

                    rd.Close();
                    Panel1.Visible = false;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmdx);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    GridView1.DataSource = dataTable;
                    dataTable.DefaultView.Sort = "work_id DESC"; //descending order
                    dataTable = dataTable.DefaultView.ToTable();
                    GridView1.DataBind();
                   
                }
                else
                {
                    Panel1.Visible = true;
                    book.Visible = false;
                    Label1.Visible = false;
                }
             
          }
          
            con.Close();
        }

        //load page
        protected void PLoad()
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select count(*) from create_work where employer_id='" + Session["empid"] + "'", con);
            int count = (int)cmd1.ExecuteScalar();
            book.Text = count.ToString();
            SqlCommand cmd = new SqlCommand("select * from create_work where employer_id='" + Session["empid"] + "'", con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        //when no bookings
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("creatework.aspx");
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            Button btnSelect1 = (Button)sender; // Get the button that raised the event
            GridViewRow row = (GridViewRow)btnSelect1.NamingContainer; // Get the reference to the GridView row
            int rowIndex = row.RowIndex; // Get the index of the row     
            string workid = GridView1.DataKeys[rowIndex]["work_id"].ToString();  // Retrieve the user ID from the GridView's data source
            Session["wrkid"] = workid; //session for update page
            SqlCommand cmd1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + workid + "'", con);
            SqlDataReader rd2 = cmd1.ExecuteReader();
            if (rd2 != null && rd2.HasRows)
            {
                if (rd2.Read())
                {
                    if (rd2.IsDBNull(1))
                    {
                        Response.Redirect("updatework.aspx");
                    }
                    else
                    {
                        Response.Write("<script> alert('You can not update now...when work completed'); </script>");
                    }
                }
            }
            else
            {
                Response.Redirect("updatework.aspx");
            }
            rd2.Close();
            con.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("creatework.aspx"); 
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            int rowindex=((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string workid = GridView1.DataKeys[rowindex]["work_id"].ToString();
            con.Open();
            SqlCommand cm1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + workid + "'", con);
            SqlDataReader rd2 = cm1.ExecuteReader();
            if (rd2 != null && rd2.HasRows)
            {
                if (rd2.Read())
                {
                    if (rd2.IsDBNull(0) && rd2.IsDBNull(1))
                    {
                        SqlCommand cmd = new SqlCommand("delete from create_work where work_id='" + workid + "'", con);
                        SqlCommand cmd1 = new SqlCommand("delete from my_orders where work_id='" + workid + "'", con);
                        SqlCommand cmd2 = new SqlCommand("delete from accepted_work where work_id='" + workid + "'", con);

                        cmd.ExecuteNonQuery();
                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();                   
                        Response.Write("<script> alert('Your Work is Successfully Deleted'); </script>");                      
                    }
                    else
                    {
                        Response.Write("<script> alert('You can not delete now...when work started or completed'); </script>");                    
                    }
                }
            }
            else
            {
                SqlCommand cmd = new SqlCommand("delete from create_work where work_id='" + workid + "'", con);
                SqlCommand cmd1 = new SqlCommand("delete from my_orders where work_id='" + workid + "'", con);
                SqlCommand cmd2 = new SqlCommand("delete from accepted_work where work_id='" + workid + "'", con);
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();              
                Response.Write("<script> alert('Your Work is Successfully Deleted'); </script>");
               
            }
            rd2.Close();
            con.Close();
            
            PLoad();
        }

        protected void btnview_Click(object sender, EventArgs e)
        {

            Button btnSelect = (Button)sender; // Get the button that raised the event
            GridViewRow row = (GridViewRow)btnSelect.NamingContainer; // Get the reference to the GridView row
            int rowIndex = row.RowIndex; // Get the index of the row     
            string workid = GridView1.DataKeys[rowIndex]["work_id"].ToString();  // Retrieve the user ID from the GridView's data source
            Session["wrkid"] = workid; //session for view page
            Response.Redirect("viewacceptedworker.aspx");
        }

        protected void btnstart_Click(object sender, EventArgs e)
        {
            Button btnSelect = (Button)sender; // Get the button that raised the event
            GridViewRow row = (GridViewRow)btnSelect.NamingContainer; // Get the reference to the GridView row
            int rowIndex = row.RowIndex; // Get the index of the row     
            string workid = GridView1.DataKeys[rowIndex]["work_id"].ToString();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" + workid + "'", con);
            SqlDataReader rd2 = cmd1.ExecuteReader();
            if (rd2 != null && rd2.HasRows)
            {
                if (rd2.Read())
                {
                    if (rd2.IsDBNull(0))
                    {
                        SqlCommand cmd = new SqlCommand("update accepted_work set work_start_time=@start where work_id='" + workid + "'", con);
                        cmd.Parameters.AddWithValue("@start", DateTime.Now);
                        cmd.ExecuteNonQuery();

                        //update status as in progress
                        SqlCommand cm = new SqlCommand("update my_orders set status=@status where work_id='" + workid + "' and status='"+status1+"'", con);
                        cm.Parameters.AddWithValue("@status", status3);
                        cm.ExecuteNonQuery();
                        Response.Write("<script> alert('Work started now..'); </script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Work aldready started..'); </script>");
                    }
                }
            }
            else
            {
                Response.Write("<script> alert('workers are not present..'); </script>");
            }         
        }

        protected void btnend_Click(object sender, EventArgs e)
        {
            Button btnSelect = (Button)sender; // Get the button that raised the event
            GridViewRow row = (GridViewRow)btnSelect.NamingContainer; // Get the reference to the GridView row
            int rowIndex = row.RowIndex; // Get the index of the row     
            string workid = GridView1.DataKeys[rowIndex]["work_id"].ToString();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT work_start_time,work_end_time FROM accepted_work where work_id='" +workid + "'", con);
            SqlDataReader rd2 = cmd1.ExecuteReader();
            if (rd2 != null && rd2.HasRows)
            {
                if (rd2.Read())
                {
                    if (rd2.IsDBNull(0))
                    {
                        Response.Write("<script> alert('your work was not started yet..'); </script>");
                    }
                    else if (rd2.IsDBNull(1))
                    {
                        SqlCommand cmd = new SqlCommand("update accepted_work set work_end_time=@end where work_id='" + workid + "'", con);
                        cmd.Parameters.AddWithValue("@end", DateTime.Now);
                        cmd.ExecuteNonQuery();

                        SqlCommand cm = new SqlCommand("update my_orders set status=@status where work_id='" + workid + "' and status='"+status3+"'", con);
                        cm.Parameters.AddWithValue("@status", status4);
                        cm.ExecuteNonQuery();
                        Response.Write("<script> alert('Work completed..'); </script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Work aldready ended..'); </script>");
                    }
                }
            }
            else
            {
                Response.Write("<script> alert('workers are not present..'); </script>");
            }
        }
    }
}