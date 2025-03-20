<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="employerwallet.aspx.cs" Inherits="localhire.employerwallet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
        *
{
    margin:0;
    padding:0;
    box-sizing :border-box;
    font-family:'Poppins',sans-serif ;
}
.contact {
    position: relative;
    min-height: 100vh;
    padding: 50px 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background-image: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)),url(images/bank.jpg);
    );
    background-size: cover;
    /*background: url(images/contactimage.jpg);*/
    background-size: cover;
}
.contactForm
{
    width :95%;
    padding:40px;
    background :#fff;
}
    </style>

    
         <section class="contact">
              <div class="contactForm">
    <div class="container-fluid"> 
        <div class="row"> 
            <div class="col-12 mx-auto"> 
                <div class="card"> 
                    <div class="card-body">
                        <img src="images/cashless-payment.png" width="30" height="30" /> &nbsp;<b><i>LabourPay</i></b>
                     <div class="row"> 
                                 <div class="col"> 
                                      <center> 
                                          <img id="profile" height="100" src="images/bank.png" /> 
                                      </center> 
                                 </div> 
                         </div> 
                     <div class="row"> 
                                 <div class="col"> 
                                      <center>                                 
                                          <asp:Label ID="Label3" runat="server" Text="----MY WALLET----" Font-Bold="True" ></asp:Label>                                         
                                     </center>
                                     </div>
                         </div>
                         <hr />               
                     <div class ="row">
                         <div class="col">
                             
                            <asp:Image ID="Image5" runat="server" src="images/wallet.png" width="20" height="20" /> &nbsp;<label>Your Balance</label> 
                            <div class="row">
                            <div class="col-2">
                                <asp:TextBox ID="TextBox1"  class="form-control" runat="server" value="&#8377;" Font-Bold="true" Font-Size="X-Large" ReadOnly></asp:TextBox>
                            </div>
                            <div class="col-10">
                                <asp:TextBox ID="txt_balance" class="form-control" runat="server" Font-Bold="true" Font-Size="X-Large" ReadOnly></asp:TextBox>             
                            </div>
                            </div>
                        </div>
                         </div>
                        <br />
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="btnwithdraw" Class="btn btn-outline-primary form-control" runat="server" Text="Widthdraw" Font-Bold="True" Onclick="btnwithdraw_Click" />
                                </div>
                            <div class="col-6">
                                <asp:Button ID="btnaddcash" Class="btn btn-outline-warning form-control" runat="server" Text="Add Cash" Font-Bold="True" OnClick="btnaddcash_Click" />
                            </div>
                        </div>
                        <hr />
                        <asp:Panel ID="Panel1" runat="server">                         
                                    <div class ="row">
                         <div class="col">           
                            
                            <div class="row">                         
                            <div class="col-6">
                                <asp:Image ID="Image2" runat="server" src="images/wallet.png" width="20" height="20" /> &nbsp;<label>Amount</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txt_amt" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_amt" class="form-control" runat="server" placeholder="&#8377;"></asp:TextBox> 
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txt_amt" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                                
                            </div>
                            <div class="col-6">
                                <asp:Image ID="Image3" runat="server" src="images/card.png" width="20" height="20" /> &nbsp;<label>Credit card number</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txtcard" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txtcard" class="form-control" runat="server" placeholder="XXXX XXXX XXXX XXXX" MaxLength="16"></asp:TextBox>  
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txtcard" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*need 16 digit card number"  Display="Dynamic" ControlToValidate="txtcard" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True" ValidationExpression="^[0-9]{16}$"></asp:RegularExpressionValidator>


                             </div>
                            </div>
                         <br />
                            <div class="row">
                            <div class="col-6">
                                <asp:Image ID="Image7" runat="server" src="images/expiry.png" width="20" height="20" /> &nbsp;<label>Expire Date</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txtdate" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True"></asp:RequiredFieldValidator>  
                                <asp:TextBox ID="txtdate" class="form-control" runat="server" placeholder="MM/YYYY"></asp:TextBox> 
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*invalid date (format: MM/YY)"  Display="Dynamic" ControlToValidate="txtdate" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True" ValidationExpression="^((0[0-9])|(1[0-2]))[/]*((2[3-9])|([3-9][0-9]))$"></asp:RegularExpressionValidator>

                            </div>
                            <div class="col-6">
                                 <asp:Image ID="Image6" runat="server" src="images/cvv.png" width="20" height="20" /> &nbsp;<label>CVV</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" *" Display="Dynamic" ControlToValidate="txtcvv" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                                  <asp:TextBox ID="txtcvv" class="form-control" runat="server" placeholder="***" MaxLength="3" TextMode="Password"></asp:TextBox> 
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*need 3 digit cvv"  Display="Dynamic" ControlToValidate="txtcvv" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True" ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txtcvv" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="w" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                            </div>
                            </div>                               
                             <hr />                          
                             <asp:Button ID="btnwithdrawamt" Class="btn btn-primary form-control" runat="server" Text="Withdraw Now" Font-Bold="True" OnClientClick="return confirm('Are you sure want to withdraw amount from your wallet?');"  ValidationGroup="w" OnClick="btnwithdrawamt_Click" />
                             <asp:Button ID="btnaddamt" Class="btn btn-warning form-control" runat="server" Text="Add Now" Font-Bold="True" OnClientClick="return confirm('Are you sure want to deposite amount to your wallet?');" ValidationGroup="w" OnClick="btnaddamt_Click" />
                        </div>
                         </div>
                        </asp:Panel>
                    </div>
                 </div>
              </div>
          </div>
     </div>
                  </div>
             </section>
</asp:Content>
