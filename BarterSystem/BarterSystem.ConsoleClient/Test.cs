namespace BarterSystem.ConsoleClient
{
    using System.Linq;
    using BarterSystem.Data;

    public class Test
    {
        public static void Main()
        {
            var dbContext = new BarterSystemData();
            dbContext.Advertisments.All().Any();
        }
    }
}
