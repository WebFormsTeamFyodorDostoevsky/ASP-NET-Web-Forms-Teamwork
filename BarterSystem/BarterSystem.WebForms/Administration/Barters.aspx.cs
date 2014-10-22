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

namespace BarterSystem.WebForms.Administration
{
    public partial class Barters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated || !Roles.IsUserInRole("admin"))
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            var id = int.Parse(
                   AdminBarterVL.DataKeys[e.Item.DisplayIndex]
                   .Value.ToString());
            if (String.Equals(e.CommandName, "Approve"))
            {
                //TODO optimize this
                new BarterObjectData().Aprove(id);
                DataBind();
            }
            else if (String.Equals(e.CommandName, "Disapprove"))
            {
                //TODO optimize this
                new BarterObjectData().Disaprove(id);
                DataBind();
            }

        }
    }
}