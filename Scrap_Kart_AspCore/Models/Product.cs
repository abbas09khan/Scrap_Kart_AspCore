using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Scrap_Kart_AspCore.Models
{
    public class Product
    {
        [Key]
        public int PID { get; set; }

        [Required]
        [RegularExpression(@"[A-Za-z .]{3,100}", ErrorMessage = "Invalid ProductName Entered")]
        public string ProductName { get; set; }

        [Required]
        public int Price { get; set; } = 0;

        [Required]
        public int Quantity { get; set; } = 0;

        [RegularExpression(@"[A-Za-z .,/_-]{0,50}", ErrorMessage = "Invalid Charecter Entered in Category")]
        public string Category { get; set; } = "Default";

        [RegularExpression(@"[A-Za-z .,/_-]{0,50}", ErrorMessage = "Invalid Charecter Entered in Brand")]
        public string Brand { get; set; } = "No Brand";

        [RegularExpression(@"[A-Za-z .,/_-]{0,500}", ErrorMessage = "Invalid Charecter Entered in Product description")]
        public string Description { get; set; } = "No Description";

        public int UID { get; set; }

        public DateTime AddedOn { get; set; } = DateTime.Now;
        [NotMapped]
        public string ImageUrl { get; set; } = "/img/packing128.png";


    }
}
