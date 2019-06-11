<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true"
    CodeFile="showpaper.aspx.cs" Inherits="Admin_showpaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="clearfix">
    </div>
    <%-- <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                        Question
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
                    <div>
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    &nbsp;<div class="form-group">
                                        <asp:Label ID="Label1" runat="server" class="control-label col-md-3 col-sm-3 col-xs-12"
                                            Height="40" Width="20" Text=""></asp:Label>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" class="control-label col-md-3 col-sm-3 col-xs-12"
                                            Height="40" Width="600" Text=""></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;<div class="form-group">
                                        <span>A.</span>
                                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="a" />
                                    </div>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;<div class="form-group">
                                        <span>B.</span>
                                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="a" />
                                    </div>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;<div class="form-group">
                                        <span>C.</span>
                                        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="a" />
                                    </div>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;<div class="form-group">
                                        <span>D.</span>
                                        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="a" />
                                    </div>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;<div class="form-group">
                                        <asp:LinkButton ID="LinkButton1" runat="server">Back</asp:LinkButton>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;<div class="form-group">
                                        <asp:LinkButton ID="LinkButton2" runat="server">Next Question</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" class="control-label col-md-3 col-sm-3 col-xs-12"  width="20" Text=""></asp:Label>
                        <asp:label id="Label2" runat="server" class="control-label col-md-3 col-sm-3 col-xs-12"  width="600" text=""></asp:label>
                        
                    </div>
                    
                    <div class="form-group">
                    <span>A.</span>
                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="a" />
                    </div>
                    <div class="form-group">
                    <span>B.</span>
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="a" />
                    </div>
                    <div class="form-group">
                    <span>C.</span>
                        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="a" />
                    </div>
                    <div class="form-group">
                    <span>D.</span>
                        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="a" />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="LinkButton1" runat="server">Back</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:LinkButton ID="LinkButton2" runat="server">Next Question</asp:LinkButton>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                        Paper
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
                                Select Paper <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:DropDownList ID="paper" runat="server" class="form-control col-md-7 col-xs-12"
                                    DataSourceID="SqlDataSource1" DataTextField="pname" DataValueField="pid" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT * FROM [paper]"></asp:SqlDataSource>
                            </div>
                        </div>
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
                            <div class="table-responsive">
                                <br />
                                <br />
                                <br />
                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap">
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
