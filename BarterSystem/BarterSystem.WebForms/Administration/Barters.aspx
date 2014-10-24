<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Barters.aspx.cs" Inherits="BarterSystem.WebForms.Administration.Barters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>All offered barters</h3>
    <asp:ListView ID="AdminBarterVL" runat="server"
        DataKeyNames="Id"
        OnItemCommand="ListView1_ItemCommand"
        DeleteMethod="AdminBarterVL_DeleteItem"
        ItemType="BarterSystem.WebForms.Models.BarterViewModel"
        SelectMethod="AdminBarterVL_GetData"
        UpdateMethod="AdminBarterVL_UpdateItem">
        <AlternatingItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="DeleteButton" CssClass="btn btn-primary btn-xs" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" CssClass="btn btn-primary btn-xs" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="ApproveButton" CssClass="btn btn-success btn-xs" runat="server" CommandName="Approve" Text="Approve" CommandArgument='<%# Eval("Id") %>' />
                    <asp:Button ID="Disapprove" CssClass="btn btn-danger btn-xs" runat="server" CommandName="Disapprove" Text="Reject" CommandArgument='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%#: Item.UserName %>' />
                </td>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%#: Item.Title %>' />
                </td>
                <td>
                    <asp:Label ID="ContentLabel" runat="server" Text='<%#: Item.Content %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryIdLabel" runat="server" Text='<%#: Item.CategoryName %>' />
                </td>
                <td>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%#: Item.Status %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%#: Item.Id %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="UpdateButton" CssClass="btn btn-primary btn-xs" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" CssClass="btn btn-primary btn-xs" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <asp:RequiredFieldValidator runat="server"
                         ControlToValidate="TitleTextBox"
                        CssClass="validation-warrning" ErrorMessage="*" />
                    <asp:RegularExpressionValidator Display="Dynamic" runat="server" 
                        ControlToValidate="TitleTextBox"
                        ValidationExpression="^[\s\S]{5,50}$"
                        CssClass="validation-warrning" ErrorMessage="*" />
                </td>
                <td>
                    <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
                     <asp:RequiredFieldValidator runat="server" 
                         ControlToValidate="ContentTextBox"
                        CssClass="validation-warrning" ErrorMessage="*" />
                    <asp:RegularExpressionValidator Display="Dynamic" runat="server" ControlToValidate="ContentTextBox"
                        ValidationExpression="^[\s\S]{5,200}$"
                        CssClass="validation-warrning" ErrorMessage="*" />
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="CategoryPicker"
                        DataSourceID="CategoryList" DataValueField="Id"
                        DataTextField="Name" SelectedValue='<%# Bind("CategoryId") %>'>
                    </asp:DropDownList>
                    <%--<asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />--%>
                </td>
                <td>
                    <asp:Label ID="StatusTextBox" runat="server" Text='<%# Item.Status %>' />
                </td>
                <td>
                    <asp:Label ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" class="table table-striped table-hover">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:Button ID="InsertButton" CssClass="btn btn-primary btn-xs" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" CssClass="btn btn-primary btn-xs" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-primary btn-xs" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CssClass="btn btn-primary btn-xs" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="ApproveButton" runat="server" CssClass="btn btn-success btn-xs" CommandName="Approve"
                        Text="Approve" CommandArgument='<%# Eval("Id") %>' />
                    <asp:Button ID="Disapprove" runat="server" CssClass="btn btn-danger btn-xs" CommandName="Disapprove"
                        Text="Reject" CommandArgument='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%#: Item.UserName %>' />
                </td>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%#: Item.Title %>' />
                </td>
                <td>
                    <asp:Label ID="ContentLabel" runat="server" Text='<%#: Item.Content %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryIdLabel" runat="server" Text='<%#: Item.CategoryName %>' />
                </td>
                <td>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%#: Item.Status %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%#: Item.Id %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" class="table table-striped table-hover ">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">
                                    <asp:LinkButton ID="SortByName" runat="server"
                                        CommandArgument="UserName" CommandName="Sort" Text="User name" /></th>
                                <th runat="server">
                                    <asp:LinkButton ID="SortByTitle" runat="server"
                                        CommandArgument="Title" CommandName="Sort" Text="Title" /></th>
                                <th runat="server">
                                    <asp:LinkButton ID="SortByContent" runat="server"
                                        CommandArgument="Content" CommandName="Content" Text="Content" /></th>
                                <th runat="server">
                                    <asp:LinkButton ID="SortByCategory" runat="server"
                                        CommandArgument="CategoryID" CommandName="Sort" Text="Categor" /></th>
                                <th runat="server">
                                    <asp:LinkButton ID="SortByStatus" runat="server"
                                        CommandArgument="Status" CommandName="Sort" Text="Status" /></th>
                                <th runat="server">
                                    <asp:LinkButton ID="SortById" runat="server"
                                        CommandArgument="Id" CommandName="Sort" Text="Id" /></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-primary btn-sm" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete"
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                </td>
                <td>
                    <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Eval("CategoryId") %>' />
                </td>
                <td>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource runat="server" ID="CategoryList" OnSelecting="CategoryList_Selecting" SelectMethod="GetCategoriesWithValues" TypeName="BarterSystem.WebForms.Administration.Barters" />
</asp:Content>


