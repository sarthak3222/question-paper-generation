<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true"
    CodeFile="generatepaper.aspx.cs" Inherits="Admin_generatepaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="clearfix">
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                        Generate Paper
                    </h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    </ul>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="Form1" class="form-horizontal form-label-left" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                            Paper Name<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:TextBox ID="txtpname" class="form-control col-md-7 col-xs-12" runat="server"
                                placeholder="Enter Paper Name" required=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You Must Enter Paper Name"
                                ForeColor="Red" ControlToValidate="txtpname" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                            Select Subject <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:DropDownList ID="subject" runat="server" class="form-control col-md-7 col-xs-12"
                                DataSourceID="SqlDataSource4" DataTextField="sname" DataValueField="sid" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM [subject]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                            Select Chapter <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:DropDownList ID="chapter" runat="server" class="form-control col-md-7 col-xs-12"
                                DataSourceID="SqlDataSource3" DataTextField="cname" DataValueField="cid">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT * FROM [chapter] WHERE ([sid] = @sid)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="subject" Name="sid" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <%-- <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                            Type <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:DropDownList ID="type" runat="server" class="form-control col-md-7 col-xs-12">
                                <asp:ListItem Value="1">Easy</asp:ListItem>
                                <asp:ListItem Value="2">Moderate</asp:ListItem>
                                <asp:ListItem Value="3">Hard</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="type"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>--%>
                    <asp:Label ID="lbl_sub" runat="server" Font-Bold="True" ForeColor="#006699"></asp:Label>
                    <b><u>
                        <p>
                            * Field Is Mandatory
                        </p>
                    </u></b>
                    <br />
                    <%--<div class="ln_solid">
                    </div>--%>
                    <br />
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
                        <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap"
                            AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkques" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Question" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblque" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Answer 1" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblans1" runat="server" Text='<%# Eval("Ans1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Answer 2" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblans2" runat="server" Text='<%# Eval("Ans2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Answer 3" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblans3" runat="server" Text='<%# Eval("Ans3") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Answer 4" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lblans4" runat="server" Text='<%# Eval("Ans4") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type" Visible="true">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltype" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [que], [ans2], [ans1], [ans3], [ans4] ,[type] FROM [question]">
                        </asp:SqlDataSource>--%>
                        <div class="ln_solid">
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <asp:Button ID="btninsert" class="btn btn-success" runat="server" Text="Submit" OnClick="btninsert_Click" />
                            </div>
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="" Font-Bold="True" ForeColor="#006699"></asp:Label>
                    </asp:Panel>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
