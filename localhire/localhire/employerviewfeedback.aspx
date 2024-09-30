<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="employerviewfeedback.aspx.cs" Inherits="localhire.employerviewfeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="Panel1" runat="server">
    <div class="row">
        <div class="col">
            <br /><br /><br /><br /><br /><br /><br />
            <div class="row">
                <div class="col-5"></div>
                <div class="col-5"><centre><img src="images/hand.png" height="100" width="100"/></centre></div>
                <div class="col-2"></div>
            </div>
           
               <center> <b>you have no FeedBacks...</b><br /><br />
                    <asp:Button ID="Button1" class="btn btn-outline-info btn-lg" runat="server" Text="Back" OnClick="Button1_Click"/> 
                 <br /><br /><br /><br /><br /><br /><br />
   
        </div>
    </div>
      </asp:Panel>
    <div class="row">   
         <div class="col">
             <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" Text=""  BorderStyle="Solid" BorderColor="Black" BorderWidth="3px">
                 <Columns>
                                 <asp:TemplateField HeaderText="Feedbacks" HeaderStyle-BackColor="#FFFF99">
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-12">                                          
                                             <div class="row">
                                                <div class="col-6">
                                                   <span>Name - </span>
                                                   <asp:Label ID="name" runat="server" Font-Bold="True" Text='<%# Eval("name") %>'></asp:Label>
                                                    </div>
                                                  <div class="col-6">
                                                   <span>Response from worker for my friendliness-</span>
                                                      <asp:Label ID="response" runat="server" Font-Bold="True" Text='<%# Eval("response") %>'></asp:Label>                        
                                                </div>
                                              </div>                                          
                                             <div class="row">
                                                 <div class="col">
                                                   <span>Feedback-</span>
                                                      <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("message") %>'></asp:Label>                        
                                                </div>
                                             </div>
                                            
                                          </div>
                                       </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:TemplateField>
                                 </Columns>

                             <EditRowStyle BorderColor="Black" BorderWidth="3px" BorderStyle="Solid"></EditRowStyle>

                             <RowStyle BorderColor="Black" BorderStyle="Solid"></RowStyle>
                        </asp:GridView>
               </div>
    </div>
</asp:Content>
