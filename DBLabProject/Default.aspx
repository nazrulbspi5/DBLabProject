<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DBLabProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2 style="font-size:45px; text-align:center; color:green; font-weight:bold">
            <asp:Label ID="lblWelcome" runat="server" ></asp:Label>

        </h2>
    </div>
    <%--<div class="row">
        <div class="col-md-6" style="background-color:tomato; color:white; height:200px; text-align:center">
            <h2>Total Users : <asp:Label ID="lblTotalUser" runat="server"></asp:Label></h2>
            
        </div>
        <div class="col-md-6">
            <h2>Total Donors : <asp:Label ID="lblTotalDonor" runat="server"></asp:Label></h2>
            
        </div>
       
    </div>--%>
  

</asp:Content>
