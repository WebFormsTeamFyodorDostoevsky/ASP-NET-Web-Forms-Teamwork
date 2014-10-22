namespace BarterSystem.WebForms.Barter
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;

    using BarterSystem.Data;
    using BarterSystem.Models;
    using BarterSystem.Models.Enums;
    using BarterSystem.WebForms.Models;
    public class BarterObjectData
    {
        private IBarterSystemData data;

        public BarterObjectData()
            : this(new BarterSystemData())
        { }

        public BarterObjectData(IBarterSystemData data)
        {
            this.data = data;
        }

        //TO DO: Make this efficient
        public ICollection<BarterViewModel> GetBarters(string OrderBy, int ObjectsPerPage, int StartIndex)
        {
            IQueryable<Advertisment> sortedData;
            bool isDesc = false;
            if (OrderBy.EndsWith("DESC"))
            {
                isDesc = true;
                OrderBy = OrderBy.Substring(0, OrderBy.Length - 5);
            }
            switch (OrderBy)
            {
                case "Id": sortedData = data.Advertisments.All().OrderBy(x => x.Id); break;
                case "Title": sortedData = data.Advertisments.All().OrderBy(x => x.Title); break;
                case "Content": sortedData = data.Advertisments.All().OrderBy(x => x.Content); break;
                case "Category": sortedData = data.Advertisments.All().OrderBy(x => x.Category.Name); break;
                case "Status": sortedData = data.Advertisments.All().OrderBy(x => x.Status.ToString()); break;
                default:
                    sortedData = data.Advertisments.All();
                    break;
            }

            var selectedStortedData = sortedData.Where(x => x.Status != Status.Deleted)
                //.Skip(StartIndex)
                //.Take(GetCount)
                .Select(x => new BarterViewModel()
                {
                    CategoryId = x.Category.Id,
                    Content = x.Content,
                    Title = x.Title,
                    Status = x.Status,
                    UserName = x.User.UserName,
                    Id = x.Id
                });
            if (isDesc)
            {
                //selectedStortedData = selectedStortedData.Reverse();
            }
            return selectedStortedData.ToList();
        }

        public void UpdateObject(BarterViewModel barterData)
        {
            var barter = data.Advertisments.Find(barterData.Id);
            barter.CategoryId = barterData.CategoryId;
            barter.Content = barterData.Content;
            barter.Title = barterData.Title;
            barter.Status = barterData.Status;
            data.Advertisments.Update(barter);
            data.SaveChanges();
        }
        public void InsertObject(BarterViewModel barterData)
        {
            var barter = new Advertisment();
            barter.CategoryId = barterData.CategoryId;
            barter.Content = barterData.Content;
            barter.Title = barterData.Title;
            barter.Status = barterData.Status;
            //TODO: handle unreliable user input
            barter.User = data.Users.All()
                .FirstOrDefault(x => x.UserName == barterData.UserName);
            data.Advertisments.Add(barter);
            data.SaveChanges();
        }
        public void DeleteObject(BarterViewModel barterData)
        {

            var barter = data.Advertisments.Find(barterData.Id);
            barter.Status = Status.Deleted;
            data.SaveChanges();
        }
        public void Aprove(int id)
        {
            var barter = data.Advertisments.Find(id);
            barter.Status = Status.Available;
            data.SaveChanges();
        }
        public void Disaprove(int id)
        {
            var barter = data.Advertisments.Find(id);
            barter.Status = Status.Disaproved;
            data.SaveChanges();
        }
    }
}