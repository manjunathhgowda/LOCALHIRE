<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINDASHBOARD.Master" AutoEventWireup="true" CodeBehind="adminearnings.aspx.cs" Inherits="localhire.adminearnings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        
         <div class="col">
             <div class="row">
                 <div class="col-9">
                      <img src="images/cashless-payment.png" width="20" height="20" /> &nbsp;<b><i>LabourPay</i></b>
                 </div>
                 <div class="col-3">
                     <img src="images/bin.png" width="20" height="20" /><asp:Button ID="btnclear" runat="server" class="btn" Font-Bold="true" text="Clear History" OnClick="btnclear_Click" OnClientClick="return confirm('Are you sure want to clear history?');"/>
                 </div>
             </div>
             <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False"  Text=""  BorderStyle="Solid" BorderColor="Black" BorderWidth="3px">
                 <Columns>
                                 <asp:TemplateField HeaderText="My Earnings" HeaderStyle-BackColor="#66ffff" >
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-12">
                                              You have earned <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("amount") %>'></asp:Label>&#8377; from <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("name") %>'></asp:Label> whose ID is  <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Id") %>'></asp:Label> on <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("date", "{0:dd/MM/yyyy}") %>'></asp:Label>                                             
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
