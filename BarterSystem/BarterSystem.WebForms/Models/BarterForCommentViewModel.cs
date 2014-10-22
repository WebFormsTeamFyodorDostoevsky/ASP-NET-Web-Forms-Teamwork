using BarterSystem.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarterSystem.WebForms.Models
{
    public class BarterForCommentViewModel
    {
        public string UserName { get; set; }

        public string Title { get; set; }
        
        public string Content { get; set; }

        public DateTime CreationDate { get; set; }
        
        public int CategoryId { get; set; }
        
        public Status Status { get; set; }
        
        public string ImageUrl { get; set; }

        public int Id { get; set; }
    }
}