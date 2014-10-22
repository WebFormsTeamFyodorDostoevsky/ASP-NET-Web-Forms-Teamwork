using BarterSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using BarterSystem.Models.Enums;
using BarterSystem.WebForms.Models;

namespace BarterSystem.WebForms.Barter
{
    public partial class Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }

            var uow = new BarterSystemData();
            var userId = this.User.Identity.GetUserId();
            var username = this.User.Identity.GetUserName();
            this.ListViewBarters.DataSource = uow.Advertisments
                .All()
                .Where(a => (a.AcceptUserId == userId && !a.CommentedByAcceptUser) || (a.UserId == userId && !a.CommentedByUser) && a.Status == Status.AwaitingFeedback)
                .Select(a => new BarterViewModel() { UserName = username, Content = a.Content, Title = a.Title, Id = a.Id })
                .ToList();
            Page.DataBind();
        }
    }
}