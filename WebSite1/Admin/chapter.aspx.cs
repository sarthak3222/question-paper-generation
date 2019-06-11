using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_chapter : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    DataSet dst = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillsubject();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
         x.conopen();
            qry = "select * from chapter where cname='" + txtchname.Text + "'";
            dt = x.ser(qry);
            if (dt.Rows.Count == 0)
            {
                x.conclose();
                x.conopen();
                qry = "insert into chapter values ('" + DropDownList2.SelectedValue + "','" + txtchname.Text + "')";
                x.iud(qry);
                x.conclose();
                lbl_sub.Text = "Chapter is added...";
                clear();
                Response.AddHeader("refresh", "2;url=chapter.aspx");
            }
            else
            {
                lbl_sub.Text = "Question Is Already Added";
                Response.AddHeader("refresh", "2;url=chapter.aspx");
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
    void fillsubject()
    {
        x.conopen();
        qry = "select * from subject";
        dst = x.fills(qry);
        //DropDownList1.DataSource=dst.Tables[0];
        DropDownList2.DataTextField = "sname";
        DropDownList2.DataValueField = "sid";
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, new ListItem("--Select subject--", "0"));
        x.conclose();
    }
}