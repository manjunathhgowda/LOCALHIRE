<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="employerhome.aspx.cs" Inherits="localhire.employerhome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
    <div class="col">
        &nbsp;
     </div>
    </div>
  
    <div class="row">
    <div class="col-2">
    
     </div>
    <div class="col-8">
        <img src="images/labours.jpg" class="align-content-center"/>
     </div>
        
        <div class="col-2"> 
     </div>

    </div>

    <div class="row">
    <div class="col-3">
    </div>
 
    <div class="col-6">
       <center><h5><b class="text-primary"> GET THE BEST WORKERS AROUND YOU</b></h5></center>
       <center> <h6 CLASS="text-success">post your job now </h6></center>
        <br />
        <center>
            <asp:Button ID="Button1" class="btn btn-secondary " runat="server" Text="Click Here" OnClick="Button1_Click" />
        </center>
    </div>
    
    <div class="col-3">
    </div>
    </div>

    <div class="row">
    <div class="col">
        &nbsp;
    </div>
    </div>

    <div class="row">
    <div class="col">
        &nbsp;
    </div>
    </div>

    <div class="row">
    <div class="col">
        &nbsp;
    </div>
    </div>
</asp:Content>
