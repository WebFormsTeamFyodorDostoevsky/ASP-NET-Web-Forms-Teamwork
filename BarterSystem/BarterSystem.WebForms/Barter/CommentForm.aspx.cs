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
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }

            var paramId = Request.QueryString["id"];
            if (paramId == null)
            {
                Response.Redirect("~/");
            }

            if (!IsPostBack)
            {
                var itemNames = System.Enum.GetNames(typeof(BarterSystem.Models.Enums.Feedback));
                var sorted = itemNames.ToList().OrderByDescending(a => a);
                this.FeedbackType.DataSource = sorted;
                var barterId = int.Parse(paramId);
                var uow = new BarterSystemData();
                var commentedBarter = uow.Advertisments.Find(barterId);
                this.BarterTitle.Text = commentedBarter.Title;
                this.BarterAuthor.Text = commentedBarter.User.UserName;
                this.Photo.ImageUrl = GlobalConstants.ImagesPath + commentedBarter.ImageUrl;
                this.barterContent.Text = "Content: " + commentedBarter.Content;
                Page.DataBind();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            var paramId = Request.QueryString["id"];
            if(paramId == null)
            {
                Response.Redirect("~/");
            }

            var barterId = int.Parse(paramId);
            var uow = new BarterSystemData();
            var commentedBarter = uow.Advertisments.Find(barterId);
            var userId = this.User.Identity.GetUserId();

            if((commentedBarter.AcceptUserId == userId && !commentedBarter.CommentedByAcceptUser ||
               commentedBarter.UserId == userId && !commentedBarter.CommentedByUser) && commentedBarter.Status == Status.AwaitingFeedback)
            {
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
                var selected = this.FeedbackType;
                comment.Feedback = (Feedback)Enum.Parse(typeof(Feedback), selected.Text);
                comment.Content = this.Content.Text;
                if(commentedBarter.UserId == userId)
                {
                    comment.UserId = commentedBarter.AcceptUserId;
                }
                else
                {
                    comment.UserId = commentedBarter.UserId;
                }

                var user = uow.Users.Find(comment.UserId);
                if (comment.Feedback == Feedback.Positive)
                {
                    user.Rating++;
                }
                else if (comment.Feedback == Feedback.Negative)
                {
                    user.Rating--;
                }

                uow.Users.Update(user);
                uow.Comments.Add(comment);
                uow.SaveChanges();

                Notifier.Success("Barter offer successfully commented");
                Server.Transfer("~/Barter/Comment.aspx", true);
            }
            else
            {
                Notifier.Error("Barter could not be commented");
                Response.Redirect("~/");
            }
            
        }
    }
}