namespace BarterSystem.WebForms.Barter
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Data.Entity;
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
            ads = uow.Advertisments.All().Where(a => a.Status == Status.Available).Select(AdvertismentViewModel.FromAdvertisment);
            return ads;
        }
    }
}