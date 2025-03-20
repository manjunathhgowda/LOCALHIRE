using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using static System.Net.Mime.MediaTypeNames;

namespace localhire
{
    public partial class Registration : System.Web.UI.Page
    {
        int bb = 1000000; //bank balanace
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Labourhire\localhire\localhire\App_Data\localhire.mdf;Integrated Security=True");    
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
       
        protected void btnsave_Click(object sender, EventArgs e)
        {
            //Age validation
            DateTime dob = DateTime.Parse(txt_dob.Text);
            DateTime tday = DateTime.Now;
            int age = tday.Year - dob.Year;
            if (age < 18)
            {
                Response.Write("<script> alert('Age should be 18 or above..'); </script>");
            }
            else
            {
                //registration
                if (usertype_list.SelectedValue == "Worker")
                {
                    //checking the existance of user with email from worker table
                    con.Open();
                    SqlCommand cmdd = new SqlCommand("select count(*) from worker WHERE email = @Email", con);
                    cmdd.Parameters.AddWithValue("@Email", txt_email.Text);
                    int count = (int)cmdd.ExecuteScalar();
                    con.Close();
                    if (count > 0)
                    {
                        Response.Write("<script> alert('This email is aldready exists'); </script>");                  
                    }
                    else
                    {
                        //save data of worker
                        con.Open();
                        SqlCommand cmd1 = new SqlCommand("select count(id) from worker", con);
                        int i = Convert.ToInt32(cmd1.ExecuteScalar());
                        i++;
                        string wrkrid = "WOR" + i.ToString();
                        SqlCommand cmd3 = new SqlCommand("select count(acc_no) from worker", con);
                        int no = Convert.ToInt32(cmd3.ExecuteScalar());
                        no++;
                        string acc_no = "WLP2023" + no.ToString();

                        decimal bal = 0;
                        SqlCommand cmd = new SqlCommand("insert into worker values(@id,@ProfilePicture,@user_type,@name,@email,@mobile,@dob,@gender,@address,@password,@acc_no,@Balance,@cardno,@expiredate,@cvv,@bank_balance)", con);
                        cmd.Parameters.AddWithValue("@id", wrkrid);
                        cmd.Parameters.AddWithValue("@ProfilePicture", "/images/user profile icon.png");
                        cmd.Parameters.AddWithValue("@user_type", usertype_list.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@name", txt_name.Text);
                        cmd.Parameters.AddWithValue("@email", txt_email.Text);
                        cmd.Parameters.AddWithValue("@mobile", Convert.ToInt64(txt_mobile.Text));
                        cmd.Parameters.AddWithValue("@dob", DateTime.Parse(txt_dob.Text));
                        cmd.Parameters.AddWithValue("@gender", gender_list.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@address", txt_address.Text);
                        cmd.Parameters.AddWithValue("@password", txt_cpass.Text);
                        cmd.Parameters.AddWithValue("acc_no", acc_no);
                        cmd.Parameters.AddWithValue("Balance",bal);
                        cmd.Parameters.AddWithValue("@cardno",txtcard.Text);
                        cmd.Parameters.AddWithValue("@expiredate", txtdate.Text);
                        cmd.Parameters.AddWithValue("@cvv", Convert.ToInt32(txtcvv.Text));
                        cmd.Parameters.AddWithValue("@bank_balance", Convert.ToDecimal(bb));
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Microsoft.VisualBasic.Interaction.MsgBox("You are registered successfully with Worker ID:" + wrkrid + "\nYour Labour Pay Account Number is " + acc_no);
                        Response.Redirect("login.aspx");
                    }
                }
                else
                {
                    //checking the existance of user  with email from employer table
                    con.Open();
                    SqlCommand cmdd = new SqlCommand("select count(*) from employer where email=@Email", con);
                    cmdd.Parameters.AddWithValue("@Email", txt_email.Text);
                    int count = (int)cmdd.ExecuteScalar();
                    con.Close();
                    if (count > 0)
                    {
                        Response.Write("<script> alert('This email is aldready exists'); </script>");
                    }
                    else
                    {
                        //save data of employer
                        con.Open();
                        SqlCommand cmd2 = new SqlCommand("select count(id) from employer", con);
                        int i = Convert.ToInt32(cmd2.ExecuteScalar());
                        i++;
                        string empid = "EMP" + i.ToString();
                        SqlCommand cmd3 = new SqlCommand("select count(acc_no) from employer", con);
                        int no = Convert.ToInt32(cmd3.ExecuteScalar());
                        no++;
                        string acc_no = "ELP2023" + no.ToString();
                        decimal bal = 0;
                        SqlCommand cmd = new SqlCommand("insert into employer values(@id,@ProfilePicture,@user_type,@name,@email,@mobile,@dob,@gender,@address,@password,@acc_no,@Balance,@cardno,@expiredate,@cvv,@bank_balance)", con);
                        cmd.Parameters.AddWithValue("@id",empid);
                        cmd.Parameters.AddWithValue("@ProfilePicture", "/images/Admin profile icon.png");
                        cmd.Parameters.AddWithValue("@user_type", usertype_list.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@name", txt_name.Text);
                        cmd.Parameters.AddWithValue("@email", txt_email.Text);
                        cmd.Parameters.AddWithValue("@mobile", Convert.ToInt64(txt_mobile.Text));
                        cmd.Parameters.AddWithValue("@dob", DateTime.Parse(txt_dob.Text));
                        cmd.Parameters.AddWithValue("@gender", gender_list.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@address", txt_address.Text);
                        cmd.Parameters.AddWithValue("@password", txt_cpass.Text);
                        cmd.Parameters.AddWithValue("@acc_no", acc_no);
                        cmd.Parameters.AddWithValue("@Balance",bal);
                        cmd.Parameters.AddWithValue("@cardno",txtcard.Text);
                        cmd.Parameters.AddWithValue("@expiredate", txtdate.Text);
                        cmd.Parameters.AddWithValue("@cvv",Convert.ToInt32(txtcvv.Text));
                        cmd.Parameters.AddWithValue("@bank_balance",Convert.ToDecimal(bb));
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Microsoft.VisualBasic.Interaction.MsgBox("You are registered successfully with Employer ID:" + empid +"\nYour Labour Pay Account Number is "+acc_no);
                        Response.Redirect("login.aspx");
                    }
                }
            }
        }     
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homee.html");
        }     
    }
}