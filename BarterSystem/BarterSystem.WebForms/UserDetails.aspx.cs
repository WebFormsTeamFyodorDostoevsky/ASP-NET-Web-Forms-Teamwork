namespace BarterSystem.WebForms
{
    using System;
    using System.Globalization;
    using System.Linq;
    using System.Web.UI;

    using BarterSystem.Common;
    using BarterSystem.Data;
    using BarterSystem.WebForms.Controls.Notifier;
    using BarterSystem.WebForms.Models;

    public partial class UserDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.User == null || !this.User.Identity.IsAuthenticated)
            {
                Server.Transfer("~/Account/Login.aspx", true);
            }

            if (!this.Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    var data = new BarterSystemData();
                    var userId = Request.QueryString["id"];
                    var user = data.Users.All().Where(u => u.Id == userId).Select(UserViewModel.FromDataToModel).FirstOrDefault();
                    if (user == null)
                    {
                        Notifier.Warning("User not found");
                        Response.Redirect("~/Default.aspx", true);
                    }
                    else
                    {
                        this.Avatar.ImageUrl = GlobalConstants.ImagesPath + user.AvatarUrl;
                        this.Username.Text = Server.HtmlEncode(user.Username);
                        this.Name.Text = Server.HtmlEncode(string.Format("{0} {1}", user.FirstName, user.LastName));
                        this.NameHeader.Text = Server.HtmlEncode(string.Format("{0} {1}", user.FirstName, user.LastName));
                        this.Rating.Text = Server.HtmlEncode(user.Rating.ToString(CultureInfo.InvariantCulture));

                        this.Skills.DataSource = user.Skills;
                        this.Skills.DataBind();

                        this.Comments.DataSource = user.Comments;
                        this.Comments.DataBind();
                    }
                }
                else
                {
                    Notifier.Error("User not found");
                    Response.Redirect("~/Default.aspx", true);
                }
            }
        }
    }
}