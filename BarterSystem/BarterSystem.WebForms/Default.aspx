<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BarterSystem.WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>FREE BARTERS</h1>
        <p class="lead">Free Barters is a web site for free exchange of goods and services between registered users without the mediation of money.</p>
        <p><a href="About.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Registered users:</h2>
        </div>
        <div class="col-md-4">
            <h2>Offered barters:</h2>
        </div>
        <div class="col-md-4">
            <h2>Total categories:</h2>
        </div>
    </div>

</asp:Content>
