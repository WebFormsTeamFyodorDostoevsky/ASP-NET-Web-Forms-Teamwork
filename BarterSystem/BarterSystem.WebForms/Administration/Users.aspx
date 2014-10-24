<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BarterSystem.WebForms.Administration.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Here are the users</h3>
    <asp:ListView runat="server" ID="AdminUserLV"
        DataKeyNames="Username"
        ItemType="BarterSystem.WebForms.Models.AdminUserViewModel"
        SelectMethod="AdminUserLV_GetData"
        ItemPlaceholderID="itemPlaceholder"
        UpdateMethod="AdminUserLV_UpdateItem"
        OnItemCommand="AdminUserLV_ItemCommand">

        <LayoutTemplate>
            <table runat="server" id="View"
                class="table table-striped table-hover ">
                <tr runat="server">
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByUserName"
                            CommandName="Sort" CommandArgument="Username">
                            User name
                        </asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByFirstName"
                            CommandName="Sort" CommandArgument="FirstName">
                            First name
                        </asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByLastName"
                            CommandName="Sort" CommandArgument="LastName">
                            Last name
                        </asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server" ID="SortByRating"
                            CommandName="Sort" CommandArgument="Rating">
                            Rating
                        </asp:LinkButton>
                    </th>
                    <th runat="server">
                        <asp:LinkButton runat="server">
                            Avatar
                        </asp:LinkButton>
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
        <ItemTemplate>
            <tr>
                <td><%#: Item.Username %></td>
                <td><%#: Item.FirstName%></td>
                <td><%#: Item.LastName%></td>
                <td><%#: Item.Rating%></td>
                <td>
                    <img src="/Imgs/<%# Item.AvatarUrl %>"
                        alt="<%#: Item.Username %>'s avatar"
                        class="thumbnail"
                        height="100"
                        width="100" />
                </td>
                <td>

                    <asp:Button ID="LiftBan" runat="server"
                        Visible='<%# Roles.IsUserInRole(Item.Username,"banned") %>'
                        CssClass='btn btn-danger btn-xs'
                        CommandName="LiftBan"
                        Text="Lift ban" CommandArgument='<%# Eval("Username") %>' />
                    <asp:Button
                        Visible='<%# !Roles.IsUserInRole(Item.Username,"admin") %>'
                        CssClass='btn btn-primary btn-xs'
                        ID="EditButton"
                        runat="server"
                        CommandName="Edit" Text="Edit" />
                    <asp:Button ID="PromoteButtom" runat="server"
                        Visible='<%# !Roles.IsUserInRole(Item.Username,"admin") %>'
                        CssClass='btn btn-success btn-xs'
                        CommandName="Admin"
                        Text="Make admin" CommandArgument='<%# Eval("Username") %>' />

                    <asp:Button ID="BanButton" runat="server"
                        Visible='<%# (!Roles.IsUserInRole(Item.Username,"admin"))
                    &&(!Roles.IsUserInRole(Item.Username,"banned"))  %>'
                        CssClass='btn btn-danger btn-xs'
                        CommandName="Ban"
                        Text="Ban" CommandArgument='<%# Eval("Username") %>' />

                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <td>
                <asp:Label runat="server"
                    Text='<%#: Item.Username %>'
                    ID="CategoryNameTextBox" />
            </td>
            <td>
                <asp:TextBox runat="server"
                    Text='<%# Bind("FirstName") %>'
                    ID="FirstNameTextBox" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstNameTextBox"
                    CssClass="validation-warrning" ErrorMessage="*" />
                <asp:RegularExpressionValidator Display="Dynamic" runat="server"
                    ControlToValidate="FirstNameTextBox"
                    ValidationExpression="^[\s\S]{3,30}$"
                    CssClass="validation-warrning" ErrorMessage="*" />
            </td>
            <td>
                <asp:TextBox runat="server"
                    Text='<%# Bind("LastName") %>'
                    ID="LastNameTextBox" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="LastNameTextBox"
                    CssClass="validation-warrning" ErrorMessage="*" />
                <asp:RegularExpressionValidator Display="Dynamic" runat="server"
                    ControlToValidate="LastNameTextBox"
                    ValidationExpression="^[\s\S]{3,30}$"
                    CssClass="validation-warrning" ErrorMessage="*" />
            </td>
            <td>
                <asp:Label Text='<%# Eval("Rating") %>' runat="server" />
            </td>
            <td>
                <img src="/Imgs/<%# Item.AvatarUrl %>"
                    alt="<%# Item.Username %>'s avatar"
                    class="thumbnail"
                    height="100"
                    width="100" />
            </td>
            <td>
                <asp:Button ID="UpdateButton" CssClass="btn btn-primary btn-xs"
                    runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" CssClass="btn btn-primary btn-xs"
                    runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
        </EditItemTemplate>
    </asp:ListView>
</asp:Content>
