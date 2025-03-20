using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class adminbankacc : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select acc_no,bank_balance from admin", con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                txt_balance.Text = rd["bank_balance"].ToString(); //retrieve  from admin table  
                acc_no.Text = rd["acc_no"].ToString() ;
            }
            else
            {
                int z = 0; //dispaly 0 if no balance
                txt_balance.Text = z.ToString();
            }
            rd.Close();
            con.Close();
        }
    }
}