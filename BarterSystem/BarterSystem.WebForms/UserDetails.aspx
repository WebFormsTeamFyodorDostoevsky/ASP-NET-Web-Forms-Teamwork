<%@ Page Title="User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="UserDetails.aspx.cs" Inherits="BarterSystem.WebForms.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>
            <asp:Label runat="server" ID="NameHeader" />
        </h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-1">
                <ul class=" list-group text-center">
                    <li class="list-group-item">
                        <asp:Image runat="server" ID="Avatar" CssClass="img-thumbnail" />
                    </li>
                    <li class="list-group-item">
                        <i class="glyphicon glyphicon-user pull-left"></i>
                        <asp:Label runat="server" ID="Name" />
                    </li>
                    <li class="list-group-item">
                        <i class="glyphicon glyphicon-envelope pull-left"></i>
                        <asp:Label runat="server" ID="Username" />
                    </li>
                    <li class="list-group-item">
                        <i class="glyphicon glyphicon-star pull-left"></i>
                        Rating:
                <asp:Label runat="server" ID="Rating" />
                    </li>

                </ul>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                             Skills
                        </div>
                        <div class="panel-body">
                            <asp:Repeater runat="server" ID="Skills">
                                <HeaderTemplate>
                                    <ul class="list-group">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <strong><%# Container.DataItem %></strong>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Comments
                        </div>
                        <div class="panel-body">
                            <asp:ListView runat="server"
                                ID="Comments" ItemType="BarterSystem.WebForms.Models.CommentViewModel">
                                <ItemTemplate>
                                    <li class="list-group-item col-md-12" runat="server">
                                        <p class="col-md-10">
                                            <%# Item.Content %>
                                        </p>
                                        <span id="LabelFeedback" class="label label-primary pull-right">
                                            <%# Item.Feedback %>
                                        </span>
                                    </li>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <h3>No comments to show</h3>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

