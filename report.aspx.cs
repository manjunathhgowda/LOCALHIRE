using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            con.Open();
            string query1 = "SELECT COUNT(*) FROM employer";
            string query2 = "SELECT COUNT(*) FROM worker";

            SqlCommand command1 = new SqlCommand(query1, con);
            SqlCommand command2 = new SqlCommand(query2, con);

            int table1Count = (int)command1.ExecuteScalar();
            int table2Count = (int)command2.ExecuteScalar();
            int total=table1Count + table2Count;
            ttl.Text=total.ToString();
            emp.Text=table1Count.ToString();
            wrkr.Text=table2Count.ToString();

            Chart1.Series["Series1"].Points[0].YValues = new double[] { table1Count };
            Chart1.Series["Series1"].Points[1].YValues = new double[] { table2Count };

            Chart1.Series["Series1"].Points[0].Label = "Employer";
            Chart1.Series["Series1"].Points[1].Label = "Worker";

            Chart1.Series["Series1"]["PieLabelStyle"] = "Enabled";

            Chart1.DataBind();
            con.Close();
        }
    }
}