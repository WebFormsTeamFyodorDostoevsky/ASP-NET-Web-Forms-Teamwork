namespace BarterSystem.Models
{
    using System.ComponentModel.DataAnnotations;

    using BarterSystem.Models.Enums;

    public class Advertisment
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        //// public int UserId { get; set; }

        //// public User User { get; set; }

        public int CategoryId { get; set; }

        public Category Category { get; set; }

        [Required]
        public Status Status { get; set; }
    }
}