using BarterSystem.Data;
using BarterSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using BarterSystem.Models.Enums;
using BarterSystem.WebForms.Controls.Notifier;

namespace BarterSystem.WebForms.Barter
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }

            if (!IsPostBack)
            {
                var uow = new BarterSystemData();
                this.Category.DataSource = uow.Categories.All().Select(c => c.Name).ToList();
                Page.DataBind();
            }
        }

        protected void CreateBarter_Click(object sender, EventArgs e)
        {
            try
            {
                var uow = new BarterSystemData();
                var newAd = new Advertisment();
                newAd.Title = this.TitleAd.Text;
                newAd.Content = this.Content.Text;
                newAd.CategoryId = uow.Categories.All().FirstOrDefault(c => c.Name == this.Category.SelectedValue).Id;
                newAd.UserId = this.User.Identity.GetUserId();
                newAd.Status = Status.Unapproved;
                newAd.CommentedByUser = false;
                newAd.CommentedByAcceptUser = false;
                uow.Advertisments.Add(newAd);
                uow.SaveChanges();
                Notifier.Success("Barter offer successfully created");
                Server.Transfer("~/Barter/Create.aspx", false);
            } 
            catch(Exception er)
            {
                Notifier.Error(er.Message);
            }
        }
    }
}