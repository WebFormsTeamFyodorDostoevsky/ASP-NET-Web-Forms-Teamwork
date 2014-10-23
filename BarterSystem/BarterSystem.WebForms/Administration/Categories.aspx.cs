using BarterSystem.Data;
using BarterSystem.Models;
using BarterSystem.WebForms.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using BarterSystem.WebForms.Controls.Notifier;
namespace BarterSystem.WebForms.Administration
{
    public partial class Categories : System.Web.UI.Page
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

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<BarterSystem.WebForms.Models.CategoryViewModel> CategoryLV_GetData(string sortByExpression)
        {
            var viewData =data.Categories.All().Select(x => new CategoryViewModel()
            {
                Id = x.Id,
                Name = x.Name
            });
            if (sortByExpression=="Name")
            {
                viewData = viewData.OrderBy(x => x.Name);
            }
            else
            {
                viewData = viewData.OrderBy(x => x.Id);
            }
            return viewData;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CategoryLV_UpdateItem(int Id)
        {
            BarterSystem.WebForms.Models.CategoryViewModel item = null;
            var itemData = data.Categories.Find(Id);

            if (itemData == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", Id));
                return;
            }

            item = new CategoryViewModel()
            {
                Name = itemData.Name
            };
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                itemData.Name = item.Name;
                data.SaveChanges();
                Notifier.Success("Category changed");
            }
        }

        public void CategoryLV_InsertItem()
        {
            var item = new BarterSystem.WebForms.Models.CategoryViewModel();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                var itemData = new Category(){
                    Name = item.Name
                };
                data.Categories.Add(itemData);
                data.SaveChanges();
            }
        }

        protected void CreateCategory_Click(object sender, EventArgs e)
        {
            var itemData = new Category()
            {
                //TODO some validation would be nice
                Name = this.NewCategoryName.Text
            };
            this.NewCategoryName.Text="";
            data.Categories.Add(itemData);
            data.SaveChanges();
            CategoryLV.DataBind();
            Notifier.Success("Category created");
        }
    }
}