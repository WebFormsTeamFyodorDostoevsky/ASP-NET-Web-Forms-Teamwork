namespace BarterSystem.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;

    using BarterSystem.Data.Repositories;
    using BarterSystem.Models;

    public class BarterSystemData : IBarterSystemData
    {
        private DbContext context;
        private IDictionary<Type, object> repositories;

        public BarterSystemData()
            : this(new BarterSystemDbContext())
        {
        }

        public BarterSystemData(DbContext context)
        {
            this.context = context;
            this.repositories = new Dictionary<Type, object>();
        }

        public IRepository<Category> Categories
        {
            get
            {
                return this.GetRepository<Category>();
            }
        }

        public IRepository<Advertisment> Advertisments
        {
            get
            {
                return this.GetRepository<Advertisment>();
            }
        }

         public IRepository<User> Users
         {
             get
             {
                 return this.GetRepository<User>();
             }
         }

        public int SaveChanges()
        {
            return this.context.SaveChanges();
        }

        private IRepository<T> GetRepository<T>() where T : class
        {
            var typeOfRepository = typeof(T);
            if (!this.repositories.ContainsKey(typeOfRepository))
            {
                var newRepository = Activator.CreateInstance(typeof(Repository<T>), this.context);
                this.repositories.Add(typeOfRepository, newRepository);
            }

            return (IRepository<T>)this.repositories[typeOfRepository];
        }
    }
}