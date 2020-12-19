using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AppraisalTracker.Models;
using System.Data.Entity;

namespace AppraisalTracker.Controllers
{
    [Authorize]
    public class EmployeeController : Controller
    {
        DBAppraisalContext db = new DBAppraisalContext();

        /// <summary>
        /// Method to display all employee list
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Index()
        {
            return View(db.Employees.ToList());
        }

        #region Create employee
        /// <summary>
        /// create new employee
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// Method to create new employee
        /// </summary>
        /// <param name="employee"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                var emp = new Employee()
                {
                    EmpName = employee.EmpName.Trim(),
                    Contact = employee.Contact,
                    JoinDate = employee.JoinDate,
                    Salary = employee.Salary,
                    TotalExperience = employee.TotalExperience,
                    AppraisalDate = employee.JoinDate
                };
                db.Employees.Add(emp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }
        #endregion

        #region Upcoming appraisal
        /// <summary>
        /// Method used to show upcoming appraisal for both newly joined as well as previous joined employees
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Upcoming()
        {
            List<Employee> employee = db.Employees.Where(x => (DateTime.Now.Year - x.AppraisalDate.Year) == 1).ToList();
            return View(employee);
        }

        #endregion

        #region Appraisal
        /// <summary>
        /// Selecting employee by ID & creating new appraisal
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AddAppraisal(int id)
        {
            Employee employee = db.Employees.Single(x => x.ID == id);
            Appraisal appraisal = new Appraisal()
            {
                EmployeeID = employee.ID,
                EmpName = employee.EmpName,
                OLDSalary = employee.Salary
            };
            return View(appraisal);
        }


        /// <summary>
        /// Method to create new appraisal as well update the current salary in employee
        /// </summary>
        /// <param name="appraisal"></param>
        /// <param name="Increment"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PostAppraisal(Appraisal appraisal, int Increment)
        {
            if (appraisal.ID == 0)
            {
                int newSalary = appraisal.OLDSalary + Increment;
                Appraisal objAppraisal = new Appraisal()
                {
                    EmployeeID = appraisal.EmployeeID,
                    EmpName = appraisal.EmpName,
                    Description = appraisal.Description,
                    OLDSalary = appraisal.OLDSalary,
                    NewSalary = newSalary
                };
                db.Appraisals.Add(objAppraisal);
                db.SaveChanges();

                Employee employee = db.Employees.Find(appraisal.EmployeeID);
                {
                    employee.Salary = objAppraisal.NewSalary;
                    employee.AppraisalDate = employee.AppraisalDate.AddYears(1);
                }

                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");
        }

        /// <summary>
        /// Method used to get the appraisal list and searching by employee name
        /// </summary>
        /// <param name="empName"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AppraisalList(string empName)
        {
            return View(db.Appraisals.Where(x => x.EmpName.Contains(empName) || empName == null).ToList());
        }
        #endregion
    }
}