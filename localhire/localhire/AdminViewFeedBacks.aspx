<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINDASHBOARD.Master" AutoEventWireup="true" CodeBehind="AdminViewFeedBacks.aspx.cs" Inherits="localhire.AdminViewFeedBacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [TeamFeedback]"></asp:SqlDataSource>
         <div class="col">
             <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Text=""  BorderStyle="Solid" BorderColor="Black" BorderWidth="3px">
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
                                                   <span>Email - </span>
                                                   <asp:Label ID="email" runat="server" Font-Bold="True" Text='<%# Eval("email") %>'></asp:Label>
                                                     </div>
                                                 </div>
                                              <br />
                                              <div class="row">
                                                  <div class="col-6">
                                                   <span>Response from user for our Service-</span>
                                                      <asp:Label ID="response" runat="server" Font-Bold="True" Text='<%# Eval("response") %>'></asp:Label>                        
                                                </div>
                                                 
                                            
                                                 
                                                 <div class="col-6">
                                                   <span>Rating-</span><asp:Label ID="rating" runat="server" Font-Bold="True" Text='<%# Eval("rating") %>'></asp:Label>                        
                                                </div>
                                                  </div>
                                              <br />
                                                   <div class="row">
                                                 <div class="col">
                                                   <span>Feedback-</span>
                                                      <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("feedback") %>'></asp:Label>                        
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
