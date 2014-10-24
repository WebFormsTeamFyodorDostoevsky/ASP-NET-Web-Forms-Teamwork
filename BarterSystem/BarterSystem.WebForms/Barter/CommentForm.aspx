<%@ Page Title="Comment Barter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CommentForm.aspx.cs" Inherits="BarterSystem.WebForms.Barter.CommentForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>: <asp:Literal runat="server" ID="BarterTitle"/> - <asp:Literal runat="server" ID="BarterAuthor"/></h2>
    
    <div>
    <ajaxToolkit:CollapsiblePanelExtender   
            ID="CollapsiblePanelExtender1"  
            runat="server"  
            TargetControlID="Panel2"  
            ExpandControlID="Panel1"  
            CollapseControlID="Panel1"  
            TextLabelID="Label1"  
            ExpandedText="Hide Details"  
            CollapsedText="Show Details" Collapsed="true"
        >  
        </ajaxToolkit:CollapsiblePanelExtender>
        <asp:Panel  
            ID="Panel1"   
            runat="server"  
            Width="1000">  
            <asp:Label runat="server" CssClass="btn btn-primary btn-xs" ID="Label1" AssociatedControlID="Panel1"></asp:Label>   
        </asp:Panel>  
        <asp:Panel   
            ID="Panel2"   
            runat="server"  
            Width="1000">
            <asp:Image runat="server" ID="Photo" AlternateText="Barter photo" Width="140"/>
            <asp:Literal runat="server" ID="barterContent" Mode="Encode"></asp:Literal>
        </asp:Panel>
        </div>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FeedbackType" CssClass="col-md-2 control-label">Type</asp:Label>
            <div class="col-md-3">
                <asp:DropDownList runat="server" ID="FeedbackType" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FeedbackType"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Type field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Content" CssClass="col-md-2 control-label">Comment</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Content" TextMode="MultiLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Content"
                    CssClass="text-danger" ErrorMessage="The content field is required." />
            </div>
        </div>
            <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Save_Click" Text="Save" CssClass="btn btn-default" />
                <asp:HyperLink runat="server" NavigateUrl="~/Barter/Comment.aspx"  Text="Cancel" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
