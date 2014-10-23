<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="BarterSystem.WebForms.Administration.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Here are the categories</h3>
    <asp:ListView ID="CategoryLV" runat="server"
        ItemPlaceholderID="itemPlaceholder"
        ItemType="BarterSystem.WebForms.Models.CategoryViewModel"
        DataKeyName="Id"
        SelectMethod="CategoryLV_GetData"
        UpdateMethod="CategoryLV_UpdateItem"
        InsertMethod="CategoryLV_InsertItem">
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox runat="server"
                        Text='<%# Bind("Name") %>'
                        ID="CategoryNameTextBox" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CategoryNameTextBox"
                        CssClass=".validation-warrning" ErrorMessage="The Category name is required.<br/>" />
                    <asp:TextBox runat="server" CssClass="invisible"
                        Text='<%# Bind("Id") %>'
                        ID="CategoryIdTextBox" />

                </td>
                <td>
                    <%# Item.Id %>
                </td>
                <td>
                    <asp:Button ID="UpdateButton" CssClass="btn btn-primary btn-xs"
                        runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" CssClass="btn btn-primary btn-xs"
                        runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.Name %></td>
                <td>
                    <%#: Item.Id %>
                </td>
                <td>
                    <asp:Button ID="EditButton" runat="server"
                        CssClass="btn btn-primary btn-xs"
                        CommandName="Edit" Text="Edit" /></td>
            </tr>

        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" id="View" class="table table-striped table-hover ">
                <tr runat="server">
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByName"
                            CommandName="Sort" CommandArgument="Name">Name</asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortById"
                            CommandName="Sort" CommandArgument="Id">Id</asp:LinkButton>
                    </th>
                    <th></th>
                </tr>
                <tr runat="server" id="itemPlaceholder">
                </tr>

            </table>

            <asp:DataPager runat="server" PageSize="5">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowNextPageButton="true"
                        ShowLastPageButton="true" ShowPreviousPageButton="true"
                        ButtonCssClass="btn btn-primary btn-sm" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>
    </asp:ListView>
    <form>

        <asp:Label Text="New category name " AssociatedControlID="NewCategoryName" runat="server" />
        <asp:TextBox runat="server" CssClass="form-control" ID="NewCategoryName" />
        <asp:Button Text="Create category" runat="server" CssClass="btn btn-primary" OnClick="CreateCategory_Click" />
    </form>

</asp:Content>
