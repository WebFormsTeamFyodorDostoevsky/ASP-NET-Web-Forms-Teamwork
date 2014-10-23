namespace BarterSystem.WebForms.Account
{
    using System;
    using System.Drawing;
    using System.IO;
    using System.Linq;
    using System.Net;
    using System.Web.UI;

    using BarterSystem.Common;
    using BarterSystem.Data;
    using BarterSystem.WebForms.Controls.Notifier;

    using Microsoft.AspNet.Identity;

    public partial class ChangeAvatar : Page
    {
        private readonly BarterSystemData data = new BarterSystemData();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                var userId = User.Identity.GetUserId();
                var userAvatar = this.data.Users.All().Where(u => u.Id == userId).Select(u => u.AvatarUrl).First();
                this.Avatar.ImageUrl = "~/Imgs/" + userAvatar;

                // TODO: remove after extracting
                this.ContentLength = 1024000;
            }
        }

        protected void ButtonUpload_OnClick(object sender, EventArgs e)
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

        protected void ButtonUploadFromUrl_OnClick(object sender, EventArgs e)
        {
            var imageUrl = this.ImageUploadUrl.Text;

            var imageName = Guid.NewGuid().ToString();
            var filePath = Server.MapPath(GlobalConstants.ImagesPath + imageName);
            string extension;

            try
            {
                extension = this.DownloadRemoteImageFile(imageUrl, filePath);
            }
            catch (Exception error)
            {
                Notifier.Error(error.Message);
                return;
            }

            imageName = imageName + '.' + extension;

            this.Avatar.ImageUrl = GlobalConstants.ImagesPath + imageName;

            var userId = this.User.Identity.GetUserId();
            var user = this.data.Users.Find(userId);
            if (user.AvatarUrl != GlobalConstants.DefaultUserAvatar)
            {
                var oldAvatarPath = Server.MapPath(GlobalConstants.ImagesPath + user.AvatarUrl);
                File.Delete(oldAvatarPath);
            }

            user.AvatarUrl = imageName;

            this.data.Users.Update(user);
            this.data.SaveChanges();

            Notifier.Success("Image saved");
        }

        private string DownloadRemoteImageFile(string uri, string fileName)
        {
            var request = (HttpWebRequest)WebRequest.Create(uri);
            var response = (HttpWebResponse)request.GetResponse();

            // Check that the remote file was found. The ContentType
            // check is performed since a request for a non-existent
            // image file might be redirected to a 404-page, which would
            // yield the StatusCode "OK", even though the image was not
            // found.
            if ((response.StatusCode == HttpStatusCode.OK || response.StatusCode == HttpStatusCode.Moved
                 || response.StatusCode == HttpStatusCode.Redirect)
                && response.ContentType.StartsWith("image", StringComparison.OrdinalIgnoreCase))
            {
                // if the remote file was found, download it
                var extension = response.ContentType.Substring(response.ContentType.LastIndexOf('/') + 1);
                fileName = fileName + '.' + extension;
                using (Stream inputStream = response.GetResponseStream())
                using (Stream outputStream = File.OpenWrite(fileName))
                {
                    var buffer = new byte[4096];
                    int bytesRead;
                    do
                    {
                        bytesRead = inputStream.Read(buffer, 0, buffer.Length);
                        outputStream.Write(buffer, 0, bytesRead);
                    }
                    while (bytesRead != 0);

                    return extension;
                }
            }
            else
            {
                throw new Exception("URL doesn't contain image file");
            }
        }

        public decimal ContentLength { get; set; }
    }
}