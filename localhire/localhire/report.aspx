<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINDASHBOARD.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="localhire.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <a href="adminHome.aspx"><asp:Image ID="Image2" runat="server" src="images/arrow.png" Height="35" Width="35"/></a>
 <u> <center><h4>Employer & Worker Chart</h4></center></u> <hr /> 
    <div class="row">
        <div class="col-9">               
        </div>
        <div class="col-3">
         <b>Total User: <asp:Label ID="ttl" runat="server" ></asp:Label></b>  <br /> 
        <b>Total Employer: <asp:Label ID="emp" runat="server" ></asp:Label></b><br />
         <b>Total Worker: <asp:Label ID="wrkr" runat="server" ></asp:Label></b>
        </div>
    </div>
    <div class="row">
        <div class="col-2"></div>
            <div class="col-7"> 
                <div class="card"> 
                    <div class="card-body">
                        <asp:Chart ID="Chart1" runat="server" Width="400px" Height="300px">
                        <Series>
                        <asp:Series Name="Series1" ChartType="Pie">
                        <Points>
                        <asp:DataPoint YValues="table1Count" />
                        <asp:DataPoint YValues="table2Count" />
                        </Points>
                        </asp:Series>
                        </Series>
                        <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                        </asp:Chart>
                    </div>
                 </div>
              </div>
           
        <div class="col-3"></div>
    </div>
    
</asp:Content>
