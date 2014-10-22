namespace BarterSystem.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Security.Claims;
    using System.Threading.Tasks;
    
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;

    public class User : IdentityUser
    {
        private ICollection<Advertisment> advertisments;

        private ICollection<Category> skills;

        private ICollection<Comment> comments;
        
        public User()
        {
            this.advertisments = new HashSet<Advertisment>();
            this.skills = new HashSet<Category>();
            this.comments = new HashSet<Comment>();
        }

        [Required]
        [MinLength(3)]
        [MaxLength(30)]
        public string FirstName { get; set; }

        [Required]
        [MinLength(3)]
        [MaxLength(30)]
        public string LastName { get; set; }

        [Required]
        public string AvatarUrl { get; set; }

        [Required]
        public int Rating { get; set; }

        public virtual ICollection<Comment> Comments
        {
            get
            {
                return this.comments;
            }

            set
            {
                this.comments = value;
            }
        }

        public virtual ICollection<Advertisment> Advertisments
        {
            get
            {
                return this.advertisments;
            }

            set
            {
                this.advertisments = value;
            }
        }

        public virtual ICollection<Category> Skills
        {
            get
            {
                return this.skills;
            }

            set
            {
                this.skills = value;
            }
        }

        public ClaimsIdentity GenerateUserIdentity(UserManager<User> manager)
        {
            //// Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            //// Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }
}