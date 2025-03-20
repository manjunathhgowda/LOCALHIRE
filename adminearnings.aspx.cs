using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class adminearnings : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Pload();
                SqlCommand cmdx = new SqlCommand("SELECT * FROM earnings", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmdx);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                dataTable = dataTable.DefaultView.ToTable();
                GridView1.DataBind();
                con.Close();
            }
        }

        private void Pload()
        {
            SqlCommand cmdx = new SqlCommand("SELECT * FROM earnings", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmdx);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            GridView1.DataSource = dataTable;
            dataTable = dataTable.DefaultView.ToTable();
            GridView1.DataBind();
            con.Close();
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from earnings", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Pload();
        }
    }
}