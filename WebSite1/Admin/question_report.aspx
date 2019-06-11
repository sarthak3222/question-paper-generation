<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="question_report.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Question Report</h2> 
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
                                            Question ID
                                        </th>
                                        <th>
                                            Subject Name
                                        </th>
                                        <th>
                                            Chapter Name
                                        </th>
                                        <th>
                                            Question
                                        </th>
                                        <th>
                                            Answer 1
                                        </th>
                                        <th>
                                            Answer 2
                                        </th>
                                        <th>
                                            Answer 3
                                        </th>
                                        <th>
                                            Answer 4
                                        </th>
                                        <th>
                                            Correct Answer 
                                        </th>
                                        <th>
                                            Type
                                        </th>
                                        </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%#Eval("qid") %>
                                </td>
                                <td>
                                    <%#Eval("sname") %>
                                </td>
                                <td>
                                    <%#Eval("cname") %>
                                </td>
                                <td>
                                    <%#Eval("que") %>
                                </td>
                                <td>
                                    <%#Eval("ans1") %>
                                </td>
                                <td>
                                    <%#Eval("ans2") %>
                                </td>
                                <td>
                                    <%#Eval("ans3") %>
                                </td>
                                <td>
                                    <%#Eval("ans4") %>
                                </td>
                                <td>
                                    <%#Eval("correctans") %>
                                </td>
                                <td>
                                    <%#Eval("type") %>
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
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                          SelectCommand="SELECT q.qid,s.sname,c.cname,q.que,q.ans1,q.ans2,q.ans3,q.ans4,q.correctans,q.type from question as q inner join subject as s on q.sid=s.sid inner join chapter as c on q.cid=c.cid">
                      </asp:SqlDataSource>
					</div> 
                  </div>
                </div>
        </div>
    </form>
</asp:Content>

