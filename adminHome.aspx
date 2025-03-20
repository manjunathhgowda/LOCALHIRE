<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINDASHBOARD.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="localhire.adminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="row">
    <div class="col-5"></div>
    <div class="col-4"><img src="images/adminn icon.png" height="100" width="100"/></div>
    <div class="col-3"></div>
    </div>
    
    <div class="row">
    <div class="col-3"></div>
    <div class="col-6"><center><h5><b class="text-primary">Hello....! Admin</b></h5></center></div>
    <div class="col-3"></div>
    </div>
    
    <div class="row">
    <div class="col-3"></div>
    <div class="col-6"><center><b>Manage Your Work Categories Now...</b></center></div>
    <div class="col-3"></div>
    </div>
    <br />
     <div class="row">
    <div class="col-3"></div>
    <div class="col-6"><center>
        <asp:Button ID="Button1" class="btn-dark" runat="server" Text="Add Works" OnClick="Button1_Click" /></center></div>
    <div class="col-3"></div>
    </div>
    <br />
     <div class="row">
     <div class="col">
         <asp:Panel ID="Panel1" runat="server" Visible="false">
             <div class="row">
                <div class="col-3"></div>
                <div class="col-6"><asp:TextBox ID="txtworks" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txtworks" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="work"></asp:RequiredFieldValidator>

                </div>
                <div class="col-3"></div>
              </div>
             <br />
             <div class="row">
                <div class="col-3"></div>
                <div class="col-3"><center>
                    <asp:Button ID="btninsert" class="btn btn-success form-control" runat="server" Text="Insert" ValidationGroup="work" OnClick="btninsert_Click" />
                </center></div>
                <div class="col-3"><center>
                    <asp:Button ID="btnremove" class="btn btn-danger form-control" runat="server" Text="Remove" ValidationGroup="work" OnClick="btnremove_Click" />
                </center></div>
                <div class="col-3"></div>
              </div>
             <br />
             <div class="row">
                <div class="col-3"></div>
                <div class="col-6"><center>
                    
                    <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False">
                        <columns>
                            <asp:BoundField DataField="categories" HeaderText="Categories" ReadOnly="True" SortExpression="categories">
                                <itemstyle horizontalalign="Center" verticalalign="Middle"></itemstyle>
                            </asp:BoundField>
                        </columns>
                    </asp:GridView>
                </center></div>
                <div class="col-3"></div>
              </div>
         </asp:Panel>
         <br />
         <asp:Panel ID="Panel2" runat="server">
             <hr />
              <div class="container-fluid"> 
        <div class="row"> 
            <div class="col-8 mx-auto"> 
                <div class="card"> 
                    <div class="card-body">
                      <b><center>Know how many users present in the system</center></b>  <br />
       <center><asp:Button ID="Button2" class="btn-dark" runat="server" Text="Report" OnClick="Button2_Click"/></center>  
                        <br />
                 </div>
                        </div>
                    </div>
                </div>
            </div>
                 
         </asp:Panel>
     </div>
     </div> 
</asp:Content>
