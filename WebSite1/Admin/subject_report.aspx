<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="subject_report.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">
        <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Subject Report</h2> 
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                  <div class="table-responsive">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table table-striped jambo_table bulk_action dataTable">
                                <thead>
                                    <tr>
                                        <th>
                                            Subject ID
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
                                    <%#Eval("sid") %>
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

                     <%-- <asp:GridView ID="GridView1" runat="server" 
                          class="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" 
                          DataSourceID="SqlDataSource1" 
                          EmptyDataText="There are no data records to display." 
                          DataKeyNames="author_id">
                          <Columns>
                              <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" 
                                  SortExpression="author_id" />
                              <asp:BoundField DataField="author_name" HeaderText="author_name" 
                                  SortExpression="author_name" />
                          </Columns>
                      </asp:GridView>--%>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT [sid], [sname] FROM [subject]" >
                      </asp:SqlDataSource>
                    
					</div>
                  </div>
                </div>
        </div>
    </form>

</asp:Content>

