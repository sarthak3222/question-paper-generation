<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/M1.master" AutoEventWireup="true" CodeFile="change_pass.aspx.cs" Inherits="Admin_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Change Password</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="Form1" class="form-horizontal form-label-left" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Current password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:TextBox ID="txt_pass" class="form-control col-md-7 col-xs-12"  runat="server" placeholder="Enter Current password" required="" TextMode="Password"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">New password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:TextBox ID="txtnew_pass" class="form-control col-md-7 col-xs-12"  runat="server" placeholder="Enter New password" required="" TextMode="Password"></asp:TextBox>
                            <asp:PasswordStrength ID="txtnew_pass_PasswordStrength" runat="server" 
                                Enabled="True" TargetControlID="txtnew_pass" StrengthIndicatorType="BarIndicator" PrefixText="Strength:"
                                HelpStatusLabelID="lblhelp" PreferredPasswordLength="8" MinimumNumericCharacters="1"
                                MinimumSymbolCharacters="1" BarBorderCssClass="BarBorder" TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
AverageStrength;GoodStrength;ExcellentStrength">
                            </asp:PasswordStrength>
                            <asp:Label ID="lblhelp" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Re-Enter New password <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:TextBox ID="txtre_pass" class="form-control col-md-7 col-xs-12"  runat="server" placeholder="Re-Enter New password" required="" TextMode="Password"></asp:TextBox>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                      <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="#006699"></asp:Label>
                      </div> 
                      </div> 
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                      <asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
                      </div> 
                      </div> 
                      <b><u><p>* Field Is Mandatory
                      </p></u></b>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <asp:Button ID="btn_change" class="btn btn-success" runat="server" 
                                Text="Change" onclick="btn_change_Click" />
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
</asp:Content>

