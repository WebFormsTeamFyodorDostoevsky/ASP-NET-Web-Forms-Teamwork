using BarterSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BarterSystem.WebForms.Barter;
using BarterSystem.WebForms.Models;
using BarterSystem.Data;

using BarterSystem.WebForms.Controls.Notifier;
namespace BarterSystem.WebForms.Administration
{
    public partial class Barters : System.Web.UI.Page
    {
        private BarterSystemData data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated || !Roles.IsUserInRole("admin"))
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }
            data = new BarterSystemData();
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {


            if (String.Equals(e.CommandName, "Approve"))
            {
                //TODO optimize this
                var id = int.Parse(
                   AdminBarterVL.DataKeys[e.Item.DisplayIndex]
                   .Value.ToString());
                new BarterObjectData().Aprove(id);
                Notifier.Success("Barter approved");
                DataBind();
            }
            else if (String.Equals(e.CommandName, "Disapprove"))
            {
                var id = int.Parse(
                   AdminBarterVL.DataKeys[e.Item.DisplayIndex]
                   .Value.ToString());
                //TODO optimize this
                new BarterObjectData().Disaprove(id);

                Notifier.Success("Barter rejected");
                DataBind();
            }
            else if (String.Equals(e.CommandName, "Sort"))
            {
                if (AdminBarterVL.SortExpression == e.CommandArgument.ToString() &&
                    AdminBarterVL.SortDirection == SortDirection.Ascending)
                {
                    AdminBarterVL.Sort(e.CommandArgument.ToString() + "DESC"
                         , SortDirection.Descending);
                }
                else
                {
                    AdminBarterVL.Sort(e.CommandArgument.ToString()
                    , SortDirection.Ascending);
                }
            }

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<BarterSystem.WebForms.Models.BarterViewModel> AdminBarterVL_GetData()
        {
            return data.Advertisments.All().Select(x => new BarterViewModel()
            {
                Id = x.Id,
                Content = x.Content,
                Status = x.Status,
                CategoryId = x.CategoryId,
                Title = x.Title,
                UserName = x.User.UserName
            });
        }


        // The id parameter name should match the DataKeyNames value set on the control
        public void AdminBarterVL_UpdateItem(int Id)
        {
            BarterSystem.WebForms.Models.BarterViewModel item = null;
            var itemData = data.Advertisments.Find(Id);
            if (itemData == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", Id));
                return;
            }
            item = new BarterViewModel()
            {
                Id = itemData.Id,
                Content = itemData.Content,
                Status = itemData.Status,
                CategoryId = itemData.CategoryId,
                Title = itemData.Title,
                UserName = itemData.User.UserName
            }; 
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                itemData.Content = item.Content;
                itemData.Status = item.Status;
                itemData.CategoryId = item.CategoryId;
                itemData.Title = item.Title;
                data.SaveChanges();
                AdminBarterVL.DataBind();
                Notifier.Success("Item updated");
            }
        }



    }
}