<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINDASHBOARD.Master" AutoEventWireup="true" CodeBehind="ViewEmployer.aspx.cs" Inherits="localhire.ViewEmployer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [name], [email], [mobile], [dob], [gender], [address], [ProfilePicture] FROM [employer]"></asp:SqlDataSource>
                     <div class="col">
                         <b><asp:Label ID="emp" runat="server"></asp:Label><asp:Label ID="Label1" runat="server" Text=" employers are present in this system"></asp:Label></b> 
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="Id" DataSourceID="SqlDataSource1" BorderStyle="Solid" BorderColor="Black" BorderWidth="3px">
                           <Columns>
                              <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" >
                                 <ControlStyle Font-Bold="True" />
                                 <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                              <asp:TemplateField HeaderText="Employer Details">
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             
                                             <div class="row">
                                                <div class="col-6">                                           
                                                   <span>Employer Name - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("name") %>'></asp:Label>
                                                    </div>
                                                 <div class="col-6"> 
                                                   <span>Email-</span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("email") %>'></asp:Label>
                                                   </div>
                                                 </div>
                                              <br />
                                             <div class="row">
                                                  <div class="col-6">
                                                   <span>Contact Number -</span>
                                                      <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("mobile") %>'></asp:Label>
                                                </div>
                                                   <div class="col-6">
                                                    <span >Date of Birth -</span> 
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("dob", "{0:dd/MM/yyyy}") %>'></asp:Label>                                                
                                                   </div>
                                             </div>
                                              <br />
                                             <div class="row">
                                                <div class="col-6">
                                                    Gender -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("gender") %>'></asp:Label>
                                                    </div>
                                                  <div class="col-6">
                                                   Address -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("address") %>'></asp:Label>
                                                  </div>
                                             </div>
                                            
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("ProfilePicture") %>' />
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
