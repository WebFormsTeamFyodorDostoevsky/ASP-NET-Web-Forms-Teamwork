namespace BarterSystem.WebForms.Models
{
    using System;

    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;

    using BarterSystem.Models;

    public class UserViewModel
    {
        public static Expression<Func<User, UserViewModel>> FromDataToModel
        {
            get
            {
                return user => new UserViewModel
                                   {
                                       Username = user.UserName,
                                       Advertisments = user.Advertisments.AsQueryable().Select(AdvertismentViewModel.FromAdvertisment).ToList(),
                                       AvatarUrl = user.AvatarUrl,
                                       FirstName = user.FirstName,
                                       LastName = user.LastName,
                                       Comments = user.Comments.AsQueryable().Select(CommentViewModel.FromDataToModel).ToList(),
                                       Rating = user.Rating,
                                       Skills = user.Skills.AsQueryable().Select(s => s.Name).ToList()
                                   };
            }
        }

        public UserViewModel()
        {
            this.Skills = new HashSet<string>();
            this.Comments = new HashSet<CommentViewModel>();
            this.Advertisments = new HashSet<AdvertismentViewModel>();
        }

        public string Username { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string AvatarUrl { get; set; }

        public ICollection<string> Skills { get; set; }

        public ICollection<CommentViewModel> Comments { get; set; }

        public ICollection<AdvertismentViewModel> Advertisments { get; set; }

        public int Rating { get; set; }
    }
}