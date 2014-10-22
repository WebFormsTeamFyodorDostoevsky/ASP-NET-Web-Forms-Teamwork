<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="BarterSystem.WebForms.Barter.Comment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:ListView ID="ListViewBarters" runat="server"
            ItemType="BarterSystem.WebForms.Models.BarterForCommentViewModel">
            <LayoutTemplate>
                <h3>Comment your finished barters.</h3>
                <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
            </LayoutTemplate>
            <EmptyDataTemplate>
                No barters for comment.
            </EmptyDataTemplate>
            <ItemSeparatorTemplate>
                <hr />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Image runat="server" AlternateText="Barter photo" Width="140" ImageUrl="<%#: Item.ImageUrl %>"/>
                        </div>
                    <div class="col-md-9">
                    <h4><%#: Item.Title %></h4>
                    <h6><em>On: <%# Item.CreationDate.ToShortDateString() %> By: <%#: Item.UserName %></em></h6>
                    <p><asp:Literal runat="server" Mode="Encode" Text="<%# Item.Content %>"></asp:Literal></p>
                    <a class="btn btn-primary btn-sm" href="CommentForm.aspx?id=<%#:Item.Id%>">Comment</a>
                        </div>
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
