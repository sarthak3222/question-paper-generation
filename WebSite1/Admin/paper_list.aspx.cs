using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using System.Web.UI.HtmlControls;
public partial class Admin_Default2 : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry, name;
    DataSet dst = new DataSet();
    SqlDataReader dr;
    SqlCommand cmd = new SqlCommand();
    int select, id;
    SqlCommand com;
    DateTime dt = DateTime.Now.Date;
    DataTable dtt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select pid from paper";
        dr = x.search(qry);
        if (dr.HasRows)
        {
            dr.Read();
            id = Convert.ToInt32(dr[0].ToString());
            x.conclose();
            x.conopen();
            qry = "select pname,date from paper";
            dr = x.search(qry);
            //x.ds = x.fillgrid(x.qry);
            GridView1.DataSource = dr;
            GridView1.DataBind();
        }
        else
        {
        }
        x.conclose();

        //}
    }
    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            string file = e.CommandArgument.ToString();
            Response.Redirect("~/Papers/" + file + ".pdf");
        }
    }

}