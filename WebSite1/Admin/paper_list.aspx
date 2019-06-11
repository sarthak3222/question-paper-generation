<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true"
    CodeFile="paper_list.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="clearfix">
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                        Paper List
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
                            <%--<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                Paper List <span class="required">*</span>
                            </label>--%>
                            <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap"
                                AutoGenerateColumns="False" OnRowCommand="GridView1_OnRowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="Paper" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpname" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View Paper" Visible="true">
                                        <ItemTemplate>
                                        <asp:LinkButton ID="btn_down" runat="server" CommandArgument='<%#Eval("pname") %>' CommandName="Download" Text="View Paper"></asp:LinkButton>
                                            <%--<asp:Button ID="btn_down" runat="server" CausesValidation="false" CommandName="Download"
                                                Text="Download" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <%--<div class="col-md-6 col-sm-6 col-xs-12">
                                <asp:DropDownList ID="paper" runat="server" class="form-control col-md-7 col-xs-12"
                                    DataSourceID="SqlDataSource1" DataTextField="pname" DataValueField="pid" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                    SelectCommand="SELECT * FROM [paper]"></asp:SqlDataSource>
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
                            <%--<div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <asp:Button ID="btn_submit" class="btn btn-success" runat="server" Text="Submit"
                                    OnClick="btn_submit_Click" />
                            </div>
                        </div>--%>
                            <%--<asp:Panel ID="Panel1" runat="server" Visible="false">--%>
                            <%--<div class="x_title">
                                    <h2>
                                        <br />
                                        Paper List
                                    </h2>
                                </div>
                                <br />
                                <br />
                                <br />
                            --%>
                            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [pid], [pname], [date] FROM [paper]"></asp:SqlDataSource>--%>
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
                            <%--<div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <asp:Button ID="btninsert" class="btn btn-success" runat="server" Text="Submit" />
                                    </div>
                                </div>--%>
                            <%-- </asp:Panel>--%>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
