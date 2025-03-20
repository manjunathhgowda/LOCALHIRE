<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employerforgot.aspx.cs" Inherits="localhire.employerfogot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image2" runat="server"  src="images/email%20icon.png"  width="20" height="20" />
&nbsp;<label>E-mail</label>
                                     <div class="form-group">
                                        <asp:TextBox ID="txt_email" class="form-control" runat="server" placeholder="Enter your e-mail"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="send"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="send"></asp:RegularExpressionValidator>
                                     
                                     </div> 
                                 </div>
                         </div>

                         <div class="row">
                              <div class="col">
                                    <asp:Button ID="btnsend" class="btn btn-info btn-block" runat="server" 
                                        Text="Send OTP" OnClick="btnsend_Click"  ValidationGroup="send"/>
                              </div> 
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <br />
                                     <asp:Image ID="Image1" runat="server" src="images/otp%20icon.png" width="20" height="20"/>
                                     &nbsp;<label>OTP</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_pass" class="form-control" runat="server" 
                                             placeholder="Enter your OTP" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter OTP" Display="Dynamic" ControlToValidate="txt_pass" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="verify"></asp:RequiredFieldValidator>


                                     </div> 
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     <asp:Button ID="btnverify" class="btn btn-warning btn-block" runat="server" 
                                         Text="Verify OTP" OnClick="btnverify_Click" ValidationGroup="verify" />
                                     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                     </div> 
                                 </div>
                    </div>
                </div>
                <a href="Login.aspx" <asp:LinkButton ID="LinkButton1" runat="server">Back</asp:LinkButton></a>
            </div>
        </div>
    </div>
</asp:Content>
