namespace BarterSystem.WebForms.Barter
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Data.Entity;
    using BarterSystem.Data;

    public partial class Search : Page
    {
        BarterSystemData uow = new BarterSystemData();

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
        public IQueryable<BarterSystem.Models.Advertisment> DisplayBarters_GetData()
        {
            var ads = uow.Advertisments.All().Include("Category");
            return ads;
        }
    }
}