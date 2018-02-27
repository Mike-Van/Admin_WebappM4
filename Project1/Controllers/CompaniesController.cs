using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Project1.Models;

namespace Project1.Controllers
{
    public class CompaniesController : Controller
    {
        private WebAppEntities db = new WebAppEntities();

        // GET: Companies
        public ActionResult Index(int? page, string searchString, string currentFilter)
        {
            if (Session["UserId"] != null && Session["UserRole"].ToString() == "admin")
            {
                ViewBag.Message = TempData["Message"];
                ViewBag.Status = TempData["Status"];
                if (searchString != null)
                {
                    page = 1;
                }
                else
                {
                    searchString = currentFilter;
                }

                ViewBag.CurrentFilter = searchString;
                var comps = from c in db.Companies select c;

                if (!String.IsNullOrEmpty(searchString))
                {
                    comps = comps.Where(a => a.CompName.Contains(searchString));
                }

                //int pageSize = 2;
                int pageNum = (page ?? 1);
                var onePage = comps.OrderBy(i => i.CompId).ToPagedList(pageNum, 2);

                ViewBag.onePage = onePage;
                return View();
            }
            else if (Session["UserId"] != null && Session["UserRole"].ToString() != "admin")
            {
                TempData["Message"] = "You don't have enough privilege to do that";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }
            else
            {
                TempData["Message"] = "Please login first";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }

        }

        // GET: Companies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null || Session["UserId"] == null || Session["UserRole"].ToString() != "admin")
            {
                TempData["Message"] = "Please login as admin";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        public ActionResult Show(int? id)
        {
            if (id == null || Session["UserId"] == null || Session["UserRole"].ToString() != "admin")
            {
                return null;
            }
            var imageData = db.Companies.Find(id).CompImg;
            return File(imageData, "image/jpg");
        }

        // GET: Companies/Create
        public ActionResult Create()
        {
            if (Session["UserId"] == null)
            {
                TempData["Message"] = "Please login first";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }
            if (Session["UserRole"].ToString() != "admin")
            {
                TempData["Message"] = "You don't have enough privilege to do that";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }
            return View();
        }

        // POST: Companies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(Company company, HttpPostedFileBase image)
        {
            if (image != null)
            {
                company.CompImg = new byte[image.ContentLength];
                image.InputStream.Read(company.CompImg, 0, image.ContentLength);
            }
            db.Companies.Add(company);
            db.SaveChanges();
            return View(company);
        }

        // GET: Companies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["UserId"] == null || Session["UserRole"].ToString() != "admin")
            {
                TempData["Message"] = "Please login as admin";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            ViewBag.CompImg = company.CompImg;
            return View(company);
            

        }

        // POST: Companies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(Company company, HttpPostedFileBase image)
        {
            if (image != null)
            {
                company.CompImg = new byte[image.ContentLength];
                image.InputStream.Read(company.CompImg, 0, image.ContentLength);
            }
            db.Entry(company).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Companies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["UserId"] == null || Session["UserRole"].ToString() != "admin")
            {
                TempData["Message"] = "Please login as admin";
                TempData["Status"] = "warning";
                return RedirectToAction("Login", "Accounts");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
            
        }

        // POST: Companies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Company company = db.Companies.Find(id);
            db.Companies.Remove(company);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}
