using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_showpaper : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    int cnt = 1;
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
       /* x.conopen();
        x.qry = "select * from questionpaper where pid = '2'";
        x.search(x.qry);
        int currec = 1;
        if (x.dr.HasRows)
        {
            while (x.dr.Read())
            {
                if (currec == cnt)
                {
                    Label1.Text = Convert.ToString(currec);
                    Label2.Text = x.dr["ques"].ToString();
                    RadioButton1.Text = x.dr["ans1"].ToString();
                    RadioButton2.Text = x.dr["ans2"].ToString();
                    RadioButton3.Text = x.dr["ans3"].ToString();
                    RadioButton4.Text = x.dr["ans4"].ToString();
                }
                currec++;
            }
        }
        else
        {
        }
        x.conclose();*/
        if (!IsPostBack)
        {
            fillpaper();
        }
    }
    void fillpaper()
    {
        x.conopen();
        qry = "select * from paper";
        dst = x.fills(qry);
        //DropDownList1.DataSource=dst.Tables[0];
        paper.DataTextField = "pname";
        paper.DataValueField = "pid";
        paper.DataBind();
        paper.Items.Insert(0, new ListItem("--Select paper--", "0"));
        x.conclose();
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        x.conopen();
        qry = "select ques as Question,ans1 as Ans1, ans2 as Ans2, ans3 as Ans3, ans4 as Ans45 from questionpaper where pid='" + paper.SelectedItem.Value + "'";
        x.ds = x.fillgrid(qry);
        GridView1.DataSource = x.ds.Tables[0];
        GridView1.DataBind();
        x.conclose();
    }
}