<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="updatework.aspx.cs" Inherits="localhire.updatework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="row">
        <div class="col">
    <centre>
    <h4>Update Your Job</h4>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    </centre>
    </div>
    </div>

      <div class ="row">
        <div class="col">
    <hr />
    </div>
    </div>

    <div class ="row">
        <div class="col-6">
            <asp:Image ID="Image8" runat="server" src="images/id%20icon.png" width="20" height="20" /> &nbsp;<label>Work ID</label>
           <asp:TextBox ID="txt_id" class="form-control" runat="server" readonly></asp:TextBox>

        </div>
        <div class="col-6">
             <asp:Image ID="Image6" runat="server" src="images/rocky%20bhai.png" width="20" height="20" /> &nbsp;<label>Work Catagories</label> 
    <asp:DropDownList class="form-control"  ID="categorylist" runat="server">
        <asp:ListItem Text="Choose"></asp:ListItem>
       
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="categorylist" Font-Size="Small" Font-Bold="True" ForeColor="Red" InitialValue="Choose" ValidationGroup="creat"></asp:RequiredFieldValidator>

            
    </div>
    </div>

    &nbsp;
     <div class ="row">
        <div class="col">
            <asp:Image ID="Image1" runat="server" src="images/calendar.png" width="20" height="20" /> &nbsp;<label>Start Date</label> 
            <asp:TextBox ID="txt_date" class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_date" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat"></asp:RequiredFieldValidator>

    </div>

             <div class="col-6">
         <asp:Image ID="Image2" runat="server" src="images/hour-glass.png" width="20" height="20" /> &nbsp;<label>Start Time</label> 
            <asp:TextBox ID="txt_time" class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_time" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat"></asp:RequiredFieldValidator>

    </div>
    </div>
    &nbsp;

    <div class ="row">
        <div class="col-6">
            <asp:Image ID="Image4" runat="server" src="images/address%20icon.png" width="20" height="20" /> &nbsp;<label>Address</label> 
            <asp:TextBox ID="txt_address" class="form-control" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_address" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat"></asp:RequiredFieldValidator>

    </div>
    
        <div class="col-6">
            <asp:Image ID="Image3" runat="server" src="images/notebook.png" width="20" height="20" /> &nbsp;<label>Work Description</label> 
            <asp:TextBox ID="txt_description" class="form-control" runat="server" placeholder="Work description" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_description" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat"></asp:RequiredFieldValidator>

    </div>
    </div>
    &nbsp;

    <div class ="row">
        <div class="col-6">
            
            <asp:Image ID="Image5" runat="server" src="images/wallet.png" width="20" height="20" /> &nbsp;<label>Salary (/hrs)</label> 
            <div class="row">
                <div class="col-2">
                    <asp:TextBox ID="TextBox1"  class="form-control" runat="server" value="&#8377;" ReadOnly></asp:TextBox>
                 </div>
                <div class="col-10">
                    <asp:TextBox ID="txt_salary" class="form-control" runat="server" placeholder="Salary (/hr)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_salary" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txt_salary" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

                </div>
            </div>
    </div>
    
        <div class="col-6">
            <asp:Image ID="Image7" runat="server" src="images/workers.png" width="20" height="20" /> &nbsp;<label>No of Workers Required</label> 
            <asp:TextBox ID="txt_no_of_worker" class="form-control" runat="server" placeholder="No of workers required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txt_no_of_worker" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*only numbers are allowed"  Display="Dynamic" ControlToValidate="txt_no_of_worker" Font-Size="Small" Font-Bold="True" ForeColor="Red" ValidationGroup="creat" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>

    </div>
    </div>
    &nbsp;
    <div class ="row">
        <div class="col-6">
            <asp:Button ID="Button2" Class="btn btn-outline-secondary form-control" runat="server" Text="Back" OnClick="Button2_Click" />

        </div>
        <div class="col-6">      
            <asp:Button ID="Button1" Class="btn btn-outline-primary form-control" runat="server" Text="Update" ValidationGroup="creat" OnClick="Button1_Click" />
        </div>     
    </div>
</asp:Content>
