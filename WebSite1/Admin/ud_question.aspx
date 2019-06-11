<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true"
    CodeFile="ud_question.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    Question Report</h2>
                <div class="clearfix">
                </div>
            </div>
            <div class="x_content">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" class="table table-striped jambo_table bulk_action dataTable"
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                        DataKeyNames="qid">
                        <Columns>
                            <asp:BoundField DataField="qid" HeaderText="Question
Id" ReadOnly="True" SortExpression="qid" InsertVisible="False" />
                            <asp:BoundField DataField="sname" HeaderText="Subject" SortExpression="sname" />
                            <asp:BoundField DataField="cname" HeaderText="Chapter" SortExpression="cname" />
                            <asp:BoundField DataField="que" HeaderText="Question" SortExpression="ques" />
                            <asp:BoundField DataField="ans1" HeaderText="Answer 1" SortExpression="ans1" />
                            <asp:BoundField DataField="ans2" HeaderText="Answer 2" SortExpression="ans2" />
                            <asp:BoundField DataField="ans3" HeaderText="Answer 3" SortExpression="ans3" />
                            <asp:BoundField DataField="ans4" HeaderText="Answer 4" SortExpression="ans4" />
                            <asp:BoundField DataField="correctans" HeaderText="Correct Answer " SortExpression="correctans" />
                            <asp:BoundField DataField="type" HeaderText="Type " SortExpression="type" />
                            <asp:CommandField ShowEditButton="True" HeaderText="Update" />
                            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString%>"
                        SelectCommand="SELECT q.qid,s.sname,c.cname,q.que,q.ans1,q.ans2,q.ans3,q.ans4,q.correctans,q.type
                                        from question as q inner join subject as s on q.sid=s.sid inner join chapter as
                                        c on q.cid=c.cid order by qid" 
                                        DeleteCommand="DELETE FROM question WHERE qid = @qid"
                                        UpdateCommand="UPDATE question SET que =@que,ans1=@ans1,ans2=@ans2,ans3=@ans3,ans4=@ans4,correctans=@correctans,type=@type
                                        where qid=@qid">
                        <DeleteParameters>
                            <asp:Parameter Name="author_id" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="author_name" />
                            <asp:Parameter Name="author_id" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    </form>
</asp:Content>
