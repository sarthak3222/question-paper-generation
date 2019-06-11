using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class M1 : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            Response.Redirect("~/Admin/login.aspx");
        }
        else
        {
            lbl_admin.Text = Session["name"].ToString();
            lbl_admin2.Text = Session["name"].ToString();
        }
        foreach (var x in ContentPlaceHolder1.Controls)
        {
            if (x is DropDownList)
            {
                ((DropDownList)x).Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }
    
}
