<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="mybookings.aspx.cs" Inherits="localhire.mybookings" EnableEventValidation="false" %>
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
           
                <center><b>Work not created yet....Post your job now</b><br /><br />
                    <asp:Button ID="Button1" class="btn btn-outline-info btn-lg" runat="server" Text="Click Here" OnClick="Button1_Click" /> 
                 <br /><br /><br /><br /><br /><br /><br />
   
        </div>
    </div>
      </asp:Panel>
    
 <div class="row">
     <div class="col">
      <b><asp:Label ID="book" runat="server"></asp:Label><asp:Label ID="Label1" runat="server" Text=" bookings are present in your book list"></asp:Label></b> 
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" DataKeyNames="work_id" AutoGenerateColumns="False" Text="" BackColor="#CCFFFF" BorderStyle="Solid" BorderColor="Black" BorderWidth="3px" >
                             <Columns>
                                 <asp:TemplateField HeaderText="My Bookings" HeaderStyle-BackColor="#FFFF99">
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-12">                                          
                                             <div class="row">
                                                <div class="col-6">
                                                   <span>Employer ID - </span>
                                                   <asp:Label ID="empid" runat="server" Font-Bold="True" Text='<%# Eval("employer_id") %>'></asp:Label>
                                                    </div>
                                                 <div class="col-6">
                                                   <span>Employer Name - </span>
                                                   <asp:Label ID="empname" runat="server" Font-Bold="True" Text='<%# Eval("employer_name") %>'></asp:Label>
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
                                                   <asp:Label ID="work" runat="server" Font-Bold="True" Text='<%# Eval("category") %>'></asp:Label>
                                                      </div>
                                                  <div class="col-3">
                                                   Date -
                                                   <asp:Label ID="date" runat="server" Font-Bold="True" Text='<%# Eval("start_date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                      </div>
                                                  <div class="col-3">
                                                   Time -
                                                   <asp:Label ID="time" runat="server" Font-Bold="True" Text='<%#Eval("start_time", "{0:hh.mm tt}") %>'></asp:Label>
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
                                                   No of Workers -
                                                   <asp:Label ID="noofworker" runat="server" Font-Bold="True" Text='<%# Eval("no_of_worker") %>'></asp:Label>
                                                    </div>

                                                 </div>    
                                            
                                             <hr />
                                             <div class="row">
                                                 
                                                  <div class="col-2">
                                                       <asp:Button ID="btnupdate" class="btn btn-success btn-block" runat="server" Text="Update" OnClick="btnupdate_Click" />
                                                  </div>
                                                  <div class="col-2">
                                                        <asp:Button ID="btndelete" class="btn btn-danger btn-block" runat="server" Text="Delete" CommandArgument='<%# Eval("work_id") %>' OnClientClick="return confirm('Are you sure want to delete?');" OnClick="btndelete_Click" />
                                                  </div>
                                               
                                                 <div class="col-3">
                                                     <asp:Button ID="btnstart" class="btn btn-secondary btn-block" runat="server" Text="Start Now" OnClick="btnstart_Click" OnClientClick="return confirm('Are you sure want to start the work?');" />
                                                 </div>
                                                 <div class="col-3">
                                                     <asp:Button ID="btnend" class="btn btn-primary btn-block" runat="server" Text="End Now" OnClick="btnend_Click"  OnClientClick="return confirm('Are you sure want to end the work?');" />
                                                 </div>
                                                  <div class="col-2">
                                                        <asp:Button ID="btnview" class="btn btn-info btn-block" runat="server" Text="View" OnClick="btnview_Click"   />
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
