using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Scrap_Kart_AspCore.Database;
using Scrap_Kart_AspCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Scrap_Kart_AspCore.Controllers
{
    public class OrdersController : Controller
    {
        private readonly MyDBContext _context;

        public OrdersController(MyDBContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            
            return View();
        }
        public ActionResult MyOrders()
        {
            string id = "";
            try
            {
                id = HttpContext.Session.GetString("UID");
                ViewBag.UID = id;
                List<Order> orders = _context.Orders.Where(x => x.UID == int.Parse(id)).ToList();

                getOrderInfosByOrders(orders);

                //int[] OIDs = orders.Select(x => x.OID).ToArray();

                //var temp = (from oi in _context.OrderInfo
                //            join p in _context.Products
                //              on oi.PID equals p.PID
                //            where OIDs.Contains(oi.OID)
                //            orderby oi.OIID descending
                //            select new { oi.OIID, oi.OID, oi.OrderedQuantity, oi.PID, oi.Price, oi.TotalPrice, p.ProductName }).ToList();




                //foreach (var order in orders)
                //{
                //    order.OrderInfos = _context.OrderInfo.Where(x => OIDs.Contains(x.OID)).ToList();
                //}

                return View(orders);
            }
            catch (Exception)
            {

                return View("Login");
            }

            
        }


        public ActionResult MySaleRecords()
        {


            List<OrderInfo> orderInfos = new List<OrderInfo>();
           
            

            try
            {
                int id = int.Parse(HttpContext.Session.GetString("UID"));

                var Pids = _context.Products.Where(x => x.UID.Equals(id)).Select(x => x.PID).ToArray();
                ViewBag.UID = id;

                var temp = (from oi in _context.OrderInfo
                            join p in _context.Products
                              on oi.PID equals p.PID
                            orderby oi.OIID descending
                            select new { oi.OIID, oi.OID, oi.OrderedQuantity, oi.PID, oi.Price, oi.TotalPrice, p.ProductName }).ToList();

                foreach (var item in temp)
                {
                    orderInfos.Add(new OrderInfo()
                    {
                        OID = item.OID,
                        OIID = item.OIID,
                        OrderedQuantity = item.OrderedQuantity,
                        ProductName = item.ProductName,
                        Price = item.Price,
                        TotalPrice = item.TotalPrice,
                        PID = item.PID
                    });
                }

                ViewBag.OID = orderInfos[0].OID.ToString();
                return View(orderInfos);
            }
            catch (Exception ex)
            {

                return View("Login","Users");
            }

           
        }
      public List<Order> getOrderInfosByOrders(List<Order>  orders)
        {

            int[] OIDs = orders.Select(x => x.OID).ToArray();

            List<OrderInfo> orderInfos = new List<OrderInfo>();
            var temp = (from oi in _context.OrderInfo
                        join p in _context.Products
                        on oi.PID equals p.PID
                        where OIDs.Contains(oi.OID)
                        orderby oi.OIID descending
                        select new { oi.OIID, oi.OID, oi.OrderedQuantity, oi.PID, oi.Price, oi.TotalPrice, p.ProductName }).ToList();
           
            foreach (var item in temp)
            {
                orderInfos.Add(new OrderInfo()
                {
                    OID = item.OID,
                    OIID = item.OIID,
                    OrderedQuantity = item.OrderedQuantity,
                    ProductName = item.ProductName,
                    Price = item.Price,
                    TotalPrice = item.TotalPrice,
                    PID = item.PID
                });
            }
            foreach (var order in orders)
            {
                order.OrderInfos = orderInfos.Where(x => x.OID == order.OID).ToList();
            }


            return orders;
        }

        // GET: OrdersController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        [HttpPost]
        // GET: OrdersController/Create
        public string PlaceOrder([FromBody] List<OrderInfo> orderInfos)
        {

            try
            {
                int id = int.Parse(HttpContext.Session.GetString("UID"));
                int BillAmount = orderInfos.Sum(x => x.TotalPrice);
                Order order = new Order() { BillAmount = BillAmount,UID=id };
                _context.Orders.Add(order);
                _context.SaveChanges();

                foreach (var item in orderInfos)
                {
                    item.OID = order.OID;
                }
                _context.OrderInfo.AddRange(orderInfos);
                _context.SaveChanges();
                order.OrderInfos = orderInfos;
                return "Success";
            }
            catch (Exception ex)
            {

                return "Error : " + ex.Message;
            }

        }

        // POST: OrdersController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: OrdersController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: OrdersController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: OrdersController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: OrdersController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
        public ActionResult OrderSuccess( )
        {
            return View();
        }

    }
}
