namespace BarterSystem.WebForms.Barter
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Microsoft.AspNet.Identity;
    using BarterSystem.Data;
    using BarterSystem.WebForms.Models;
    using BarterSystem.Models.Enums;

    public partial class Search : Page
    {
        BarterSystemData uow = new BarterSystemData();
        IQueryable<BarterSystem.WebForms.Models.AdvertismentViewModel> ads;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<BarterSystem.WebForms.Models.AdvertismentViewModel> DisplayBarters_GetData()
        {
            var currentUserId = this.User.Identity.GetUserId();
            ads = uow.Advertisments.All().Where(a => a.Status == Status.Available && a.UserId != currentUserId).Select(AdvertismentViewModel.FromAdvertisment);
            var test = ads.ToList();
            return ads;
        }

        protected void AcceptButton_Click(object sender, CommandEventArgs e)
        {
            var adId = int.Parse(e.CommandArgument.ToString());
            var currentUserId = this.User.Identity.GetUserId();
            var ad = uow.Advertisments.All().FirstOrDefault(a => a.Id == adId && a.UserId != currentUserId);

            if (ad != null)
            {
                ad.Status = Status.AwaitingFeedback;
                ad.AcceptUserId = currentUserId;
                uow.SaveChanges();
            }            

            Response.Redirect("~/Barter/Search.aspx");
        }
    }
}