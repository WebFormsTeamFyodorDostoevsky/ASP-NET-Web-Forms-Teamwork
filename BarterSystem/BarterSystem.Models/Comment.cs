namespace BarterSystem.Models
{
    using System.ComponentModel.DataAnnotations;
    
    using BarterSystem.Models.Enums;

    public class Comment
    {
        public int Id { get; set; }

        [Required]
        public Feedback Feedback { get; set; }

        [Required]
        public string Content { get; set; }
    }
}