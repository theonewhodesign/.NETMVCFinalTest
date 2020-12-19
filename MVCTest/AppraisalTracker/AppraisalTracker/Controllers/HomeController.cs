using System.Linq;
using System.Web.Mvc;
using AppraisalTracker.Models;
using System.Web.Security;

namespace AppraisalTracker.Controllers
{
    public class HomeController : Controller
    {
        DBAppraisalContext db = new DBAppraisalContext();
        // GET: Home
        #region Login and Logout
        public ActionResult Login()
        {
            return View();
        }

        /// <summary>
        /// Method to check valid admin or not
        /// </summary>
        /// <param name="admin"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(Admin admin)
        {
            bool isValid = db.Admins.Any(x => x.Username == admin.Username && x.Password == admin.Password);
            if (isValid)
            {

                FormsAuthentication.SetAuthCookie(admin.Username, false);
                return RedirectToAction("Index", "Employee");
            }

            ModelState.AddModelError("", "Invalid username and password");
            return View();
        }

        /// <summary>
        /// Method to signout current admin
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
        #endregion
    }
}




