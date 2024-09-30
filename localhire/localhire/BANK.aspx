<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BANK.aspx.cs" Inherits="localhire.BANK" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <title>BANK</title>
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
    width :40%;
    padding:40px;
    background :#fff;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
