using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Net.Mail;
public partial class Admin_login : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry;
    SqlDataReader dr;
    TimeSpan diff;
    DateTime dt = DateTime.Now.Date;
    string username, password;
    protected void Page_Load(object sender, EventArgs e)
    {
        /* x.conopen();
         qry = "select * from sms_mster where date='" + DateTime.Today + "'";
         dr = x.search(qry);
         if (dr.HasRows)
         {
             dr.Read();
         }
            
         else
         {
             x.conclose();
             x.conopen();
             qry = "insert into sms_mster values('1','" + DateTime.Today + "')";
             x.iud(qry);
             x.conclose();
             x.conopen();
             qry = "select s.mob_no,i.issue_date from issue_mster as i inner join student_mster as s on i.enrollment_no=s.enrollment_no";
             dr = x.search(qry);
             while (dr.Read())
             {
                 string idate = Convert.ToString(dr[1]);
                 diff = Convert.ToDateTime(dt) - Convert.ToDateTime(idate);
                 // double days = diff.TotalDays;
                 if (diff.TotalDays == 6)
                 {
                     string Password = "yash5511";
                     string Msg1 = "Tomorrow-is-last-day-for-issued-book";
                     string OPTINS = "SMTLIB";
                     string mobno = Convert.ToString(dr[0]);
                     // x.conclose();
                     string MobileNumber = mobno;
                     string type = "3";
                     string strUrl = "http://bulksmsgateway.in/sendmessage.php?user=yashjari&password=" + Password + "&message=" + Msg1 + "&sender=" + OPTINS + "&mobile=" + MobileNumber + "&type=" + 3;
                     System.Net.WebRequest request = System.Net.WebRequest.Create(strUrl);
                     HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                     Stream s = (Stream)response.GetResponseStream();
                     StreamReader readStream = new StreamReader(s);
                     string dataString = readStream.ReadToEnd();
                     response.Close();
                     s.Close();
                     readStream.Close();
                 }
             }
             x.conclose();
         }
         x.conclose();*/

     }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select * from admin_master where email_id='" + txtuname.Text + "'and password='" + txtpass.Text +"'";
        dr = x.search(qry);
        if (dr.HasRows)
        {
            dr.Read();
            Session["name"] = dr[1].ToString();
            Response.Redirect("ahome.aspx");

        }
        else
        {
            Label1.Text = "User not found...";
        }
        x.conclose();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        x.conopen();
        qry = "select * from admin_master where email_id='" + txtuname.Text + "'";
        dr = x.search(qry);
        if (dr.HasRows)
        {
            dr.Read();
            username = dr[1].ToString();
            password = dr[3].ToString();
        }
        x.conclose();
        try
        {
            string body = this.PopulateBody(txtuname.Text,username ,System.DateTime.Now.ToString(), password);
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(txtuname.Text);
            Msg.To.Add(txtuname.Text);
            Msg.Subject = " Recover your Password";
            Msg.Body = body;
            Msg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("ysv.libmng@gmail.com", "admin@5511");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            Msg = null;
            Label1.Text = "Recover your Password From your Mail Id";
            Response.AddHeader("refresh", "5;url=login.aspx");
        }
        catch (Exception ex)
        {
            Label1.Text = "Connection Error Please Try Agian...";
            Response.AddHeader("refresh", "5;url=login.aspx");
        }
    }
    private string PopulateBody(string EmailID, string UserName, string SystemDateTime, string Code)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/Admin/Mail.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{EmailID}", EmailID);
        body = body.Replace("{UserName}", UserName);
        body = body.Replace("{SystemDateTime}", SystemDateTime);
        body = body.Replace("{Code}", Code);
        return body;
    }
public  object ON { get; set; }
}
