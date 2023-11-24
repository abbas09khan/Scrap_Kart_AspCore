using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Scrap_Kart_AspCore.Models
{
    public class Order
    {
        [Key]
        public int OID { get; set; }


        [Required]
        public DateTime OrderDate { get; set; } = DateTime.Now;
        [Required]

        public int BillAmount { get; set; }
        public int UID { get; set; } = 1;

        [NotMapped]
        public List<OrderInfo> OrderInfos { get; set; }


    }
}
