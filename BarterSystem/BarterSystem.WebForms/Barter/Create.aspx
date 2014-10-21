<%@ Page 
    Title="Create" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Create.aspx.cs" 
    Inherits="BarterSystem.WebForms.Barter.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>
    <div class="form-horizontal">
        <h4>Create a new barter offer</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TitleAd" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TitleAd" TextMode="SingleLine" CssClass="form-control" />
               <asp:RequiredFieldValidator runat="server" ControlToValidate="TitleAd"
                    CssClass="text-danger" ErrorMessage="The title field is required." /> 
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Content" CssClass="col-md-2 control-label">Content</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Content" TextMode="MultiLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Content"
                    CssClass="text-danger" ErrorMessage="The content field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Category" CssClass="col-md-2 control-label">Category</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="Category" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Category"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The category field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateBarter_Click" Text="Create" CssClass="btn btn-default" />
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx"  Text="Cancel" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
