using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace localhire
{
    public partial class adminwallet : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = false; 
                PLoad();
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from admin", con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                txt_balance.Text = rd["Balance"].ToString(); //retrieve  from admin table              
               
            }
            else
            {
                int z = 0; //dispaly 0 if no balance
                txt_balance.Text = z.ToString();
            }
            rd.Close();
            con.Close();
        }
        protected void PLoad()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from admin", con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                txt_balance.Text = rd["Balance"].ToString(); //retrieve from employer table
            }
            rd.Close();
            con.Close();
        }
        protected void btnwithdraw_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            btnaddamt.Visible = false;
            btnwithdrawamt.Visible = true;
        }

        protected void btnaddcash_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            btnaddamt.Visible = true;
            btnwithdrawamt.Visible = false;
        }

        protected void btnwithdrawamt_Click(object sender, EventArgs e)
        {
            decimal amt;
            if (Decimal.TryParse(txt_amt.Text, out amt))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select Balance from admin", con);
                SqlDataReader rd = cmd.ExecuteReader();
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
                        SqlCommand cmd1 = new SqlCommand("update admin set Balance=Balance-@Balance", con);
                        SqlCommand cmd2 = new SqlCommand("update admin set bank_balance=bank_balance+@bank_balance", con);
                        cmd1.Parameters.AddWithValue("@Balance", Convert.ToDecimal(txt_amt.Text));
                        cmd2.Parameters.AddWithValue("@bank_balance", Convert.ToDecimal(txt_amt.Text));
                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                        Response.Write("<script> alert('Amount Wihdraw from your wallet and deposite to your bank');</script>");
                        Panel1.Visible = false;
                    }
                }
                con.Close();
            }
            PLoad();
        }

        protected void btnaddamt_Click(object sender, EventArgs e)
        {
            con.Open();
            decimal amt;
            if (Decimal.TryParse(txt_amt.Text, out amt))
            {

                SqlCommand cmd = new SqlCommand("select Balance from admin", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    decimal balance = rd.GetDecimal(0);
                    if (amt > balance)
                    {
                        Response.Write("<script> alert('Insuffiecient balance in your bank');</script>");
                    }
                    else
                    {
                        rd.Close();
                        SqlCommand cmd1 = new SqlCommand("update admin set Balance=Balance+@Balance", con);
                        SqlCommand cmd2 = new SqlCommand("update admin set bank_balance=bank_balance-@bank_balance", con);
                        cmd1.Parameters.AddWithValue("@Balance", Convert.ToDecimal(txt_amt.Text));
                        cmd2.Parameters.AddWithValue("@bank_balance", Convert.ToDecimal(txt_amt.Text));
                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                        Response.Write("<script> alert('Amount Deposited to your wallet from your bank');</script>");
                        Panel1.Visible = false;
                    }
                }
            }
            con.Close();
            PLoad();
        }
    }
}