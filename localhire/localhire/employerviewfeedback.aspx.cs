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
    public partial class employerviewfeedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmdx = new SqlCommand("SELECT name,response,message FROM employerfeedbacks where employer_id='" + Session["empid"] + "'", con);
            SqlDataReader rd = cmdx.ExecuteReader();
            if (rd.Read())
            {
                rd.Close();
                Panel1.Visible = false;
                SqlDataAdapter adapter = new SqlDataAdapter(cmdx);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                dataTable = dataTable.DefaultView.ToTable();
                GridView1.DataBind();
                con.Close();
            }
            else
            {
                Panel1.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("employerhome.aspx");
        }
    }
}