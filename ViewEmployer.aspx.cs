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
    public partial class ViewEmployer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            //employer data is displayed through gridview (in source code)

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT count(*) from employer", con);
            int count = (int)cmd.ExecuteScalar();
            emp.Text = count.ToString();
            con.Close();
        }
    }
}