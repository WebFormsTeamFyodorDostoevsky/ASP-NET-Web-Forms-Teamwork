namespace BarterSystem.Models
{
    using System.ComponentModel.DataAnnotations;
    using BarterSystem.Models.Enums;

    public class Advertisment
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        public string UserId { get; set; }

        public User User { get; set; }

        public string AcceptUserId { get; set; }

        public User AcceptUser { get; set; }

        public int CategoryId { get; set; }

        public Category Category { get; set; }

        [Required]
        public Status Status { get; set; }
    }
}