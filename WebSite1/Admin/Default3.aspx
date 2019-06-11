<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true"
    CodeFile="Default3.aspx.cs" Inherits="Admin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="clearfix">
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                        Select Question
                    </h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="x_content">
                    <div class="table-responsive">
                        <br />
                        <form id="Form1" class="form-horizontal form-label-left" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                Select Subject <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:DropDownList ID="subject" runat="server" class="form-control col-md-7 col-xs-12"
                                    DataSourceID="SqlDataSource1" DataTextField="sname" DataValueField="sid" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT * FROM [subject]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <asp:Label ID="lbl_sub" runat="server" Font-Bold="True" ForeColor="#006699"></asp:Label>
                        <b><u>
                            <p>
                                * Field Is Mandatory
                            </p>
                        </u></b>
                        <br />
                        <%--<div class="ln_solid">
                    </div>--%>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <asp:Button ID="btn_submit" class="btn btn-success" runat="server" Text="Submit"
                                    OnClick="btn_submit_Click" />
                            </div>
                        </div>
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <div class="x_title">
                                <h2>
                                    <br />
                                    Questions List
                                </h2>
                            </div>
                            <br />
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" 
                                class="table table-striped table-bordered dt-responsive nowrap" 
                                AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkques" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="sqid" HeaderText="sqid" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="sqid" Visible="False" />
                                    <asp:BoundField DataField="ques" HeaderText="ques" SortExpression="ques" />
                                    <asp:BoundField DataField="ans1" HeaderText="ans1" SortExpression="ans1" />
                                    <asp:BoundField DataField="ans2" HeaderText="ans2" SortExpression="ans2" />
                                    <asp:BoundField DataField="ans3" HeaderText="ans3" SortExpression="ans3" />
                                    <asp:BoundField DataField="ans4" HeaderText="ans4" SortExpression="ans4" />
                                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT [sqid], [ques], [ans1], [ans2], [ans3], [ans4], [type] FROM [selectedquestion]">
                            </asp:SqlDataSource>
                            <%--<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                            Enter Paper Name<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:TextBox ID="txtpname" class="form-control col-md-7 col-xs-12" runat="server"
                                placeholder="Enter paper name" required=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You Must Enter Paper Name"
                                ForeColor="Red" ControlToValidate="txtpname" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>--%>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <asp:Button ID="btninsert" class="btn btn-success" runat="server" Text="Submit" OnClick="btninsert_Click" />
                                </div>
                            </div>
                        </asp:Panel>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<%--<form id="form1" runat="server">
<asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    </form>
--%>