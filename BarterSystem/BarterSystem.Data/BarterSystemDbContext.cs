namespace BarterSystem.Data
{
    using System.Data.Entity;
    
    using BarterSystem.Data.Migrations;
    using BarterSystem.Models;

    public class BarterSystemDbContext : DbContext
    {
        public BarterSystemDbContext() 
            : base("BarterSystemConnectionSQLExpress")
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<BarterSystemDbContext, Configuration>());
        }

        public IDbSet<Category> Categories { get; set; }

        public IDbSet<Advertisment> Advertisments { get; set; }
    }
}