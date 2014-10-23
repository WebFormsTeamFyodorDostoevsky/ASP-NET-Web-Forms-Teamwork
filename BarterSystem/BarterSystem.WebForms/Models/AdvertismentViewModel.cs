namespace BarterSystem.WebForms.Models
{
    using System;
    using System.Linq.Expressions;

    using BarterSystem.Models;
    using BarterSystem.Models.Enums;
    using BarterSystem.Common;

    public class AdvertismentViewModel
    {
        public static Expression<Func<Advertisment, AdvertismentViewModel>> FromAdvertisment
        {
            get
            {
                return ad => new AdvertismentViewModel
                {
                    Id = ad.Id,
                    UserId = ad.UserId,
                    Title = ad.Title,
                    CategoryName = ad.Category.Name,
                    Status = ad.Status,
                    CreationDate = ad.CreationDate,
                    Username = ad.User.UserName,
                    ImageUrl = GlobalConstants.ImagesPath + ad.ImageUrl
                };
            }
        }

        public int Id { get; set; }

        public string Title { get; set; }

        public string CategoryName { get; set; }

        public Status Status { get; set; }

        public DateTime CreationDate { get; set; }

        public string Username { get; set; }

        public string ImageUrl { get; set; }

        public string UserId { get; set; }
    }
}