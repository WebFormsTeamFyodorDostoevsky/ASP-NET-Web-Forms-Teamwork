<%@ Page
    Title="Create"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Create.aspx.cs"
    Inherits="BarterSystem.WebForms.Barter.Create" %>

<%@ Register Src="~/Controls/ImageFromUrl/ImageFromUrlSave.ascx" TagPrefix="uc1" TagName="ImageFromUrlSave" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Create a new barter offer.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TitleAd" CssClass="col-md-2 control-label">Title</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TitleAd" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TitleAd"
                    CssClass="text-danger" ErrorMessage="The title field is required." />
                <asp:RegularExpressionValidator Display="Dynamic" runat="server" ControlToValidate="TitleAd"
                            ValidationExpression="^[\s\S]{5,50}$"
                            CssClass="text-danger" ErrorMessage="The title length must be between 3 and 50 symbols." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FileUploadImage" CssClass="col-md-2 control-label">Image:</asp:Label>            
            <div class="col-md-4">
                <asp:FileUpload runat="server" ID="FileUploadImage" CssClass="form-control" />
                <asp:RegularExpressionValidator ID="RevImg" runat="server" ControlToValidate="FileUploadImage"
                    ErrorMessage="Invalid File!(only  .gif, .jpg, .jpeg Files are supported)"
                    ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF|.jpeg|JPEG)$" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ControlImageUrl" CssClass="col-md-2 control-label">Or image url:</asp:Label>            
            <div class="col-md-4">
                <uc1:ImageFromUrlSave runat="server" ID="ControlImageUrl" />            
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Content" CssClass="col-md-2 control-label">Content</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Content" TextMode="MultiLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Content"
                    CssClass="text-danger" ErrorMessage="The content field is required." />
                <asp:RegularExpressionValidator Display="Dynamic" runat="server" ControlToValidate="Content"
                            ValidationExpression="^[\s\S]{5,200}$"
                            CssClass="text-danger" ErrorMessage="The title length must be between 5 and 200 symbols." />
                
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
                <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" Text="Cancel" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
