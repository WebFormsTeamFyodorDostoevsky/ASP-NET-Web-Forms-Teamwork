namespace BarterSystem.WebForms.Account
{
    using System;
    using System.IO;
    using System.Linq;
    using System.Web.UI;

    using BarterSystem.Common;
    using BarterSystem.Data;
    using BarterSystem.WebForms.Controls.Notifier;

    using Microsoft.AspNet.Identity;

    public partial class ChangeAvatar : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var data = new BarterSystemData();
            var userId = User.Identity.GetUserId();
            var userAvatar = data.Users.All().Where(u => u.Id == userId).Select(u => u.AvatarUrl).First();
            this.Avatar.ImageUrl = "~/Imgs/" + userAvatar;


        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (this.FileUploadAvatar.HasFile)
            {
                try
                {

                    if (this.FileUploadAvatar.PostedFile.ContentLength > 1024000)
                    {
                        Notifier.Error("File has to be less than 1MB");
                    }
                    else
                    {
                        Stream fs = FileUploadAvatar.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs);
                        Byte[] bytesPhoto = br.ReadBytes((Int32)fs.Length);
                        string base64String = Convert.ToBase64String(bytesPhoto, 0, bytesPhoto.Length);
                        this.Avatar.ImageUrl = "data:image/png;base64," + base64String;
                        string fileName = this.FileUploadAvatar.PostedFile.FileName;
                        var fileExtension = fileName.Substring(fileName.LastIndexOf('.'));
                        var newName = Guid.NewGuid() + fileExtension;
                        this.FileUploadAvatar.SaveAs(Server.MapPath(GlobalConstants.ImagesPath + newName));

                        var data = new BarterSystemData();
                        var userId = User.Identity.GetUserId();
                        var user = data.Users.Find(userId);
                        if (user.AvatarUrl != GlobalConstants.DefaultUserAvatar)
                        {
                            var oldAvatarPath = Server.MapPath(GlobalConstants.ImagesPath + user.AvatarUrl);
                            File.Delete(oldAvatarPath);
                        }

                        user.AvatarUrl = newName;

                        data.Users.Update(user);
                        data.SaveChanges();
                        Notifier.Success("Image updated successfully");
                    }
                }
                catch (Exception exception)
                {
                    Notifier.Error(exception.Message);
                }
            }
        }
    }
}