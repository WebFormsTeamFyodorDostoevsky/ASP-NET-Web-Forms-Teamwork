using BarterSystem.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarterSystem.WebForms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var uow = new BarterSystemData();
            this.TotalUsers.Text = "Registered Users: " + uow.Users.All().Count();
            this.TotalCategories.Text = "Total categories: " + uow.Categories.All().Count();
            this.TotalBarters.Text = "Offered Barters: " + uow.Advertisments.All().Count();
        }
    }
}