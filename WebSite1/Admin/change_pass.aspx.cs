using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class Admin_Default : System.Web.UI.Page
{
    myclass x = new myclass();
    DataTable dat = new DataTable();
    string qry;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            Response.Redirect("~/Admin/login.aspx");
        }
    }
    protected void btn_change_Click(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select * from admin_mster where name='" + Session["name"].ToString() + "'";
        dr = x.search(qry);
        if (dr.HasRows)
        {
            dr.Read();
            if (txt_pass.Text == dr[3].ToString())
            {
                if (txtnew_pass.Text == txtre_pass.Text)
                {
                    x.conclose();
                    x.conopen();
                    qry = "update admin_mster set password='" + txtnew_pass.Text + "' where name='" + Session["name"].ToString() + "'";
                    x.iud(qry);
                    Label1.Text = "Password will Be changed";
                    Response.AddHeader("refresh", "3;url=login.aspx");
                    //Response.Redirect("~/Admin/login.aspx");
                }
                else
                {
                    Label2.Text = "You Must Enter Same in Both New & Re-enter Password";
                }
            }
            else
            {
               Label2.Text = "Current Password Wrong";
            }
        }
        else
        {
            Label2.Text = "No User Found";
        }
        x.conclose();
    }
}