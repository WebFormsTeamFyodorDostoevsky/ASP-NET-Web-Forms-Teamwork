<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BarterSystem.WebForms.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        <asp:Label runat="server" ID="Name" />
    </h3>
    <div class="container">
        <ul class="col-md-3 list-group text-center">
            <li class="list-group-item">
                <asp:Image runat="server" ID="Avatar" CssClass="img-thumbnail" />
            </li>
            <li class="list-group-item">
                <i class="glyphicon glyphicon-user pull-left"></i>
                <asp:Label runat="server" ID="Username" />
            </li>
            <li class="list-group-item">
                <i class="glyphicon glyphicon-star pull-left"></i>
                Rating:
                <asp:Label runat="server" ID="Rating" />
            </li>
            <li class="list-group-item">
                <i class="glyphicon glyphicon-list pull-left"></i>
                <strong class="list-group-item-text">Skills</strong>
                <asp:Repeater runat="server" ID="Skills">
                    <HeaderTemplate>
                        <ul class="list-group">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="list-group-item list-group-item-success"><%# Container.DataItem %></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
        </ul>
        <div class="col-md-9">
            <div class="row">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        Comments:
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
            <div class="row">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        My Advertisements:
                    </div>
                    <div class="panel-body">
                        <asp:ListView ID="DisplayBarters"
                            runat="server"
                            ItemType="BarterSystem.WebForms.Models.AdvertismentViewModel"
                            DataKeyNames="Id"
                            SelectMethod="DisplayBartersGetData"
                            ItemPlaceholderID="itemPlaceholder">
                            <LayoutTemplate>
                                <table runat="server" id="View" class="table table-striped table-hover ">
                                    <tr runat="server">
                                        <th runat="server">
                                            <asp:LinkButton runat="server" ID="SortByTitle" CommandName="Sort" CommandArgument="Title">Title</asp:LinkButton>
                                        </th>
                                        <th runat="server">
                                            <asp:LinkButton runat="server" ID="SortByCategory" CommandName="Sort" CommandArgument="CategoryName">Category</asp:LinkButton>
                                        </th>
                                        <th runat="server">
                                            <asp:LinkButton runat="server" ID="SortByStatus" CommandName="Sort" CommandArgument="Status">Status</asp:LinkButton>
                                        </th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder">
                                    </tr>
                                </table>
                                <div>
                                    <asp:DataPager ID="DataPagerAdvertisments" runat="server" PageSize="5">
                                        <Fields>
                                            <asp:NextPreviousPagerField ShowFirstPageButton="True"
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                                            <asp:NumericPagerField CurrentPageLabelCssClass="btn btn-default" NextPreviousButtonCssClass="btn btn-default" NumericButtonCssClass="btn btn-default" />
                                            <asp:NextPreviousPagerField ShowLastPageButton="True"
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#: Item.Title %></td>
                                    <td><%#: Item.CategoryName %></td>
                                    <td>
                                        <span class="label label-success"><%#: Item.Status %></span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <h3>No Advertisements to show</h3>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

