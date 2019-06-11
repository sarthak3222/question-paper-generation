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
public partial class Admin_generatepaper : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    DateTime dt = DateTime.Today;
    DataSet dst = new DataSet();
    CheckBox chk;
    DataTable dtt = new DataTable();
    int id;
    SqlDataReader dr;
    string ques, opt1, opt2, opt3, opt4;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // type.Items.Insert(0, new ListItem("--Select Type--", "0"));
            fillchapter();
            fillsubject();

        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string dt2 = Convert.ToString(dt);
        string dt4 = dt2.Substring(0, 10);
        x.conopen();
            qry = "select * from paper where pname='" + txtpname.Text + "'";
            dtt = x.ser(qry);
            if (dtt.Rows.Count == 0)
            {
                x.conclose();
                x.conopen();
                qry = "insert into paper values('" + txtpname.Text + "','" + dt4 + "')";
                x.iud(qry);
                x.conclose();

                Panel1.Visible = true;
                x.qry = "SELECT que as Question,ans1 as Ans1, ans2 as Ans2, ans3 as Ans3, ans4 as Ans4,type as Type FROM question WHERE sid =" + subject.SelectedValue + " AND cid =" + chapter.SelectedValue;
                x.ds = x.fillgrid(x.qry);
                GridView1.DataSource = x.ds.Tables[0];
                GridView1.DataBind();
            }
            else
            {
                lbl_sub.Text = "This Paper Name Is Already exist";
                Response.AddHeader("refresh", "2;url=generatepaper.aspx");
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
        subject.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select subject--", "0"));
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
        chapter.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select chapter--", "0"));
        x.conclose();
    }
    protected void chkques_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkstatus = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkstatus.NamingContainer;
    }
    protected void chkheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkheader = (CheckBox)GridView1.HeaderRow.FindControl("chkheader");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chkrow = (CheckBox)row.FindControl("chkques");

            if (chkheader.Checked == true)
            {
                chkrow.Checked = true;
            }
            else
            {
                chkrow.Checked = false;
            }
        }
    }
    protected void btninsert_Click(object sender, EventArgs e)
    {
        x.conopen();
        qry="select pid from paper where pname='" + txtpname.Text+"'";
        dr=x.search(qry);
        if(dr.HasRows)
        {
            dr.Read();
            id=Convert.ToInt32(dr[0].ToString());
        }
        x.conclose();
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                chk = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkques");

                if (chk.Checked)
                {

                    qry = "select * from question where qid=" + (i + 1);
                    dtt.Clear();
                    dtt = x.ser(qry);
                    if (dtt.Rows.Count > 0)
                    {
                        x.conopen();
                        qry = "insert into paper_details values('" + dtt.Rows[0]["qid"].ToString() + "','" + id.ToString() + "')"; 
                        x.iud(qry);
                        x.conclose();

                    }
                }

            }
            x.conopen();
            qry = "SELECT q.que, q.ans1, q.ans2, q.ans3, q.ans4 FROM paper_details AS pd INNER JOIN question AS q ON pd.qid =q.qid INNER JOIN paper AS p ON pd.pid =p.pid where pd.pid='"+id.ToString()+"'";
            dtt = x.ser(qry);
            x.conclose();
            Document doc = new Document(PageSize.A4, 10, 10, 10, 10);
            MemoryStream mstream = new MemoryStream();
            PdfWriter writter = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("~/Papers/" + txtpname.Text + ".pdf"), FileMode.Create));
            doc.Open();
            for (int i = 0; i < dtt.Rows.Count; i++)
            {
                Paragraph p = new Paragraph();
                ques = dtt.Rows[i]["que"].ToString();
                opt1 = dtt.Rows[i]["ans1"].ToString();
                opt2 = dtt.Rows[i]["ans2"].ToString();
                opt3 = dtt.Rows[i]["ans3"].ToString();
                opt4 = dtt.Rows[i]["ans4"].ToString();
                p.Add("Q" + (i + 1) + ". ");
                p.Add(ques);
                p.Add(new Chunk("\n"));
                p.Add("A. ");
                p.Add(opt1);
                p.Add(new Chunk("\n"));
                p.Add("B. ");
                p.Add(opt2);
                p.Add(new Chunk("\n"));
                p.Add("C. ");
                p.Add(opt3);
                p.Add(new Chunk("\n"));
                p.Add("D. ");
                p.Add(opt4);
                p.Add(new Chunk("\n\n"));
                doc.Add(p);
            }
            doc.Close();
            byte[] bytes = mstream.ToArray();
            mstream.Close();
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + txtpname.Text + ".pdf");
            Response.ContentType = "application/pdf";
            Response.Buffer = true;
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.AddHeader("refresh", "2;url=generatepaper.aspx");
    }
}
