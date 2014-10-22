<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="BarterSystem.WebForms.Barter.Comment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Comment your finished barters.</h3>
    <asp:Repeater ID="BartersItemsRepeater" runat="server" ItemType="BarterSystem.WebForms.Models.BarterViewModel">
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
        <ItemTemplate>
            <h4><%#: Item.Title %></h4>
            <h6>By: <%#: Item.UserName %></h6>
            <p><%#: Item.Content %></p>
            <a class="btn btn-primary btn-sm" href="CommentForm.aspx?id=<%#:Item.Id %>">Comment</a>
        </ItemTemplate>
        </asp:Repeater>
</asp:Content>
