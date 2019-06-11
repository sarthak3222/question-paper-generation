using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_student : System.Web.UI.Page
{
    myclass x = new myclass();
    string qry, str, fname;
    private static Random random = new Random();
    SqlDataReader dr;
    DataTable dt = new DataTable();
    //string dt1 = Convert.ToString(dt);
    //string dt2 = dt1.Substring(0, 10);
    String chk = ".jpg , .jpeg,.png";
    string pass = RandomString(8);
    private string yash5511;
    String dt1 = DateTime.Today.ToString("dd/mm/yyyy");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string Gender;
        Gender = RadioButtonList1.SelectedItem.Value;
        x.conopen();
        qry = "select * from faculty_mster where email_id='" + txtemail.Text + "' or fname='" + txtfname.Text + "'";
        dt = x.ser(qry);
        if (ImgSrc.HasFile)
        {
            str = System.IO.Path.GetExtension(ImgSrc.PostedFile.FileName);
            ImgSrc.PostedFile.SaveAs(Server.MapPath("~/User/images/profile/ " + txtfname.Text + str));
            fname = txtfname.Text + str;
        }
        if (dt.Rows.Count == 0)
        {

            x.conclose();
            if (ImgSrc.HasFile)
            {
                str = System.IO.Path.GetExtension(ImgSrc.PostedFile.FileName);
                if (chk.Contains(str))
                {
                    try
                    {
                        string body = this.PopulateBody(txtemail.Text, txtfname.Text, System.DateTime.Now.ToString(), pass);
                        ImgSrc.PostedFile.SaveAs(Server.MapPath("~/User/images/profile/" + txtfname.Text + str));
                        MailMessage Msg = new MailMessage();
                        Msg.From = new MailAddress(txtemail.Text);
                        Msg.To.Add(txtemail.Text);
                        Msg.Subject = "Please Change your Password After Login";
                        Msg.Body = body;
                        Msg.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.Credentials = new System.Net.NetworkCredential("ysv.libmng@gmail.com", "admin@5511");
                        smtp.EnableSsl = true;
                        smtp.Send(Msg);
                        Msg = null;
                        string Password = "2951997";
                        string Msg1 = "Register-Successed...";
                        string OPTINS = "Paper_Generation";
                        string MobileNumber = txtmob_no.Text;
                        string type = "3";
                        string strUrl = "https://www.bulksmsgateway.in/sendmessage.php?user=sarthak29&password=" + Password + "&message=" + Msg1 + "&sender=" + OPTINS + "&mobile=" + MobileNumber + "&type=" + 3;
                        System.Net.WebRequest request = System.Net.WebRequest.Create(strUrl);
                        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                        Stream s = (Stream)response.GetResponseStream();
                        StreamReader readStream = new StreamReader(s);
                        string dataString = readStream.ReadToEnd();
                        response.Close();
                        s.Close();
                        readStream.Close();
                        //Response.Write("Sent");
                        /*string Password = "2951997";
                        string Msg1 = "Register-Successed...";
                        string OPTINS = "Paper_Generation";
                        string MobileNumber = txtmob_no.Text;
                        string type = "3";
                        string strUrl = "https://www.bulksmsgateway.in/sendmessage.php?user=ansh7117&password=" + Password + "&message=" + Msg1 + "&sender=" + OPTINS + "&mobile=" + MobileNumber + "&type=" + 3;
                        System.Net.WebRequest request = System.Net.WebRequest.Create(strUrl);
                        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                        Stream s = (Stream)response.GetResponseStream();
                        StreamReader readStream = new StreamReader(s);
                        string dataString = readStream.ReadToEnd();
                        response.Close();
                        s.Close();
                        readStream.Close();*/
                       // Response.Write("Sent");
                        lbl_sub.Text = "Your Password Details Sent to your mail";
                        string date1 = txtdob.Text.Substring(0, 10);
                        x.conopen();
                        qry = "insert into faculty_mster values ('" + txtfname.Text + "','" + txtlname.Text + "','" + date1.ToString() + "','" + Gender + "','" + txtcity.Text + "','" + txtmob_no.Text + "','" + txtemail.Text + "','" + pass.ToString() + "','" + fname + "')";
                        x.iud(qry);
                        x.conclose();
                        x.conopen();
                        qry = "insert into admin_master values('" +txtfname.Text+"','"+ txtemail.Text + "','" + pass.ToString() + "')";
                        x.iud(qry);
                        x.conclose();
                        clear();
                    }
                    catch (Exception ex)
                    {
                        lbl_sub.Text = "Connection Error Please Try Agian...";
                    }
                }
                else
                {
                    lbl_sub.Text = "Please Select Image File Only";
                }
            }

            else
            {
                lbl_sub.Text = "Please Select the File";
            }
        }
        else
        {
            // x.conclose();
            lbl_sub.Text = "You Are Already Registered. Now you will be redirect to login page";
            // lbl_sub.Text = "This Enrollment Number Is Already Registered....";
            //Response.AddHeader("Refresh", "5;url=Login.aspx");
        }
        Response.AddHeader("refresh", "5;url=faculty.aspx");
    }
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789abcdefghijklmnopqrstuvwxyz";
        return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
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

public  object ON { get; set; }}
