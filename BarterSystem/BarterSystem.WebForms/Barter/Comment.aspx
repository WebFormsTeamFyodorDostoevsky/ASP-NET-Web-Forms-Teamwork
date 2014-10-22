<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="BarterSystem.WebForms.Barter.Comment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h3>Comment your finished barters.</h3>
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
        </asp:Repeater>--%>
    <asp:ListView ID="ListViewBarters" runat="server"
            ItemType="BarterSystem.WebForms.Models.BarterViewModel">
            <LayoutTemplate>
                <h3>Comment your finished barters.</h3>
                <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <hr />
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <div>
                    <h4><%#: Item.Title %></h4>
                    <h6>By: <%#: Item.UserName %></h6>
                    <p><%#: Item.Content %></p>
                    <a class="btn btn-primary btn-sm" href="CommentForm.aspx?id=<%#:Item.Id %>">Comment</a>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <div class="pagination">
        <asp:DataPager ID="DataPagerBarters" runat="server"
            PagedControlID="ListViewBarters" PageSize="3"
            QueryStringField="page">
            <Fields>
                <asp:NextPreviousPagerField ButtonCssClass="btn btn-primary" ShowFirstPageButton="true"
                    ShowNextPageButton="false" ShowPreviousPageButton="false" />
                <asp:NumericPagerField NumericButtonCssClass="btn btn-link" CurrentPageLabelCssClass="btn btn-link black" />
                <asp:NextPreviousPagerField ButtonCssClass="btn btn-primary" ShowLastPageButton="true"
                    ShowNextPageButton="false" ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager>
        </div>
</asp:Content>
