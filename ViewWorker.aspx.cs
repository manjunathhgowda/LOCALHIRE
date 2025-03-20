using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class ViewWorker : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True; MultipleActiveResultSets=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            //worker data is displayed through gridview (in source code)

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT count(*) from worker", con);
            int count = (int)cmd.ExecuteScalar();
            wrkr.Text = count.ToString();
            con.Close();
        }
    }
}