using BarterSystem.Data;
using BarterSystem.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarterSystem.WebForms.Barter
{
    public partial class CommentForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var itemNames = System.Enum.GetNames(typeof(BarterSystem.Models.Enums.Feedback));
            var sorted = itemNames.ToList().OrderByDescending(a => a);
            this.FeedbackType.DataSource = sorted;
            Page.DataBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            var barterId = int.Parse(Request.QueryString["id"]);
            var uow = new BarterSystemData();
            var commentedBarter = uow.Advertisments.Find(barterId);
            commentedBarter.Status = Status.Done;
            uow.SaveChanges();
        }
    }
}