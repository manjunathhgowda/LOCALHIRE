<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="employereditprofile.aspx.cs" Inherits="localhire.employereditprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div class="row"> 
        <div class="col"> 
            <center> 
                <asp:Image ID="ProfilePicture" class="rounded-circle" runat="server" ImageUrl="~/images/Admin%20profile%20icon.png" Height="100" Width="100" BorderStyle="Solid" BorderColor="Red" />
            </center> 
         </div> 
     </div> 
     &nbsp;
     <div class="row"> 
                                 <div class="col"> 
                                      <center>
                                          <asp:FileUpload id="ProfilePictureUpload" runat="server"></asp:FileUpload>
                                      </center> 
                                </div> 
                            </div> 

     <div class="row"> 

                                 <div class="col"> 

                                     <hr/> 

                                 </div> 

                            </div> 

     <div class="row"> 
        <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image2" runat="server"  src="images/name%20icon.png"  width="20" height="20" /> &nbsp;<label>Name</label> 
                                     <div class="form-group"> 
                                         <asp:TextBox ID="txt_name" class="form-control" runat="server" placeholder="Enter full Name" ></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="*Only alphabets are allowed"  Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="edit" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                                   
                                     </div>  
                                 </div>

        <div class="col-4"> 
                                     &nbsp; 
                                    <asp:Image ID="Image1" runat="server"  src="images/email%20icon.png"  width="20" height="20" /> &nbsp;<label>E-mail</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_email" class="form-control" runat="server" placeholder="Enter your email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="edit"></asp:RegularExpressionValidator>

                                     </div>  
                                 </div>

        <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image3" runat="server" src="images/mobile%20icon.png" width="20" height="20" /> &nbsp;<label>Mobile Number</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_mobile" class="form-control" runat="server" placeholder="Enter Your Mobile Number" MaxLength="10"></asp:TextBox> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_mobile" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_mobile" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{10}$" Display="Dynamic" ValidationGroup="edit"></asp:RegularExpressionValidator>
                                  
                                         </div>  
                                 </div>
    </div>
    &nbsp;
     <div class="row"> 
        <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image9" runat="server" src="images/address%20icon.png"  width="20" height="20" /> &nbsp;<label>Address</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_address" class="form-control" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_address" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>                                    
                                     </div>  
                                 </div> 
  
        <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image4" runat="server"  src="images/password%20icon.png"  width="20" height="20" /> &nbsp;<label>New Password</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_pass" class="form-control" runat="server" placeholder="New Password" TextMode="Password" MaxLength="8"></asp:TextBox> 
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="*Invalid password format.Password must contains 8 charecters including alphabets[a-zA-Z],digits[0-9], and special charecters [@#$^&]"  Display="Dynamic" ControlToValidate="txt_pass" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="edit" SetFocusOnError="True" ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$^&]).{8}$"></asp:RegularExpressionValidator>                                  
                                     </div>  
                                 </div>

        <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image5" runat="server"  src="images/password%20icon.png"  width="20" height="20" /> &nbsp;<label>Confirm Password</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_cpass" class="form-control" runat="server" placeholder="Confirm New Password" TextMode="Password" MaxLength="8"></asp:TextBox> 
                                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*not match" Font-Bold="True" Font-Size="Small" ControlToCompare="txt_pass" ControlToValidate="txt_cpass" ForeColor="Red" Display="Dynamic" ValidationGroup="edit"></asp:CompareValidator>                                   
                                     </div>  
                                 </div> 
    </div> 

     <div class="row"> 

                                 <div class="col"> 

                                     <hr> 
                                            
                                 </div> 

                            </div>
    <div class="row"> 

                                 <div class="col"> 

                                      <asp:Button ID="btnupdate" class="btn btn-success btn-block" runat="server" Text="Update" OnClick="btnupdate_Click" ValidationGroup="edit"/>
                                            
                                 </div> 

                            </div>

</asp:Content>
