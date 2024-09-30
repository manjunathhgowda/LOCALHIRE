<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminfeedback.aspx.cs" Inherits="localhire.adminfeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Give Feedback</title>
    <link href="TeamFeedBack.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section class="us">
            <div class="content">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                           <div class="row">
                                <div class="col bg-warning">
                            <center><h5><b>Feedback Form</b></h5></center>
                                    </div>
                           </div>
                            <hr />
                           <div class="row">
                               <div class="col-6">
                                   <asp:Image ID="Image1" runat="server"  src="images/name%20icon.png"  width="20" height="20" /> &nbsp;<label">Name</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_name" class="form-control" runat="server" placeholder="Enter full Name"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ></asp:RequiredFieldValidator>
                                     </div> 
                               </div>                       
                            <div class="col-6"> 
                                <asp:Image ID="Image3" runat="server"  src="images/email%20icon.png"  width="20" height="15" /> &nbsp;<label">E-Mail ID</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_email1" class="form-control" runat="server" placeholder="Enter your e-mail"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email1" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>                                     </div>  
                                 </div> 
                                </div>

                           <div class="row">
                            <div class="col-6">
                            <label>Are you satisfied with our service?</label>
                                     
                                         <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                           
                                           <asp:ListItem>Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                           <asp:ListItem>No</asp:ListItem>
                                             
                                         </asp:RadioButtonList><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="RadioButtonList1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ></asp:RequiredFieldValidator>

                                     
                                </div>
                              
                            
                           
                            <div class="col-6">
                            <label>Give your ratings...</label>
                               
                                     <asp:RadioButtonList ID="ratingList" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="Bad" Text="&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="Average" Text="&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="Good" Text="&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="Better" Text="&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="Excellent" Text="&nbsp;"></asp:ListItem>
                                     </asp:RadioButtonList>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="ratingList" Font-Size="Small" Font-Bold="True" ForeColor="Red" ></asp:RequiredFieldValidator>
                                 
                            </div>
                            </div>
                             &nbsp;
                           <div class="row">
                                <div class="col">
                            <asp:Image ID="Image4" runat="server" src="images/notebook.png" width="20" height="20" /> &nbsp;<label>Give Feedback</label> 
            <asp:TextBox ID="txt_msg" class="form-control" runat="server" placeholder="Your message or suggestions" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_msg" Font-Size="Small" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                            </div>
                            <hr />
                           <div class="row">
                               <div class="col">
                                   <asp:Button ID="send" class="btn btn-primary btn-block" runat="server" Text="Send" OnClick="send_Click" />
                                   <br />
                            <a href="Homee.html"><img src="images/home.png" width="17" height="17" /> <b>Home</b></a>
                        </div>
                               </div>
                           </div>
                        </div>
                    </div>
                </div>
            
        </section>
    </form>
</body>
</html>
