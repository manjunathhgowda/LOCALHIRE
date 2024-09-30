<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="localhire.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
  <!-- Nav tabs -->
<div class="row">
    <div class="col-3"><b></b></div>
    <div class="col-6">
        <ul class="nav nav-tabs">      
      <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#worker"><img src="images/user%20profile%20icon.png" height="25" width="25"/> Worker Login</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#employer"><img src="images/Admin%20profile%20icon.png" height="25" width="25"/> Employer Login</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#admin"><img src="images/adminn%20icon.png" height="25" width="25"/> Admin Login</a>
    </li>
  </ul>
    </div>
    <div class="col-3"><b></b></div>
</div>
  
  <!-- Tab panes -->
  <div class="tab-content">
    <div id="worker" class="container tab-pane active"><br/>
     <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                                 <div class="col">
                                      <center>
                                          <img id="image1" height="75" src="images/user%20profile%20icon.png"  />
                                      </center>
                                 </div>
                         </div>

                            <div class="row">
                                 <div class="col">
                                      <center>
                                          <h5>Worker Login</h5>
                                      </center>
                                 </div>
                            </div>

                         <div class="row">
                                 <div class="col">
                                     <hr/>
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image2" runat="server" img src="images/email%20icon.png" width="20" height="20" />
&nbsp;<label>E-mail ID</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_email1" class="form-control" runat="server" placeholder="E-mail ID"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="worker" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email1" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="worker" SetFocusOnError="True"></asp:RegularExpressionValidator>

                                     </div> 
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image3" runat="server" img src="images/password%20icon.png" width="20" height="20"/>
                                     &nbsp;<label>Password</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_pass1" class="form-control" runat="server" 
                                             placeholder="Password" TextMode="Password" MaxLength="8"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_pass1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="worker" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*Invalid password format.Password must contains 8 characters including alphabets[a-zA-Z],digits[0-9], and special characters [@#$^&]"  Display="Dynamic" ControlToValidate="txt_pass1" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="worker" SetFocusOnError="True" ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$^&]).{8}$"></asp:RegularExpressionValidator>

                                     </div> 
                                 </div>
                         </div>

                          <div class="row">
                                 <div class="col">
                                     <asp:Button ID="workerlogin" class="btn btn-success btn-block" runat="server" 
                                         Text="Login" OnClick="workerlogin_Click" ValidationGroup="worker" />
                          
                                     </div> 
                                 </div>

                                 <div class="row">
                                 <div class="col">
                                     <asp:Label ID="msglbl1" runat="server" Text="Label" Font-Size="Small" Font-Bold="True"></asp:Label>
                          
                                     </div> 
                                 </div>
    

                         <div class="row">
                                 <div class="col">
                                 &nbsp&nbsp&nbsp&nbsp&nbsp<a href="Registration.aspx" <asp:LinkButton ID="LinkButton1"  runat="server" ForeColor="#3366FF">New User</asp:LinkButton>

                                    <a href="workerforgot.aspx" <asp:LinkButton ID="LinkButton2" style="float:right" runat="server" ForeColor="#FF3300">forgot password?</asp:LinkButton> </a>
                                
                                  </div> 
                         </div>
                                           
                    </div>
                </div>
            </div>
        </div>
    </div>    
    </div>

    <div id="employer" class="container tab-pane fade"><br/>
      <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                                 <div class="col">
                                      <center>
                                          <img id="Image4" height="75" src="images/Admin%20profile%20icon.png"  />
                                      </center>
                                 </div>
                         </div>

                            <div class="row">
                                 <div class="col">
                                      <center>
                                          <h5>Employer Login</h5>
                                      </center>
                                 </div>
                            </div>

                         <div class="row">
                                 <div class="col">
                                     <hr/>
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image5" runat="server" img src="images/email%20icon.png" width="20" height="20" />
&nbsp;<label>E-mail ID</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_email2" class="form-control" runat="server" placeholder="E-mail ID"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email2" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="employee" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_email2" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="employee" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                    
                                         </div> 
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image6" runat="server" img src="images/password%20icon.png" width="20" height="20"/>
                                     &nbsp;<label>Password</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_pass2" class="form-control" runat="server" 
                                             placeholder="Password" TextMode="Password" MaxLength="8"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_pass2" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="employee" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*Invalid password format.Password must contains 8 charecters including alphabets[a-zA-Z],digits[0-9], and special charecters [@#$^&]"  Display="Dynamic" ControlToValidate="txt_pass2" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="employee" SetFocusOnError="True" ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$^&]).{8}$"></asp:RegularExpressionValidator>

                                     </div> 
                                 </div>
                         </div>

                          <div class="row">
                                 <div class="col">
                                     <asp:Button ID="employerlogin" class="btn btn-success btn-block" runat="server" 
                                         Text="Login" OnClick="employerlogin_Click" ValidationGroup="employee" />
                          
                                     </div> 
                                 </div>

                                 <div class="row">
                                 <div class="col">
                                     <asp:Label ID="msglbl2" runat="server" Text="Label" Font-Size="Small" Font-Bold="True"></asp:Label>
                          
                                     </div> 
                                 </div>
    

                         <div class="row">
                                 <div class="col">
                                 &nbsp&nbsp&nbsp&nbsp&nbsp<a href="Registration.aspx" <asp:LinkButton ID="LinkButton3"  runat="server" ForeColor="#3366FF">New User</asp:LinkButton>

                                    <a href="employerforgot.aspx" <asp:LinkButton ID="LinkButton4" style="float:right" runat="server" ForeColor="#FF3300">forgot password?</asp:LinkButton> </a>
                                
                                  </div> 
                         </div>
                                           
                    </div>
                </div>
            </div>
        </div>
    </div>    
    </div>
     
    <div id="admin" class="container tab-pane fade"><br/>
      <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                                 <div class="col">
                                      <center>
                                          <img id="Image7" height="75" src="images/adminn%20icon.png" />
                                      </center>
                                 </div>
                         </div>

                            <div class="row">
                                 <div class="col">
                                      <center>
                                          <h5>Admin Login</h5>
                                      </center>
                                 </div>
                            </div>

                         <div class="row">
                                 <div class="col">
                                     <hr/>
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image8" runat="server" img src="images/email%20icon.png" width="20" height="20" />
&nbsp;<label>E-mail ID</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_email3" class="form-control" runat="server" placeholder="E-mail ID"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_email3" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="admin" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_email3" ErrorMessage="*not in valid format" Font-Size="Small" Font-Bold="True" ForeColor="Red"  Display="Dynamic"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="admin" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                   
                                     </div> 
                                 </div>
                         </div>

                         <div class="row">
                                 <div class="col">
                                     &nbsp;
                                     <asp:Image ID="Image9" runat="server" img src="images/password%20icon.png" width="20" height="20"/>
                                     &nbsp;<label>Password</label>
                                     <div class="form-group">
                                     <asp:TextBox ID="txt_pass3" class="form-control" runat="server" 
                                             placeholder="Password" TextMode="Password" MaxLength="8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_pass3" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="admin" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="*Invalid password format.Password must contains 8 charecters including alphabets[a-zA-Z],digits[0-9], and special charecters [@#$^&]"  Display="Dynamic" ControlToValidate="txt_pass3" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="admin" SetFocusOnError="True" ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$^&]).{8}$"></asp:RegularExpressionValidator>


                                     </div> 
                                 </div>
                         </div>

                          <div class="row">
                                 <div class="col">
                                     <asp:Button ID="adminlogin" class="btn btn-success btn-block" runat="server" 
                                         Text="Login" OnClick="adminlogin_Click" ValidationGroup="admin"/>
                          
                                     </div> 
                                 </div>

                                 <div class="row">
                                 <div class="col">
                                     <asp:Label ID="msglbl3" runat="server" Text="Label" Font-Size="Small" Font-Bold="True"></asp:Label>
                          
                                     </div> 
                                 </div>
    

                         <div class="row">
                                 <div class="col">
                                 &nbsp&nbsp&nbsp&nbsp&nbsp<a href="Homee.html" <asp:LinkButton ID="LinkButton5"  runat="server" ForeColor="#3366FF">Back</asp:LinkButton>

                                    <a href="adminforgot.aspx" <asp:LinkButton ID="LinkButton6" style="float:right" runat="server" ForeColor="#FF3300">forgot password?</asp:LinkButton> </a>
                                
                                  </div> 
                         </div>
                                           
                    </div>
                </div>
            </div>
        </div>
    </div> 
     
    </div>
  </div>
  </div>
  <br />
</asp:Content>
