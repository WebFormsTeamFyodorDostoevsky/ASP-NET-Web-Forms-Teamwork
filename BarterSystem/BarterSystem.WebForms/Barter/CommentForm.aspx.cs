using BarterSystem.Data;
using BarterSystem.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using BarterSystem.WebForms.Controls.Notifier;
using BarterSystem.Common;

namespace BarterSystem.WebForms.Barter
{
    public partial class CommentForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var itemNames = System.Enum.GetNames(typeof(BarterSystem.Models.Enums.Feedback));
            var sorted = itemNames.ToList().OrderByDescending(a => a);
            this.FeedbackType.DataSource = sorted;
            var barterId = int.Parse(Request.QueryString["id"]);
            var uow = new BarterSystemData();
            var commentedBarter = uow.Advertisments.Find(barterId);
            this.BarterTitle.Text = commentedBarter.Title;
            this.BarterAuthor.Text = commentedBarter.User.UserName;
            this.Photo.ImageUrl = GlobalConstants.ImagesPath + commentedBarter.ImageUrl;
            this.barterContent.Text = "Content: " + commentedBarter.Content;
            Page.DataBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            var barterId = int.Parse(Request.QueryString["id"]);
            var uow = new BarterSystemData();
            var commentedBarter = uow.Advertisments.Find(barterId);

            if (commentedBarter.AcceptUserId == this.User.Identity.GetUserId())
            {
                commentedBarter.CommentedByAcceptUser = true;
            }
            else
            {
                commentedBarter.CommentedByUser = true;
            }

            if (commentedBarter.CommentedByUser && commentedBarter.CommentedByAcceptUser)
            {
                commentedBarter.Status = Status.Done;
            }

            var comment = new BarterSystem.Models.Comment();
            comment.Feedback = (Feedback) Enum.Parse(typeof(Feedback), this.FeedbackType.Text);
            comment.Content = this.Content.Text;
            comment.UserId = this.User.Identity.GetUserId();
            
            uow.Comments.Add(comment);
            uow.SaveChanges();

            Notifier.Success("Barter offer successfully commented");
            Server.Transfer("~/Barter/Comment.aspx", true);
        }
    }
}