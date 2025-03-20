<%@ Page Title="" Language="C#" MasterPageFile="~/WORKERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="GiveFeedback2.aspx.cs" Inherits="localhire.GiveFeedback2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="us">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8">

                        
                    <div class="card">
                        <div class="card-body ">
                           <div class="row">
                                <div class="col bg-warning">
                            <center><h5><b>Feedback</b></h5></center>
                                    </div>
                           </div>
                            <hr />
                           <div class="row">
                               <div class="col-12">
                                   <asp:Image ID="Image1" runat="server"  src="images/name%20icon.png"  width="20" height="20" /> &nbsp;<label">Name</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_name" class="form-control" runat="server" placeholder="Enter full Name"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="a" ></asp:RequiredFieldValidator>
                                     </div> 
                             </div> 
                                </div>
                            <br />

                           <div class="row">
                            <div class="col-12">
                            <label>Is employer was friendly?</label> &nbsp;&nbsp;&nbsp;&nbsp;                                  
                                         <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">                                          
                                           <asp:ListItem>Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                           <asp:ListItem>No</asp:ListItem>
                                             
                                         </asp:RadioButtonList><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="RadioButtonList1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>                                   
                                </div>                         
                            </div>
                             &nbsp;
                           <div class="row">
                                <div class="col">
                            <asp:Image ID="Image4" runat="server" src="images/notebook.png" width="20" height="20" /> &nbsp;<label>Give Feedback</label> 
            <asp:TextBox ID="txt_msg" class="form-control" runat="server" placeholder="Your message or suggestions" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_msg" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="a" ></asp:RequiredFieldValidator>

                        </div>
                            </div>
                            <hr />
                           <div class="row">
                               <div class="col-6">
                                    <asp:Button ID="backskip" class="btn btn-secondary btn-block" runat="server" Text="Skip" OnClick="backskip_Click" />
                                   <br />
                        </div>
                               <div class="col-6">
                                    <asp:Button ID="send" class="btn btn-primary btn-block" runat="server" Text="Send" ValidationGroup="a" Onclick="send_Click" />

                                   <br />
                        </div>
                               </div>
                           </div>
                        </div>
                            </div>
                        <div class="col-2"></div>
                    </div>
                    </div>
                </div>
            
        </section>  
</asp:Content>
