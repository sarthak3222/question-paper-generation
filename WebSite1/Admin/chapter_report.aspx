<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true"
    CodeFile="chapter_report.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    Chapter Report</h2>
                <div class="clearfix">
                </div>
            </div>
            <div class="x_content">
                <div class="table-responsive">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table table-striped jambo_table bulk_action dataTable">
                                <thead>
                                    <tr>
                                        <th>
                                            Chapter ID
                                        </th>
                                        <th>
                                            Chapter Name
                                        </th>
                                        <th>
                                            Subject Name
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%#Eval("cid") %>
                                </td>
                                <td>
                                    <%#Eval("cname") %>
                                </td>
                                <td>
                                    <%#Eval("sname") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody> </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <%--<asp:GridView ID="GridView2" runat="server" 
                          class="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" 
                          DataSourceID="SqlDataSource1" 
                          EmptyDataText="There are no data records to display." CellPadding="0" 
                          AllowSorting="True" >
                          <Columns>
                              <asp:BoundField DataField="pub_id" HeaderText="pub_id" ReadOnly="True" 
                                  SortExpression="pub_id" />
                              <asp:BoundField DataField="pub_name" HeaderText="pub_name" 
                                  SortExpression="pub_name" />
                          </Columns>
                      </asp:GridView>--%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.cid,c.cname,s.sname FROM chapter as c INNER JOIN subject as s on c.sid=s.sid">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    </form>
</asp:Content>
