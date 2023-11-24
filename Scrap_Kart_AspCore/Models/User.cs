using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Scrap_Kart_AspCore.Models
{
    public class User
    {
        [Key]
        public int UID { get; set; }
        [Required]
        [RegularExpression(@"[A-Za-z .]{3,50}", ErrorMessage = "Invalid UserName Entered")]
        public string UserName { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]

        public string PWD { get; set; }

        [NotMapped]
        public string REPWD { get; set; }

        [Required]
        [RegularExpression(@"[6789]{1}[0-9]{9}", ErrorMessage = "Invalid Mobile Number Entered")]
        public string Mobile { get; set; }
       
        public string Address { get; set; }

       public string Status { get; set; } = "Pending";
        public string UserType { get; set; } = "User";
       

    }
    public class PasswordChange
    {
        [Key]
        public int PID { get; set; }
        public int UID { get; set; } = 1;
        [Required]
        public string OldPassword { get; set; }

        [Required]
        public string NewPassword { get; set; }

        [Required]
        public string RePassword { get; set; }

    }
}
