<%@ Page Title="" Language="C#" MasterPageFile="~/WORKERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="workerbankacc.aspx.cs" Inherits="localhire.workerbankacc" %>
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
    width :70%;
    padding:40px;
    background :#fff;
}
    </style>

    
         <section class="contact">
              <div class="contactForm">
<img src="images/cashless-payment.png" width="30" height="30" /> &nbsp;<b><i>LabourPay</i></b><br /><br /><br />
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
                                          <asp:Label ID="Label3" runat="server" Text="----MY BANK----" Font-Bold="True" ></asp:Label>                                         
                                     </center>
                                     </div>
                         </div> 
                   <hr />
                     <div class="row">
                            <div class="col">
                                     <asp:Label ID="Label1" runat="server" Text="Account Holder:" Font-Bold="true"></asp:Label>&nbsp;<asp:Label ID="acc_name" runat="server" Text=" "  Font-Bold="true"></asp:Label><br />
                                     <asp:Label ID="Label2" runat="server" Text="Account Number:" Font-Bold="true"></asp:Label>&nbsp;<asp:Label ID="acc_no" runat="server" Text=" "  Font-Bold="true"></asp:Label>
                                     </div>
                         </div>
                   <hr />
                     <div class ="row">
                         <div class="col">
                             <br />
                            <asp:Image ID="Image5" runat="server" src="images/wallet.png" width="20" height="20" /> &nbsp;<label>Balance</label> 
                            <div class="row">                       
                            <div class="col-12">
                                <asp:TextBox ID="txt_balance" class="form-control" runat="server" Font-Bold="true" Font-Size="X-Large" ReadOnly></asp:TextBox>             
                            </div>
                            </div>
                        </div>
                         </div>
                  <br />
                  <div class ="row">
                         <div class="col-2"></div>
                      <div class="col-2"></div>
                      <div class="col-1"></div>
                       <div class="col-2"><asp:Image ID="Image1" runat="server" src="images/shield.png" width="30" height="30" /></div>
                      <div class="col-1"></div>
                      <div class="col-2"></div>
                      <div class="col-2"></div>
                      </div>
               </div>
         </section>
</asp:Content>
