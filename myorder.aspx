<%@ Page Title="" Language="C#" MasterPageFile="~/WORKERDASHBOARD.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="myorder.aspx.cs" Inherits="localhire.myorder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
<%--                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$  ConnectionStrings:ConnectionString  %>" SelectCommand="SELECT [employer_id], [employer_name], [employer_mobile], [work_id], [category], [start_date], [start_time], [address], [amount], [description] FROM [create_work]"></asp:SqlDataSource>--%>
                     <div class="col">
                                   <b><asp:Label ID="order" runat="server"></asp:Label><asp:Label ID="Label1" runat="server" Text=" orders are present in your order list"></asp:Label></b> 
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="work_id" Text="" BackColor="#CCFFFF" BorderStyle="Solid" BorderColor="Black" BorderWidth="3px" >
                             <Columns>
                                 <asp:TemplateField HeaderText="Your Order" HeaderStyle-BackColor="#FFFF99">
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-12">                                          
                                             <div class="row">
                                                <div class="col-4">
                                                   <span>Employer ID - </span>
                                                   <asp:Label ID="empid" runat="server" Font-Bold="True" Text='<%# Eval("employer_id") %>'></asp:Label>
                                                    </div>
                                                 <div class="col-4">
                                                   <span>Employer Name - </span>
                                                   <asp:Label ID="empname" runat="server" Font-Bold="True" Text='<%# Eval("employer_name") %>'></asp:Label>
                                                     </div>
                                                  <div class="col-4">
                                                   <span>Employer Mobile -</span>
                                                      <asp:Label ID="empcontact" runat="server" Font-Bold="True" Text='<%# Eval("employer_mobile") %>'></asp:Label>                        
                                                </div>
                                             </div>
                                             <hr />                                           
                                             <div class="row">
                                                <div class="col-3">
                                                   Work ID -
                                                   <asp:Label ID="workid" runat="server" Font-Bold="True" Text='<%# Eval("work_id") %>'></asp:Label>
                                                    </div>
                                                  <div class="col-3">
                                                   Work -
                                                   <asp:Label ID="work" runat="server" Font-Bold="True" Text='<%# Eval("work_type") %>'></asp:Label>
                                                      </div>
                                                  <div class="col-3">
                                                   Date -
                                                   <asp:Label ID="date" runat="server" Font-Bold="True" Text='<%# Eval("start_date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                      </div>
                                                  <div class="col-3">
                                                   Time -
                                                   <asp:Label ID="time" runat="server" Font-Bold="True" Text='<%# Eval("start_time","{0:hh.mm tt}") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <br />
                                             <div class="row">
                                                <div class="col-3">
                                                   Address -
                                                   <asp:Label ID="address" runat="server" Font-Bold="True" Text='<%# Eval("address") %>'></asp:Label>
                                                    </div>
                                                  <div class="col-3">
                                                   Description -
                                                   <asp:Label ID="description" runat="server" Font-Bold="True" Text='<%# Eval("description") %>'></asp:Label>
                                                </div>

                                                 <div class="col-3">
                                                   Salary(/hr) &#x20B9; -
                                                   <asp:Label ID="salary" runat="server" Font-Bold="True" Text='<%# Eval("amount") %>'></asp:Label>
                                                    </div>
                                                 <div class="col-3">
                                                   Status -
                                                   <asp:Label ID="status" runat="server" Font-Bold="True" Text='<%# Eval("status") %>'></asp:Label>
                                                    </div>
                                                 </div>    
                                            
                                             <hr />
                                             <div class="row">                             
                                                    <div class="col-4">
                                                        <asp:Button ID="btn_reject" runat="server" class="btn btn-danger btn-block" Text="Reject" OnClientClick="return confirm('Are you sure you want to reject?')" OnClick="btn_reject_Click" CommandArgument='<%# Eval("work_id") %>' />
                                                      </div>
                                                   
                                                    <div class="col-4">                                                 
                                                        <asp:Button ID="btn_accept" runat="server" class="btn btn-success btn-block" Text="Accept" OnClientClick="return confirm('Are you sure you want to accept?')" OnClick="btn_accept_Click" />
                                                    </div>
                                                 <div class="col-4">                                                 
                                                        <asp:Button ID="btnfeeback" runat="server" class="btn btn-warning btn-block" Text="Feedback" OnClick="btnfeeback_Click" />
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
