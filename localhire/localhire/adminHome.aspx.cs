using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class adminHome : System.Web.UI.Page
    {
      
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (!IsPostBack)
            {
                PLoad();
            }
        }
        void PLoad()
        {

            SqlCommand cmd = new SqlCommand("select categories from works", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            GridView1.DataSource = dataTable;
            dataTable.DefaultView.Sort = "categories ASC"; //ascending order
            dataTable = dataTable.DefaultView.ToTable();
            GridView1.DataBind();
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            //check for existence
            con.Open();
            SqlCommand cmdd = new SqlCommand("select count(*) from works where categories = @categories", con);
            cmdd.Parameters.AddWithValue("@categories", txtworks.Text);
            int count = (int)cmdd.ExecuteScalar();
            con.Close();
            if (count > 0)
            {
                Response.Write("<script> alert('This category is aldready present'); </script>");
                txtworks.Text = "";
            }
            else
            {
                //insertion
                con.Open();
                SqlCommand cmd1 = new SqlCommand("insert into works values(@categories)", con);
                cmd1.Parameters.AddWithValue("@categories", txtworks.Text);
                int rowsAffected = cmd1.ExecuteNonQuery();
                PLoad();
                txtworks.Text = "";
            }
        }

        protected void btnremove_Click(object sender, EventArgs e)
        {
            //check for existence
            con.Open();
            SqlCommand cmdd = new SqlCommand("select count(*) from works where categories = @categories", con);
            cmdd.Parameters.AddWithValue("@categories", txtworks.Text);
            int count = (int)cmdd.ExecuteScalar();
            con.Close();
            if (count == 0)
            {
                Response.Write("<script> alert('This category is does not exist'); </script>");
                txtworks.Text = "";

            }
            else
            {
                //deletion
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from works where categories='" + txtworks.Text + "'", con);
                int rowsAffected = cmd.ExecuteNonQuery();
                PLoad();
                txtworks.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Visible = false;    
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("report.aspx");
        }
    }
}