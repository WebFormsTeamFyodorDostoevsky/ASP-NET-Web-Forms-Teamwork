namespace BarterSystem.WebForms.Models
{
    using BarterSystem.Models;
    using System;
    using System.Linq.Expressions;

    using BarterSystem.Models.Enums;

    public class AdvertismentViewModel
    {
        public static Expression<Func<Advertisment, AdvertismentViewModel>> FromAdvertisment
        {
            get
            {
                return ad => new AdvertismentViewModel
                {
                    Id = ad.Id,
                    Title = ad.Title,
                    Status = ad.Status,
                    CategoryName = ad.Category.Name
                };
            }
        }

        public int Id { get; set; }

        public string Title { get; set; }

        public string CategoryName { get; set; }

        public Status Status { get; set; }
    }
}