<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="localhire.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content ="width=device-width, initial-scale=1.0" />
    <title>Contact Us</title>
    <link href="ContactUs.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form  runat="server">
        <section class="contact">
            <div class="content">
                <h2>CONNECT WITH US</h2>
                <p>contact our experties,if you have any queries about this theme of local hiring</p>             
            </div>
            <div class="container ">
                <div class="contactInfo">
                    <div class="box">
                        <div class="icon"><a href="https://goo.gl/maps/jkomGcKC1n4fRdxe6"><img src="images/address%20icon.png" height="30" width ="30"/></a></div>
                        <div class="text">
                        <h3>Address</h3>
                        <p>Government First Grade College and Centre for P.G Studies Thenkanidiyur.Udupi,Karnataka,576106<br /><a href="https://gfgc.kar.nic.in/udupi">&#x1F517;Official Website</a><br /><a href="https://goo.gl/maps/jkomGcKC1n4fRdxe6">&#x1F517;Google Map</a></p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon"><img src="images/email%20icon.png" height="30" width ="30" /></div>
                        <div class="text">
                        <h3>E-Mail</h3>
                        <p>mylabours001@gmail.com</p>
                        </div>
                    </div>
                </div>
                <div class="contactForm">
                    <form>
                        <h2>Send Message</h2>
                        <div class="inputBox">
                             <asp:Image ID="Image1" runat="server"  src="images/name%20icon.png"  width="20" height="20" /> &nbsp;<label">Name</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_name" class="form-control" runat="server" placeholder="Enter full Name"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ></asp:RequiredFieldValidator>
                                     </div> 

                        </div>
                        <div class="inputBox">
                            <asp:Image ID="Image2" runat="server" img src="images/email%20icon.png" width="20" height="20" />&nbsp;<label>E-mail ID</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_email1" class="form-control" runat="server" placeholder="E-mail ID"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email1" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>

                                     </div> 
                        </div>
                        <div class="inputBox">
                            <asp:Image ID="Image3" runat="server" src="images/notebook.png" width="20" height="20" /> &nbsp;<label>Message</label> 
            <asp:TextBox ID="txt_msg" class="form-control" runat="server" placeholder="Type your message..." TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_msg" Font-Size="Small" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                        <div class="inputBox ">
                            <asp:Button ID="send" class="btn btn-primary btn-block" runat="server" Text="Send" OnClick="send_Click" />
                            <br />
                            <a href="Homee.html"><img src="images/home.png" width="17" height="17" /> <b>Home</b></a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
