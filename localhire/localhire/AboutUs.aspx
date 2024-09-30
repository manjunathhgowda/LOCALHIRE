<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="localhire.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
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
        .container
{
    width:100%;
    display:flex;
    justify-content:center ;
    align-items:center ;
    margin-top :30px;

}
.container .contactInfo
{
    width :50%;
    display :flex;
    flex-direction:column;
}
.container .contactInfo .box
{
    position :relative;
    padding:20px 0;
    display:flex;
}
.container .contactInfo .box .icon
{
    min-width:40px;
    height:40px;
    background:#fff;
    display:flex;
    justify-content:center ;
    align-items:center ;
    border-radius :50%;
    font-size:22px;
}
.container .contactInfo .box .text 
{
    display: flex;
    margin-left: 20px;
    font-size: 16px;
    color:#000000;
    flex-direction:column;
    font-weight: 300;
}
.container .contactInfo .box .text h3 
{
    font-size :large;
    font-weight :400;
    color:#ff0000;
}
.footerlinks {
    color: #0026ff;
}

    .footerlinks:hover {
        color: red;
    }

#footer {
    background-color: Teal;
    
}
    </style>
 
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section class="contact">
            <div class="content">
                <div class="container-fluid">
                    <center><asp:Label ID="Label2" runat="server" Text="Local Hire" Font-Bold="True" Font-Size="X-Large" ForeColor="White" ></asp:Label></center><br />
                             <div class="card">
                             <div class="card-body">
                                                  <a href="Homee.html"><asp:Image ID="Image2" runat="server" src="images/arrow.png" Height="35" Width="35"/></a>

                                 <div class="row">        
                                  <div class="col-6"> 
                                    <asp:Label ID="Label1" runat="server" Text="ABOUT US" Font-Bold="True" Font-Size="Larger" Font-Underline="True" ForeColor="#3399FF"></asp:Label>
                                    <b><p> <br />  The Pandemic has been harsh to most of us, and among the people who have seen the worst of it, were the daily wage
workers who not only have to protect themselves from the Virus but are also struggling to save their jobs. Unfortunately, despite
of all the struggles and hard work many of the workers have lost their jobs. We want to provide a solution that could make a small
difference in their lives that could make it easier to find a work. This idea would not be useful to only the workers, but also the
common people like us who need their assist. This local hire system addresses the idea that can be implemented to provide a web platform
for the daily wage workers to find a work. </p></b> <br />
                                
                                    <asp:Button ID="btnmore" class="btn btn-primary" runat="server" Text="Read More" OnClick="btnmore_Click"/>
                                  </div>

                                  <div class="col-6">                 
                                    <div class="card">
                                        <div class="card-body">                           
                                            <asp:Image ID="Image1" runat="server" src="images/labourssss.jpg" height="420" width="418" />
                                        </div>
                                    </div>
                                 </div>
                                </div>
                             </div>
                           </div>
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="card">
                             <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <b>    The Local Hire is an web application that is helpful for common people who works for daily wages as 
                                     well as for the employers who offers the works. In the existing system, all the activities are done manually, so it is expensive and 
                                     time-consuming. In our purposed system,Anyone can hire different types of labour and can have 
                                     a better option to provide works to workers more quickly . The data will be stored in a secure database. The 
                                     Employer and Worker both people can log in to their account through the our platform itself and update information or requirement according to their needs. In our system, 
                                     the employer can create the work and post that work to all the labours present in the system and then worker can make sure that the work posted by the employers are satisfied, if it is not satisfied to worker then he may reject it. The Local Hire system also helps to reduce the time and effort 
                                     in searching for workers efficiently. Also, this system makes a worker to do whatever works he knows throughout the year and enhance their financial status. Local hire refers to the practice of hiring workers on a temporary or casual basis for short-term or daily tasks. It is a common practice when the demand for labor fluctuates or where services are required for a limited period.
                                            The Local hiring system refers to the practice of hiring workers on a daily basis and paying them a wage for the work performed during period of time. 
                                            This system is commonly used in industries where work is of a temporary nature or where there is a need for additional labor on a short-term basis. 
                                            Local hire involves engaging workers on a daily basis, typically for a specific project or task. It allows businesses to meet their labor needs without committing to long-term employment contracts.
                                            Daily wage workers are paid based on the number of hours they work. The wage rate is usually predetermined and agreed upon before the work begins. 
                                            The payment is made at the end of each working day, providing workers with immediate compensation for their labor.


                                        </b><br /><br />
                                        
                                        <asp:Button ID="btnless" class="btn btn-primary" runat="server" Text="Read Less" OnClick="btnless_Click"/><br /><br />
                                    </div>
                                </div>
                                <asp:Panel ID="Panel2" runat="server" BackColor="#CCFFFF" BorderColor="#333300" BorderWidth="1">
                                <div class="row">
                                        <div class="col">
                                            <div class="container ">
                                                <div class="contactInfo">
                                                    <div class="box">
                                                        <div class="icon"><a href="https://goo.gl/maps/jkomGcKC1n4fRdxe6"><img src="images/address%20icon.png" height="30" width ="30"/></a></div>
                                                        <div class="text">
                                                            <h3><b>Address</b></h3>
                                                            <p><b>Government First Grade College and Centre for P.G Studies Thenkanidiyur.Udupi,Karnataka,576106<br />
                                                                <a href="https://gfgc.kar.nic.in/udupi">&#x1F517;Official Website</a><br />
                                                                <a href="https://goo.gl/maps/jkomGcKC1n4fRdxe6">&#x1F517;Google Map</a></b></p>
                                                        </div>
                                                    </div>
                                                    <div class="box">
                                                        <div class="icon"><img src="images/email%20icon.png" height="30" width ="30" /></div>
                                                        <div class="text">
                                                            <h3><b>E-Mail</b></h3>
                                                            <p><b>mylabours001@gmail.com</b></p>
                                                        </div>
                                                    </div>
                                                </div>
                                              </div>
                                            <hr />
                                            <div class="row">
                                            <div class="col-md-12 text-center">
                                            <p>&copy All right Reserved..<a class="footerlinks" href="ContactUs.aspx" target="_blank" >Local Hire</a></p>
                                            </div>
                                            </div>
                                            </div>
                                        </div>
                                </asp:Panel>                    
                             </div>
                         </div>
                    </asp:Panel>
                </div>
            </div>
            </section>
    </form>
</body>
</html>
