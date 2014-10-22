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


            if (String.Equals(e.CommandName, "Approve"))
            {
                //TODO optimize this
                var id = int.Parse(
                   AdminBarterVL.DataKeys[e.Item.DisplayIndex]
                   .Value.ToString());
                new BarterObjectData().Aprove(id);
                DataBind();
            }
            else if (String.Equals(e.CommandName, "Disapprove"))
            {
                var id = int.Parse(
                   AdminBarterVL.DataKeys[e.Item.DisplayIndex]
                   .Value.ToString());
                //TODO optimize this
                new BarterObjectData().Disaprove(id);
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
    }
}