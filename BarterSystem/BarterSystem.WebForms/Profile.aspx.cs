namespace BarterSystem.WebForms
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Web.UI;

    using BarterSystem.Common;
    using BarterSystem.Data;
    using BarterSystem.WebForms.Models;

    using Microsoft.AspNet.Identity;

    public partial class Profile : Page
    {
        public UserViewModel Person { get; set; }

        public IQueryable<AdvertismentViewModel> DisplayBartersGetData()
        {
            var data = new BarterSystemData();
            var userId = this.User.Identity.GetUserId();
            var ads = data.Advertisments.All().Where(a => a.UserId == userId || a.AcceptUserId == userId).Select(AdvertismentViewModel.FromAdvertisment);
            return ads;
        }

        public IEnumerable<AdvertismentViewModel> JoinedBartersGetData()
        {
            throw new NotImplementedException();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }

            if (!this.Page.IsPostBack)
            {
                var data = new BarterSystemData();
                var userId = this.User.Identity.GetUserId();
                var user = data.Users.All()
                            .Where(u => u.Id == userId)
                            .Select(UserViewModel.FromDataToModel)
                            .First();
                this.Person = user;
                this.Avatar.ImageUrl = GlobalConstants.ImagesPath + user.AvatarUrl;
                this.Username.Text = user.Username;
                this.Name.Text = string.Format("{0} {1}", user.FirstName, user.LastName);
                this.Rating.Text = user.Rating.ToString(CultureInfo.InvariantCulture);

                this.Skills.DataSource = user.Skills;
                this.Skills.DataBind();

                this.Comments.DataSource = user.Comments;
                this.Comments.DataBind();
            }
        }
    }
}