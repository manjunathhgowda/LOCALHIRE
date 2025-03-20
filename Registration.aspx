<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="localhire.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container"> 
        <div class="row"> 
            <div class="col-4 mx-auto"> 
                <div class="card"> 
                    <div class="card-body">
                        <div class="row"> 

                                 <div class="col"> 

                                      <center> 

                                          <img id="profile" height="120" src="images/labours.jpg" /> 
                                          <br/><br/>
                                      </center> 

                                 </div> 

                         </div>

                        <div class="row"> 

                                 <div class="col"> 

                                      <center> 

                                          <img id="profile" height="130" src="images/Registration%20icon.png" /> 

                                      </center> 

                                 </div> 

                         </div> 

                        <div class="row"> 
                                 <div class="col"> 
                                      <center> 
                                           <br />
                                          <h3><u>REGISTRATION</u></h3>                                          
                                          <br />
                                          <br />                      
                                           
                                     </center> 
                                 </div> 
                            </div>                         
                        </div>
                    </div>
                </div>

            <div class="col-8 mx-auto"> 
                <div class="card"> 
                    <div class="card-body">     
                                                 
                        <div class="row"> 
                                 <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image6" runat="server" src="images/type%20icon.png" width="20" height="20" /> &nbsp;<label>User Type</label> 
                                     <div class="form-group"> 
                                        <%--<asp:TextBox ID="txt_id" class="form-control" runat="server" placeholder="User ID"></asp:TextBox> --%>
                                         <asp:DropDownList ID="usertype_list" class="form-control" runat="server">
                                <asp:ListItem Text="--select type--"></asp:ListItem>
                                 <asp:ListItem>Worker</asp:ListItem>
                                 <asp:ListItem>Employer</asp:ListItem>
                             </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="usertype_list" Font-Size="Small" Font-Bold="True" ForeColor="Red" InitialValue="--select type--" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                  
                                     </div>  
                                 </div> 
                                 <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image2" runat="server"  src="images/name%20icon.png"  width="20" height="20" /> &nbsp;<label">Name</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_name" class="form-control" runat="server" placeholder="Enter full Name"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="*Only alphabets are allowed"  Display="Dynamic" ControlToValidate="txt_name" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>

                                     </div>  
                                 </div> 
                         
                                 <div class="col-4"> 
                                     &nbsp; 
                                    <asp:Image ID="Image1" runat="server"  src="images/email%20icon.png"  width="20" height="20" /> &nbsp;<label>E-mail</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_email" class="form-control" runat="server" placeholder="Enter Your E-mail"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic" SetFocusOnError="True"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg"></asp:RegularExpressionValidator>
                                         
                                     </div>  
                                 </div>
                             </div>

                        <div class="row"> 
                                 <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image3" runat="server" src="images/mobile%20icon.png" width="20" height="20" /> &nbsp;<label>Mobile Number</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_mobile" class="form-control" runat="server" 
                                             placeholder="Enter Your Mobile Number" MaxLength="10"></asp:TextBox> 
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_mobile" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_mobile" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{10}$" SetFocusOnError="True" Display="Dynamic" ValidationGroup="reg"></asp:RegularExpressionValidator>

                                     </div>  
                                 </div> 
                         

                        
                                 <div class="col-4"> 
                                     &nbsp; 
                                     <asp:Image ID="Image7" runat="server" src="images/dob%20icon.png" width="20" height="20" /> &nbsp;<label>Date of Birth </label> 
                                     <div class="form-group"> 
                                           <asp:TextBox ID="txt_dob" class="form-control" runat="server"  placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                         
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  Display="Dynamic" ErrorMessage="*required" ControlToValidate="txt_dob" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must between 18 to 60" ControlToValidate="txt_dob" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" MaximumValue="2005" MinimumValue="1945"></asp:RangeValidator>

                                     </div>  
                                 </div> 
                                 <div class="col-4"> 
                          &nbsp; 
                                     <asp:Image ID="Image8" runat="server"  src="images/gender%20icon.png"  width="20" height="20" /> &nbsp;<label>Gender</label>
                             <div class="form-group"> 
                             <asp:DropDownList ID="gender_list" class="form-control" runat="server">
                                 <asp:ListItem Text="--select type--"></asp:ListItem>
                                 <asp:ListItem>Male</asp:ListItem>
                                 <asp:ListItem>Female</asp:ListItem>
                             </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="gender_list" Font-Size="Small" Font-Bold="True" ForeColor="Red" InitialValue="--select type--" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>

                        </div>
                         </div>
                         </div>
                           
                        <div class="row"> 
                                 <div class="col"> 
                                     &nbsp; 
                                     <asp:Image ID="Image9" runat="server" src="images/address%20icon.png"  width="20" height="20" /> &nbsp;<label>Address</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_address" class="form-control" runat="server"  
                                             placeholder="Address" TextMode="MultiLine"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_address" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                     </div>  
                                 </div> 
                         </div>                                    

                        <div class="row"> 
                                 <div class="col-6"> 
                                     &nbsp; 
                                     <asp:Image ID="Image4" runat="server"  src="images/password%20icon.png"  width="20" height="20" /> &nbsp;<label>Create Password</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_pass" class="form-control" runat="server" MaxLength="8" 
                                             placeholder="Create Your Password" TextMode="Password"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_pass" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="*Invalid password format.Password must contains 8 charecters including alphabets[a-zA-Z],digits[0-9], and special charecters [@#$^&]"  Display="Dynamic" ControlToValidate="txt_pass" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$^&]).{8}$"></asp:RegularExpressionValidator>

                                     </div>  
                                 </div>
                                  <div class="col-6"> 
                                     &nbsp; 
                                     <asp:Image ID="Image5" runat="server"  src="images/password%20icon.png"  width="20" height="20" /> &nbsp;<label>Confirm Password</label> 
                                     <div class="form-group"> 
                                        <asp:TextBox ID="txt_cpass" class="form-control" runat="server"  
                                             placeholder="Confirm Your Password" MaxLength="8" TextMode="Password"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_cpass" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*not match" Font-Bold="True" Font-Size="Small" ControlToCompare="txt_pass" ControlToValidate="txt_cpass" ForeColor="Red" Display="Dynamic" ValidationGroup="reg" SetFocusOnError="True"></asp:CompareValidator>
                                     </div>  
                                 </div> 
                         </div> 
                    </div>
                </div>
                 <br />
            </div>
        </div>
         <br />
          <div class="row"> 
            <div class="col-12 mx-auto"> 
                <div class="card"> 
                    <div class="card-body">
                              <b>Banking Credentials</b>
                        <hr />
                            <div class="row">                         
                           
                            <div class="col-4">
                                <asp:Image ID="Image12" runat="server" src="images/card.png" width="20" height="20" /> &nbsp;<label>Credit card number</label><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txtcard" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txtcard" class="form-control" runat="server" placeholder="XXXX XXXX XXXX XXXX" MaxLength="16"></asp:TextBox>  
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txtcard" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*need 16 digit card number"  Display="Dynamic" ControlToValidate="txtcard" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^[0-9]{16}$"></asp:RegularExpressionValidator>


                             </div>
                           
                            <div class="col-4">
                                <asp:Image ID="Image13" runat="server" src="images/expiry.png" width="20" height="20" /> &nbsp;<label>Expire Date</label><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txtdate" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator>  
                                <asp:TextBox ID="txtdate" class="form-control" runat="server" placeholder="MM/YYYY"></asp:TextBox> 
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*card is expired or invalid date (format: MM/YY)"  Display="Dynamic" ControlToValidate="txtdate" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^((0[0-9])|(1[0-2]))[/]*((2[3-9])|([3-9][0-9]))$"></asp:RegularExpressionValidator>

                            </div>
                            <div class="col-4">
                                 <asp:Image ID="Image14" runat="server" src="images/cvv.png" width="20" height="20" /> &nbsp;<label>CVV</label><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txtcvv" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                                  <asp:TextBox ID="txtcvv" class="form-control" runat="server" placeholder="***" MaxLength="3" TextMode="Password"></asp:TextBox> 
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*need 3 digit cvv"  Display="Dynamic" ControlToValidate="txtcvv" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txtcvv" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="reg" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                            </div>
                            </div>                               
                             <hr /> 
                         <div class="row"> 
                             <div class="col-2"></div>
                              <div class="col-4">                                                           

                                   <asp:Button ID="btnback" class="btn btn-info btn-block" runat="server"  

                                        Text="Back" OnClick="btnback_Click"  /> 

                              </div> 

                              <div class="col-4">                                                           

                                    <asp:Button ID="btnsave" class="btn btn-success btn-block" runat="server" 
                                        Text="Save" OnClick="btnsave_Click" ValidationGroup="reg" /> 

                              </div>  
                              <div class="col-2"></div>

                         </div>
                         </div>
                            </div>
                <br />
                        </div>
                    </div>
                </div>
                        
</asp:Content>
