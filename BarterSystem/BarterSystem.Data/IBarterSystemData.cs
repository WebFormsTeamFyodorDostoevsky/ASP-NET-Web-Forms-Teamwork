namespace BarterSystem.Data
{
    using BarterSystem.Data.Repositories;
    using BarterSystem.Models;

    public interface IBarterSystemData
    {
        IRepository<Category> Categories { get; }

        IRepository<Advertisment> Advertisments { get; }

        //// IRepository<User> Users { get; }

        int SaveChanges();
    }
}
