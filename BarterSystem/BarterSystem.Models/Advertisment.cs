namespace BarterSystem.Models
{
    using System.ComponentModel.DataAnnotations;
    using BarterSystem.Models.Enums;
    using System;

    public class Advertisment
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        public DateTime CreationDate { get; set; }

        public string UserId { get; set; }

        public virtual User User { get; set; }

        public bool CommentedByUser { get; set; }

        public string AcceptUserId { get; set; }

        public virtual User AcceptUser { get; set; }

        public bool CommentedByAcceptUser { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        [Required]
        public Status Status { get; set; }

        public string ImageUrl { get; set; }
    }
}