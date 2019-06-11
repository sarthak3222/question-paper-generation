<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="ud_chapter.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Chapter Report</h2> 
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                  <div class="table-responsive">
                      <asp:GridView ID="GridView1" runat="server" 
                          class="table table-striped jambo_table bulk_action dataTable" AutoGenerateColumns="False" 
                          DataSourceID="SqlDataSource1" 
                          EmptyDataText="There are no data records to display." 
                          DataKeyNames="cid">
                          <Columns>
                              <asp:BoundField DataField="cid" HeaderText="Chapter Id" ReadOnly="True" 
                                  SortExpression="cid" InsertVisible="False" />
                                  <asp:BoundField DataField="sname" HeaderText="Subject" ReadOnly="True" 
                                  SortExpression="sname" InsertVisible="False" />
                              <asp:BoundField DataField="cname" HeaderText="Chapter Name" 
                                  SortExpression="cname" />
                              <asp:CommandField ShowEditButton="True" HeaderText="Update" />
                              <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT c.cid,s.sname,c.cname FROM chapter as c INNER JOIN subject as s on c.sid=s.sid order by cid" 
                          DeleteCommand="DELETE FROM chapter WHERE cid = @cid" 
                          
                          
                          UpdateCommand="UPDATE chapter SET cname =@cname where cid=@cid">
                          <DeleteParameters>
                              <asp:Parameter Name="cid" />
                          </DeleteParameters>
                          <UpdateParameters>
                              <asp:Parameter Name="cname" />
                              <asp:Parameter Name="sname" />
                              <asp:Parameter Name="cid" />
                          </UpdateParameters>
                      </asp:SqlDataSource>
                  </div> 
                  </div>
                </div>
        </div>
    </form>

</asp:Content>

