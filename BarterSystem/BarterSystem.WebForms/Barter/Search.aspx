<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BarterSystem.WebForms.Barter.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Here you can search and filter all the barters</h3>
    <asp:ListView ID="DisplayBarters" 
        runat="server"
        ItemType="BarterSystem.Models.Advertisment" 
        DataKeyNames="Id"
        SelectMethod="DisplayBarters_GetData"
        UpdateMethod="DisplayBarters_UpdateData"
        DeleteMethod="DisplayBarters_DeleteData"
        AllowPaging="True"
        AllowSorting="True"
        PageSize="10"
        ItemPlaceholderID="itemPlaceholder">
        <LayoutTemplate>
            <table runat="server" id="View" class="table table-striped table-hover ">
                <tr runat="server">
                    <th runat="server">Title</th>
                    <th runat="server">Category</th>
                    <th runat="server">Accept Offer</th>
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
                <td><%#: Item.Title %></td>
                <td><%#: Item.Category.Name %></td>
                <td><input type="button" class="btn btn-success" value="Accept"/></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

