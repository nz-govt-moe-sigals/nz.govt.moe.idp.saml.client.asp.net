using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using nz.govt.moe.idp.saml.client.config;

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
            ViewBag.Message = "A secured page.";

            return View();
        }
        public ActionResult Signoff()
        {
            Response.Redirect("/Handlers/signoff.ashx");
            return View();
        } 
    }
}