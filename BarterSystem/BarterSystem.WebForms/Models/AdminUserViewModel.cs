using BarterSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace BarterSystem.WebForms.Models
{
    public class AdminUserViewModel
    {
        
        public static Expression<Func<User, AdminUserViewModel>> FromDataToModel
        {
            get
            {
                return user => new AdminUserViewModel
                                   {
                                       Username = user.UserName,
                                       AvatarUrl = user.AvatarUrl,
                                       FirstName = user.FirstName,
                                       LastName = user.LastName,
                                       Rating = user.Rating,
                                       
                                   };
            }
        }

        public AdminUserViewModel()
        {
        }
        
        public string Username { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string AvatarUrl { get; set; }
        
        public int Rating { get; set; }
    }
}