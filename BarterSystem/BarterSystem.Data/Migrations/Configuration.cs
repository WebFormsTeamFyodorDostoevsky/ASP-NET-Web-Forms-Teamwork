namespace BarterSystem.Data.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;

    using BarterSystem.Models;

    using Microsoft.AspNet.Identity.EntityFramework;

    public sealed class Configuration : DbMigrationsConfiguration<BarterSystemDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(BarterSystemDbContext context)
        {
            this.SeedRoles(context);
            this.SeedCategories(context);
        }

        private void SeedCategories(BarterSystemDbContext context)
        {
            if (!context.Categories.Any())
            {
                context.Categories.Add(new Category { Name = "QA Engineer" });
                context.Categories.Add(new Category { Name = "Engineer" });
                context.Categories.Add(new Category { Name = "Lawyer" });
                context.Categories.Add(new Category { Name = "Auto Mechanic" });
                context.Categories.Add(new Category { Name = "Doctor" });
                context.Categories.Add(new Category { Name = "Plumber" });
                context.Categories.Add(new Category { Name = "Web Developer" });
                context.Categories.Add(new Category { Name = "Mobile Developer" });
                context.Categories.Add(new Category { Name = "Front-end Developer" });
                context.Categories.Add(new Category { Name = "Back-end Developer" });
            }
        }

        private void SeedRoles(BarterSystemDbContext context)
        {
            if (context.Roles.Any())
            {
                return;
            }

            foreach (var entity in context.Roles)
            {
                context.Roles.Remove(entity);
            }

            context.Roles.AddOrUpdate(new IdentityRole("admin"));
            context.Roles.AddOrUpdate(new IdentityRole("user"));
        }

       /* private void SeedAdmins(BarterSystemDbContext context)
        {
            context.Users.AddOrUpdate(new User { UserName = "admin@admin", Email = "admin@admin" });
        }*/
    }
}
