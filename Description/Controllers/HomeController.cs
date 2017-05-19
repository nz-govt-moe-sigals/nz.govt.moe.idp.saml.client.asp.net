using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ServiceProviderMVC.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            ViewBag.Message = "An unsecured page.";

            return View();
        }

        public ActionResult Background()
        {
            ViewBag.Message = "An unsecured page.";

            return View();
        }

        public ActionResult Setup()
        {
            ViewBag.Message = "An unsecured page.";

            return View();
        }

        public ActionResult Secured()
        {
            ViewBag.Message = "Your secured page.";

            return View();
        }
    }
}