using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_question : System.Web.UI.Page
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
            fillchapter();
            type.Items.Insert(0, new ListItem("--Select Type--", "0"));

        }
    }
    void fillsubject()
    {
        x.conopen();
        qry = "select * from subject";
        dst = x.fills(qry);
        //DropDownList1.DataSource=dst.Tables[0];
       subject.DataTextField = "sname";
        subject.DataValueField = "sid";
        subject.DataBind();
        subject.Items.Insert(0, new ListItem("--Select subject--", "0"));
        x.conclose();
    }
    void fillchapter()
    {
        x.conopen();
        qry = "select * from chapter";
        dst = x.fills(qry);
        //DropDownList1.DataSource=dst.Tables[0];
        chapter.DataTextField = "cname";
        chapter.DataValueField = "cid";
        chapter.DataBind();
        chapter.Items.Insert(0, new ListItem("--Select chapter--", "0"));
        x.conclose();
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (subject.SelectedItem.Text == "--Select subject--" || chapter.SelectedItem.Text == "--Select chapter--" || type.SelectedItem.Text == "--Select Type--" )
        {
            lbl_sub.Text = "DropDown Must Be Select...!!!";
        }
        else
        {
            x.conopen();
            qry = "select * from question where que='" + txtques.Text + "'";
            dt = x.ser(qry);
            if (dt.Rows.Count == 0)
            {
                x.conclose();
                x.conopen();
                qry = "insert into question values ('" + subject.SelectedValue + "','" + chapter.SelectedValue + "','" + txtques.Text + "','" + txtans1.Text + "','" + txtans2.Text + "','" + txtans3.Text + "','" + txtans4.Text + "','" + txtca.Text + "','" + type.SelectedItem.Text + "')";
                x.iud(qry);
                x.conclose();
                lbl_sub.Text = "Question is added.....";
                clear();
                Response.AddHeader("refresh", "2;url=question.aspx");
            }
            else
            {
                lbl_sub.Text = "Question Is Already Added";
                Response.AddHeader("refresh", "2;url=question.aspx");
            }
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