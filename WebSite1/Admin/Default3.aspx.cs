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
public partial class Admin_Default3 : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    DataSet dst = new DataSet();
    DataTable dt = new DataTable();
    GridViewRow row;
    CheckBox chk;
    int sqid;
    string ques, opt1, opt2, opt3, opt4;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillsubject();
        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        GridView1.Columns[1].Visible = false;
    }
    protected void chkques_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkstatus = (CheckBox)sender;
        row = (GridViewRow)chkstatus.NamingContainer;
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
        /*TableCell cell;
        
        
        DataKeyArray id = GridView1.DataKeys;
        int c = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            chk = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkques");
            if (chk.Checked) 
            {
                sqid = sqid + " " + i;
            }

        }*/
            /*
            foreach (GridViewRow row in GridView1.Rows)
            {
                cell = row.Cells[0];
                chk = (CheckBox)cell.FindControl("chkques");
                if (chk.Checked) 
                {
                    HiddenField hdnID = row.FindControl("qid") as HiddenField;
                    //hdnID = (HiddenField)row.FindControl("qid");
                    //sqid += GridView1.SelectedRow.Cells[].Text;
                    sqid += id[c].ToString();
                    c++;
                }
            }*/
            string tab_name = generate_tab_name();
           // Response.Write("<script>alert('" + sqid + "')</script>");
            generate_table(tab_name);
            add_ques(tab_name);
            generate_pdf(tab_name);
       // generate_password(tab_name);
        //Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
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
    void generate_table(string tab_name)
    {
        x.conopen();
        qry = "create table " + tab_name + " (sqid int , ques nvarchar(MAX),ans1 nvarchar(MAX),ans2 nvarchar(MAX),ans3 nvarchar(MAX),ans4 nvarchar(MAX));";
        x.iud(qry);
        x.conclose();
    }
    string generate_tab_name()
    {
        String year_code = System.DateTime.Now.ToString().Substring(0,10).Replace("-","_");
        String sub_name = subject.SelectedItem.Text;
        int paper_code;
        x.conopen();
        qry = "select count(*) from information_schema.tables where table_type = 'base table' and table_name like 'obj_" + sub_name + "%" + year_code + "'";
        x.cmd = new SqlCommand(qry, x.cn);
        paper_code = Convert.ToInt32(x.cmd.ExecuteScalar()) + 1;
        x.conclose();
        return "obj_" + sub_name + "_" + paper_code + "_" + year_code;
    }
    void add_ques(string tab_name)
    {
        for (int i = 0 ; i < GridView1.Rows.Count; i++)
        {
            chk = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkques");

            if (chk.Checked)
            {

                    qry = "select * from selectedquestion where sqid=" + (i+1);
                    dt.Clear();
                    dt = x.ser(qry);
                    if (dt.Rows.Count > 0)
                    {
                        x.conopen();
                        qry = "insert into " + tab_name + " values(" + dt.Rows[0]["sqid"].ToString() + ",'" + dt.Rows[0]["ques"].ToString() + "','" + dt.Rows[0]["ans1"].ToString() + "','" + dt.Rows[0]["ans2"].ToString() + "','" + dt.Rows[0]["ans3"].ToString() + "','" + dt.Rows[0]["ans4"].ToString() + "')";
                        x.iud(qry);
                        x.conclose();
                    }
                }
                
            }
        }

    void generate_pdf(string tab_name)
    {
        x.conopen();
        //qry = "select * from obj_bca_master where ques_id in (select ques_id from " + tab_name + ")";
        qry = "select * from " + tab_name;
        dt = x.ser(qry);
        x.conclose();
        Document doc = new Document(PageSize.A4, 10, 10, 10, 10);
        MemoryStream mstream = new MemoryStream();
        PdfWriter writter = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("~/Papers/" + tab_name + ".pdf"), FileMode.Create));
        doc.Open();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Paragraph p = new Paragraph();
            ques = dt.Rows[i]["ques"].ToString();
            opt1 = dt.Rows[i]["ans1"].ToString();
            opt2 = dt.Rows[i]["ans2"].ToString();
            opt3 = dt.Rows[i]["ans3"].ToString();
            opt4 = dt.Rows[i]["ans4"].ToString();
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
        Response.AddHeader("Content-Disposition", "attachment; filename=" + tab_name + ".pdf");
        Response.ContentType = "application/pdf";
        Response.Buffer = true;
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.BinaryWrite(bytes);
    }
}
 