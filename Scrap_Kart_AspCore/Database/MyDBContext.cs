using Microsoft.EntityFrameworkCore;
using Scrap_Kart_AspCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Scrap_Kart_AspCore.Database
{
    public class MyDBContext : DbContext
    {
        public MyDBContext(DbContextOptions<MyDBContext> options) : base(options)
        {

        }
        public DbSet<User> Users { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderInfo> OrderInfo { get; set; }
         public DbSet<PasswordChange> PasswordChange { get; set; }

    }
}
