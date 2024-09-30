<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employerreset.aspx.cs" Inherits="localhire.employerreset" %>
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
                                     <asp:Image ID="Image2" runat="server"  src="images/password%20icon.png"  width="20" height="20" />
&nbsp;<label>New Password</label>
                                     <div class="form-group">
                                        <asp:TextBox ID="txt_npass" class="form-control" runat="server" 
                                             placeholder="Enter New Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_npass" Font-Size="Small" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                                     </div> 
                                 </div>
                         </div>


                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <br />
                                     <asp:Image ID="Image1" runat="server" src="images/password%20icon.png" width="20" height="20"/>
                                     &nbsp;<label>Confirm Password</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_cpass" class="form-control" runat="server" 
                                             placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_cpass" Font-Size="Small" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*not match" Font-Bold="True" Font-Size="Small" ControlToCompare="txt_npass" ControlToValidate="txt_cpass" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>                                   
                                     </div> 
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     <asp:Button ID="btnreset" class="btn btn-success btn-block" runat="server" Text="Reset" OnClick="btnreset_Click" />

                                     </div> 
                                 </div>
                    </div>
                </div>
                <a href="employerforgot.aspx" <asp:LinkButton ID="LinkButton1" runat="server">Back</asp:LinkButton></a>
            </div>
        </div>
    </div>
</asp:Content>
