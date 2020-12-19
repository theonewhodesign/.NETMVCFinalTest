using System.Web.Mvc;

namespace AppraisalTracker.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        /// <summary>
        /// Method to show pagenotfound when accessing different url
        /// </summary>
        /// <returns></returns>
        public ActionResult PageNotFound()
        {
            return View();
        }
    }
}