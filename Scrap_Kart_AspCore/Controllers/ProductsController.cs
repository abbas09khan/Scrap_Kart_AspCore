using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Scrap_Kart_AspCore.Database;
using Scrap_Kart_AspCore.Models;

namespace Scrap_Kart_AspCore.Controllers
{
    public class ProductsController : Controller
    {
        private readonly MyDBContext _context;

        public ProductsController(MyDBContext context)
        {
            _context = context;
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
            var products = await _context.Products.ToListAsync();
            foreach (var product in products)
            {
                if (System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Products\\" + product.PID + ".jpg")))
                    product.ImageUrl = "/Products/" + product.PID + ".jpg";
            }
            return View(products);
        }

        public async Task<IActionResult> Search()
        {
            var products = await _context.Products.ToListAsync();
            foreach (var product in products)
            {
                if (System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Products\\" + product.PID + ".jpg")))
                    product.ImageUrl = "/Products/" + product.PID + ".jpg";
            }
            return View(products);
        }

        public JsonResult SearchProducts(string Keyword)
        {
            List<Product> products = new List<Product>();
            products = _context.Products.Where(x => x.ProductName.Contains(Keyword)).ToList();
            if (string.IsNullOrEmpty(Keyword))   products = _context.Products.ToList(); ;
            foreach (var product in products)
            {
                if (System.IO.File.Exists(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Products\\" + product.PID + ".jpg")))
                    product.ImageUrl = "/Products/" + product.PID + ".jpg";
            }
            //if(string.IsNullOrEmpty(Keyword)) return Json(products);
            
            return Json(products);
            
        }
        // GET: Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.PID == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( Product product)
        {
            var UID = int.Parse( HttpContext.Session.GetString("UID"));
            product.UID = UID;
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();

                if (Request.Form.Files.Count > 0)
                {
                    var file = Request.Form.Files[0];
                    var ID = product.PID;
                    if (file == null || file.Length == 0) return Content("file not selected");

                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Products\\" + ID + ".jpg");

                    using (var stream = new FileStream(path, FileMode.OpenOrCreate))
                    {
                        file.CopyTo(stream);
                        stream.Close();
                        stream.Dispose();
                    }
                }









                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,Product product)
        {
            if (id != product.PID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();

                    if (Request.Form.Files.Count > 0)
                    {
                        var file = Request.Form.Files[0];
                        var ID = product.PID;
                        if (file == null || file.Length == 0) return Content("file not selected");

                        var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Products\\" + ID + ".jpg");

                        using (var stream = new FileStream(path, FileMode.OpenOrCreate))
                        {
                            file.CopyTo(stream);
                            stream.Close();
                            stream.Dispose();
                        }
                    }
                    




                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.PID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.PID == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Products.FindAsync(id);
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.PID == id);
        }
        
        public IActionResult PointOfSale()
        {
            return View();
        }

    }
}
