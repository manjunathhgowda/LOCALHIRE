<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="viewacceptedworker.aspx.cs" Inherits="localhire.viewacceptedworker" %>
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
           
                <center><b>Worker not accepted yet....</b><br /><br />
                    <asp:Button ID="Button1" class="btn btn-outline-info btn-lg" runat="server" Text="Back" OnClick="Button1_Click"/>
                 <br /><br /><br /><br /><br /><br /><br /> 
        </div>
    </div>
      </asp:Panel>
     <div class="row">
     <div class="col">
         <a href="mybookings.aspx"><asp:Image ID="Image2" runat="server" src="images/arrow.png" Height="35" Width="35"/></a>
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="worker_id" AutoGenerateColumns="False" Text="" BackColor="#CCFFFF" BorderStyle="Solid" BorderColor="Black" BorderWidth="3px" >
                             <Columns>
                                 <asp:TemplateField HeaderText="Worker Details" HeaderStyle-BackColor="#FFFF99">
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">                                                                         
                                            <div class="row">
                                                  <div class="col-4">
                                                   Worker ID-
                                                   <asp:Label ID="workerid" runat="server" Font-Bold="True" Text='<%# Eval("worker_id") %>'></asp:Label>
                                                      </div>
                                                  <div class="col-4">
                                                   Name -
                                                   <asp:Label ID="workername" runat="server" Font-Bold="True" Text='<%# Eval("worker_name") %>'></asp:Label>
                                                      </div>
                                                  <div class="col-4">
                                                   Contact -
                                                   <asp:Label ID="workercontact" runat="server" Font-Bold="True" Text='<%# Eval("worker_mobile") %>'></asp:Label>
                                                </div>
                                                 </div>
                                              <br />
                                            <div class="row">
                                                 <div class="col-4">
                                                   Gender -
                                                   <asp:Label ID="workergender" runat="server" Font-Bold="True" Text='<%# Eval("worker_gender") %>'></asp:Label>
                                                </div>
                                                <div class="col-4">
                                                   Payment Status -
                                                   <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("status") %>'></asp:Label>
                                                </div>
                                                <div class="col-4">
                                                    <asp:Button ID="btnpay" class="btn btn-success btn-block" runat="server" Text="Payment" OnClick="btnpay_Click" />
                                                </div> 
                                             </div>                                         
                                             </div>                                                      
                                           
                                            <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("worker_profile") %>' />
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
