<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="ud_subject.aspx.cs" Inherits="Admin_Default2" %>

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
                      <asp:GridView ID="GridView1" runat="server" 
                          class="table table-striped jambo_table bulk_action dataTable" AutoGenerateColumns="False" 
                          DataSourceID="SqlDataSource1" 
                          EmptyDataText="There are no data records to display." 
                          DataKeyNames="sid">
                          <Columns>
                              <asp:BoundField DataField="sid" HeaderText="Subject Id" ReadOnly="True" 
                                  SortExpression="sid" InsertVisible="False" />
                              <asp:BoundField DataField="sname" HeaderText="Subject" 
                                  SortExpression="sname" />
                              <asp:CommandField ShowEditButton="True" HeaderText="Update" />
                              <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT [sid], [sname] FROM [subject] order by sid" 
                          DeleteCommand="DELETE FROM author_mster WHERE sid = @sid" 
                          
                          
                          UpdateCommand="UPDATE subject SET sname =@sname where sid=@sid">
                          <DeleteParameters>
                              <asp:Parameter Name="sid" />
                          </DeleteParameters>
                          <UpdateParameters>
                              <asp:Parameter Name="sname" />
                              <asp:Parameter Name="sid" />
                          </UpdateParameters>
                      </asp:SqlDataSource>
                  </div> 
                  </div>
                </div>
        </div>
    </form>

</asp:Content>

