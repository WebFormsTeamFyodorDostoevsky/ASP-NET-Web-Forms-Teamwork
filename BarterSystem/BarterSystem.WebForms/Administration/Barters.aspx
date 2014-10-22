<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Barters.aspx.cs" Inherits="BarterSystem.WebForms.Administration.Barters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Here are the barters</h3>
    <asp:ListView ID="AdminBarterVL" runat="server"
        DataSourceID="BarterODS"
        DataKeyNames="Id"
        OnItemCommand="ListView1_ItemCommand">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="ApproveButton" runat="server" CommandName="Approve"
                         Text="Approve" CommandArgument='<%# Eval("Id") %>' />
                    <asp:Button ID="Disapprove" runat="server"  CommandName="Disapprove" 
                        Text="Disapprove" CommandArgument='<%# Eval("Id") %>' />
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
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
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
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="ApproveButton" runat="server" CommandName="Approve"
                         Text="Approve" CommandArgument='<%# Eval("Id") %>' />
                    <asp:Button ID="Disapprove" runat="server"  CommandName="Disapprove" 
                        Text="Disapprove" CommandArgument='<%# Eval("Id") %>' />
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
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">UserName</th>
                                <th runat="server">Title</th>
                                <th runat="server">Content</th>
                                <th runat="server">CategoryId</th>
                                <th runat="server">Status</th>
                                <th runat="server">Id</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
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
    <asp:ObjectDataSource ID="BarterODS" runat="server"
        DataObjectTypeName="BarterSystem.WebForms.Models.BarterViewModel"
        InsertMethod="InsertObject" SelectMethod="GetBarters"
        TypeName="BarterSystem.WebForms.Barter.BarterObjectData"
        UpdateMethod="UpdateObject" DeleteMethod="DeleteObject"
        ConflictDetection="CompareAllValues">
    </asp:ObjectDataSource>
</asp:Content>


