using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Scrap_Kart_AspCore.Models
{
    public class OrderInfo 
    {
        [Key]
        public int OIID { get; set; }
        
        [Required]
        public int PID { get; set; }
        [Required]

        [Column("Quantity")]
        public int OrderedQuantity { get; set; } = 0;
        public int Price { get; set; } = 0;
        public int TotalPrice { get; set; } = 0;

        public int OID { get; set; } = 0;
        [NotMapped]
        public string ProductName { get; set; }

        
    }
}
