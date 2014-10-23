<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BarterSystem.WebForms.Barter.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Here you can search and filter all the barters.</h3>
    <div class="container row">
        <asp:TextBox ID="SearchBox" runat="server" CssClass="col-md-4 form-control">

        </asp:TextBox>
        <asp:LinkButton ID="SearchBtn" runat="server" CssClass="col-md-1 btn btn-primary" Text="Search" OnClick="SearchBtn_Click">

        </asp:LinkButton>
    </div>
    <br />
    <asp:ListView ID="DisplayBarters" 
                  runat="server"
                  ItemType="BarterSystem.WebForms.Models.AdvertismentViewModel" 
                  DataKeyNames="Id"
                  SelectMethod="DisplayBarters_GetData"
                  UpdateMethod="DisplayBarters_UpdateData"
                  ItemPlaceholderID="itemPlaceholder">
        <LayoutTemplate>
            <table runat="server" id="View" class="table table-striped table-hover ">
                <tr runat="server">
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="Photo">Photo</asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByTitle" CommandName="Sort" CommandArgument="Title">Title</asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByCategory" CommandName="Sort" CommandArgument="CategoryName">Category</asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByDate" CommandName="Sort" CommandArgument="CreationDate">CreationDate</asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByUsername" CommandName="Sort" CommandArgument="Username">Username</asp:LinkButton>
                    </th>
                    <th> </th>
                </tr>
                <tr runat="server" ID="itemPlaceholder">
                </tr>
            </table>
            <div>
                <asp:DataPager ID="DataPagerAdvertisments" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ShowFirstPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                        <asp:NumericPagerField CurrentPageLabelCssClass="btn btn-default" NextPreviousButtonCssClass="btn btn-default" NumericButtonCssClass ="btn btn-default" />
                        <asp:NextPreviousPagerField ShowLastPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="btn btn-default" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:Image runat="server" AlternateText="Barter photo" Width="80px" ImageUrl="<%#: Item.ImageUrl %>"/></td>
                <td><%#: Item.Title %></td>
                <td><%#: Item.CategoryName %></td>
                <td><%#: Item.CreationDate %></td>
                <td>
                    <%#: Item.Username %>
                </td>
                <td>
                    <asp:Button ID="AcceptButton" Text="Accept" CssClass="btn btn-success" runat="server" CommandArgument='<%#: Item.Id %>' CommandName="Accept" OnCommand="AcceptButton_Click"/>
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

