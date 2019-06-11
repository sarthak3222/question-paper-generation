using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_subject : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select * from subject where sname='" + txtsubname.Text + "'";
        dt = x.ser(qry);
        if (dt.Rows.Count == 0)
        {
            x.conclose();
            x.conopen();
            qry = "insert into subject values ('" + txtsubname.Text + "')";
            x.iud(qry);
            x.conclose();
            lbl_sub.Text = "subject is added...";
            clear();
            Response.AddHeader("refresh", "2;url=subject.aspx");
        }
        else
        {
            lbl_sub.Text = "Subject Is Already Added";
            Response.AddHeader("refresh", "2;url=subject.aspx");
        }
    }
    void clear()
    {
        foreach (var x in Form1.Controls)
        {
            if (x is TextBox)
            {
                ((TextBox)x).Text = "";
            }
        }
    }
}