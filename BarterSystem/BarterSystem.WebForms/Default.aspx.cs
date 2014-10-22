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
            if (Cache["usersCount"] != null)
            {
                this.TotalUsers.Text = "Registered Users: " + Cache["usersCount"].ToString();
            }
            else
            {
                var usersCount = uow.Users.All().Count();
                Cache.Insert("usersCount", usersCount, null, DateTime.Now.AddSeconds(50), TimeSpan.Zero);
                this.TotalUsers.Text = "Registered Users: " + usersCount;
            }

            if (Cache["categoriesCount"] != null)
            {
                this.TotalCategories.Text = "Total categories: " + Cache["categoriesCount"].ToString();
            }
            else
            {
                var categoriesCount = uow.Categories.All().Count();
                Cache.Insert("categoriesCount", categoriesCount, null, DateTime.Now.AddSeconds(50), TimeSpan.Zero);
                this.TotalCategories.Text = "Total categories: " + categoriesCount;
            }

            if (Cache["bartersCount"] != null)
            {
                this.TotalBarters.Text = "Offered barters: " + Cache["bartersCount"].ToString();
            }
            else
            {
                var bartersCount = uow.Advertisments.All().Count();
                Cache.Insert("bartersCount", bartersCount, null, DateTime.Now.AddSeconds(50), TimeSpan.Zero);
                this.TotalBarters.Text = "Offered barters: " + bartersCount;
            }
            this.TotalBarters.Text = "Offered Barters: " + uow.Advertisments.All().Count();
        }
    }
}