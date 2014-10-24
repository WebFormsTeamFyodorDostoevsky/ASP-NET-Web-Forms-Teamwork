namespace BarterSystem.WebForms
{
    using System;
    using System.Globalization;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    using BarterSystem.Common;
    using BarterSystem.Data;
    using BarterSystem.WebForms.Models;

    using Microsoft.AspNet.Identity;

    public partial class Profile : Page
    {
        public UserViewModel UserModel { get; set; }

        public IQueryable<AdvertismentViewModel> DisplayBartersGetData()
        {
            var data = new BarterSystemData();
            var userId = this.User.Identity.GetUserId();
            var ads = data.Advertisments.All().Where(a => a.UserId == userId || a.AcceptUserId == userId).Select(AdvertismentViewModel.FromAdvertisment);
            return ads;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }

            if (!this.Page.IsPostBack)
            {
                this.BindData();
            }
        }

        protected void ListEvents_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.DataPagerComments.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

            // rebind List View
            this.BindData();
        }

        private void BindData()
        {
            var data = new BarterSystemData();
            var userId = this.User.Identity.GetUserId();
            this.UserModel = data.Users.All().Where(u => u.Id == userId).Select(UserViewModel.FromDataToModel).First();
            this.Avatar.ImageUrl = GlobalConstants.ImagesPath + this.UserModel.AvatarUrl;
            this.Username.Text = Server.HtmlEncode(this.UserModel.Username);
            this.Name.Text = Server.HtmlEncode(string.Format("{0} {1}", this.UserModel.FirstName, this.UserModel.LastName));
            this.NameHeader.Text = Server.HtmlEncode(string.Format("{0} {1}", this.UserModel.FirstName, this.UserModel.LastName));
            this.Rating.Text = Server.HtmlEncode(this.UserModel.Rating.ToString(CultureInfo.InvariantCulture));

            this.Skills.DataSource = this.UserModel.Skills;
            this.Skills.DataBind();

            this.Comments.DataSource = this.UserModel.Comments.ToList();
            this.Comments.DataBind();
        }
    }
}