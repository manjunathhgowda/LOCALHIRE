<%@ Page Title="" Language="C#" MasterPageFile="~/EMPLOYERDASHBOARD.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="localhire.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="Panel1" runat="server">
        <img src="images/cashless-payment.png" width="30" height="30" /> &nbsp;<b><i>LabourPay</i></b>
        <br /> <br />
        <div class="row">
            <div class="col-4">
                <asp:Image ID="Image5" runat="server" src="images/hour.png" width="20" height="20" /> &nbsp;<label>Total Hour : </label> <asp:Label ID="hour" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-4">
                <asp:Image ID="Image4" runat="server" src="images/stopwatch.png" width="20" height="20" /> &nbsp;<label>Total Minutes : </label> <asp:Label ID="minutes" runat="server" Text="Label"></asp:Label>
            </div>
       
            <div class="col-6">
                <asp:Image ID="Image1" runat="server" src="images/wallet.png" width="20" height="20" /> &nbsp;<label>Amount(/hr) : </label> <asp:Label ID="amt" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <hr />

        <div class="row"> 
            <div class="col-8 mx-auto"> 
                        <div class="card"> 
                    <div class="card-body">
              <div class="row">
            <div class="col-12">
                <asp:Label ID="TtlAmt" runat="server" Text="Label" Font-Bold="true" Font-Size="X-Large"></asp:Label><asp:Label ID="Label1" runat="server" Text=" /-"  Font-Bold="true" Font-Size="X-Large"></asp:Label>
            </div>
        </div>
            <br />

        <div class="row">
            <div class="col-12">
                <asp:Image ID="Image2" runat="server" src="images/income.png" width="25" height="25" />&nbsp;<label>Bonus </label>
            </div>
            </div>
         <div class="row">
            <div class="col-9">
                <asp:TextBox ID="txtbonus" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" Display="Dynamic" ControlToValidate="txtbonus" Font-Size="Small" Font-Bold="True" ForeColor="Red" InitialValue="0" ValidationGroup="b"></asp:RequiredFieldValidator>
            </div>
            <div class="col-3">
                 <asp:Button ID="btntotal" runat="server" Text="Total" class=" btn btn-block btn-warning " OnClick="btntotal_Click" ValidationGroup="b"/>

            </div>
        </div>
            <br />
         <div class="row">
            <div class="col">
                <asp:Image ID="Image3" runat="server" src="images/bank.png" width="20" height="20" /> &nbsp;<label>Total amount to pay </label>
                <asp:TextBox ID="txttotal" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
                        <br />
                        <div class="row">
                            <div class="col-6">
                <asp:Button ID="Btnback" runat="server" Text="Back" class=" btn btn-block btn-info " OnClick="Btnback_Click" />
            </div>
                           
            <div class="col-6">
                <asp:Button ID="btnpay" runat="server" Text="Pay Now" class=" btn btn-block btn-success " OnClick="btnpay_Click"/>
            </div>                         
        </div>
       </div>
    </div>
        </div>
    </div>
    </asp:Panel>
</asp:Content>
