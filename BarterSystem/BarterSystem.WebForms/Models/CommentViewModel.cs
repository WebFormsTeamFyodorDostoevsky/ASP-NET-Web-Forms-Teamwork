namespace BarterSystem.WebForms.Models
{
    using System;
    using System.Linq.Expressions;

    using BarterSystem.Models;
    using BarterSystem.Models.Enums;

    public class CommentViewModel
    {
        public static Expression<Func<Comment, CommentViewModel>> FromDataToModel
        {
            get
            {
                return comment => new CommentViewModel
                {
                    Content = comment.Content,
                    Feedback = comment.Feedback
                };
            }
        }

        public string Content { get; set; }

        public Feedback Feedback { get; set; }
    }
}