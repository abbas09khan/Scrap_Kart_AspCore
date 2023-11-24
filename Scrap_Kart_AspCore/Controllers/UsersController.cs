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
    public class UsersController : Controller
    {
        private readonly MyDBContext db;

        public UsersController(MyDBContext context)
        {
            db = context;
        }

        // GET: Users
        public IActionResult Index()
        {
            return View(db.Users.ToList());
        }

        public IActionResult UserList()
        {
            var users = db.Users.Where(x => x.UserType != "Admin").ToList();
            return View(users);
        }
        // GET: Users/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await db.Users
                .FirstOrDefaultAsync(m => m.UID == id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        // GET: Users/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(User user)
        {
            if (ModelState.IsValid)
            {
                user.PWD = user.Mobile;

                db.Add(user);
                await db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(user);
        }

        // GET: Users/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await db.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, User user)
        {
            if (id != user.UID)
            {
                return NotFound();
            }

            var ExistingUser = db.Users.Find(id);
            if (ExistingUser == null) return NotFound();


            ExistingUser.UserName = user.UserName;
            ExistingUser.Email = user.Email;
            ExistingUser.Mobile = user.Mobile;

            ExistingUser.Address = user.Address;

            db.SaveChanges();

            return View("Profile", ExistingUser);
        }

        // GET: Users/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await db.Users
                .FirstOrDefaultAsync(m => m.UID == id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var user = await db.Users.FindAsync(id);
            db.Users.Remove(user);
            await db.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UserExists(int id)
        {
            return db.Users.Any(e => e.UID == id);
        }

        [Route("User/Login")]
        public IActionResult Login()
        {
            return View();

        }
        [HttpPost]
        [Route("User/Login")]
        public IActionResult Login(string Email, string PWD)
        {

            User ExistingUser = db.Users.FirstOrDefault(x => x.Email == Email && x.PWD == PWD);
            if (ExistingUser == null)
            {
                ViewBag.Error = "Invalid Credentials";
                return View();
            }


            HttpContext.Session.SetString("UserType", ExistingUser.UserType);
            HttpContext.Session.SetString("UID", ExistingUser.UID.ToString());

            if (ExistingUser.UserType.Equals("Admin")) return RedirectToAction("UserList");
            return RedirectToAction("Profile");

        }

        [Route("AdminSearch")]
        public IActionResult AdminSearch(string Keyword)
        {

            List<User> Users = db.Users.Where(x => x.Email.Contains(Keyword) || x.UserName.Contains(Keyword) || x.Mobile.Contains(Keyword)).ToList();


            //HttpContext.Session.SetObjectAsJson("UserType", ExistingUser.UserType);

            return View("UserList", Users);

        }


        [HttpGet]
        [Route("User/Search")]

        public IActionResult Search(string Keyword = null)
        {
            ViewBag.Keyword = Keyword;
            List<User> Users = null;
            if (!string.IsNullOrEmpty(Keyword)) Users = db.Users.Where(x => x.Email.Contains(Keyword) || x.UserName.Contains(Keyword) || x.Mobile.Contains(Keyword) || x.UserName.Contains(Keyword)).ToList();
            else Users = Users = db.Users.ToList();

            return View(Users);

        }
        [Route("User/SignUp")]
        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]

        [Route("User/SignUp")]
        public async Task<IActionResult> SignUp(User user)
        {
            if (ModelState.IsValid)
            {

                var tempUser = db.Users.FirstOrDefault(x => x.Email.Equals(user.Email));
                if (tempUser != null) { ViewBag.Error = "Email Already Exist"; return View(user); }


                tempUser = db.Users.FirstOrDefault(x => x.Mobile.Equals(user.Mobile));
                if (tempUser != null) { ViewBag.Error = "Mobile Already Exist"; return View(user); }

                db.Add(user);
                int result = await db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View("Profile", user);
        }
        [Route("User/Profile")]
        public IActionResult Profile(int id = 0)
        {
            id = int.Parse( HttpContext.Session.GetString("UID"));
            ViewBag.UID = id;
            var user = db.Users.Find(id);
            return View(user);
        }
        [Route("User/ChangeStatus")]
        public IActionResult ChangeStatus(int id = 0)
        {
            var user = db.Users.Find(id);
            if (!user.Status.Equals("Approved")) user.Status = "Approved";
            else user.Status = "Rejected";

            db.SaveChanges();
            var users = db.Users.ToList();
            return View("UserList", users);
        }
        [Route("User/Document")]
        public IActionResult Document(int id = 0)
        {
            ViewBag.ID = id;
            ViewBag.Status = "None";
            return View();
        }
        [HttpPost]
        [Route("User/Document")]
        public IActionResult Document()
        {
            ViewBag.Status = "None";
            var file = Request.Form.Files[0];
            var ID = Request.Form["id"];
            if (file == null || file.Length == 0) return Content("file not selected");

            var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Documents\\" + ID + ".jpg");

            using (var stream = new FileStream(path, FileMode.OpenOrCreate))
            {
                file.CopyTo(stream);
                stream.Close();
                stream.Dispose();
            }
            ViewBag.ID = ID;
            ViewBag.Status = "Uploaded";
            return View("Document", new { id = ID });
        }

        [Route("User/DeleteFile")]
        public IActionResult DeleteFile(string ID)
        {
            var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Documents\\" + ID + ".jpg");
            if (System.IO.File.Exists(path)) System.IO.File.Delete(path);
            ViewBag.Status = "None";

            return RedirectToAction("Document", new { id = ID });// return View("Document", );
        }
        [Route("User/Logout")]
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("UserType");
            HttpContext.Session.Remove("UID");
            return View("Login");
        }
        public IActionResult ViewCard(int id = 0)
        {
            ViewBag.UID = id;
            ViewBag.User = db.Users.Find(id);
            return View();
        }
        public IActionResult VerifyUser()
        {
            return View();
        }
        [HttpPost]
        public IActionResult VerifyUser(User user)
        {
            ViewBag.IsExist = false;
            ViewBag.Status = "Pending";
            var tempUser = db.Users.FirstOrDefault(x => x.UserName.Equals(user.UserName) && x.Email.Equals(user.Email) && x.Mobile.Equals(user.Mobile));
            if (tempUser != null)
            {
                ViewBag.IsExist = true;

                ViewBag.Status = tempUser.Status;
            }

            return View();
        }
        public IActionResult PasswordChange()
        {
            ViewBag.UID = HttpContext.Session.GetString("UID");
            return View();
        }
        [HttpPost]
        public IActionResult PasswordChange(PasswordChange passwordChange)
        {

            if (passwordChange.NewPassword != passwordChange.RePassword)
            {
                ViewBag.Error = "New & confirm Password do not match.";
                return View();
            }
            string ExistingPassword = db.Users.Where(x => x.UID == passwordChange.UID).Select(x => x.PWD).FirstOrDefault();



            //ViewBag.Message = "Password Changed Successfully.";

            return View();
        }
    }
}
