namespace BarterSystem.Data
{
    using System.Data.Entity;
    using BarterSystem.Data.Migrations;
    using BarterSystem.Models;
    using Microsoft.AspNet.Identity.EntityFramework;

    public class BarterSystemDbContext : IdentityDbContext<User>
    {
        public BarterSystemDbContext()
            : base("CloudConnection", throwIfV1Schema: false)
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<BarterSystemDbContext, Configuration>());
        }

        public static BarterSystemDbContext Create()
        {
            return new BarterSystemDbContext();
        }

        public IDbSet<Category> Categories { get; set; }

        public IDbSet<Advertisment> Advertisments { get; set; }

        public IDbSet<Comment> Comments { get; set; }
    }
}