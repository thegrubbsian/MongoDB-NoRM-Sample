using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Norm;
using PatientCenter.Models;

namespace PatientCenter.Controllers {

    public class PatientController : Controller {

        private readonly Repository<Patient> _patientRepo = new Repository<Patient>();
        private readonly Repository<Medication> _medicationRepo = new Repository<Medication>();

        public ActionResult Index() {
            var patients = _patientRepo.All()
                .OrderBy(x => x.LastName).ThenBy(x => x.FirstName);
            return View(patients);
        }

        [HttpGet]
        public ActionResult Create() {
            ViewData["medications"] = GetMedicationListItems();
            return View("Detail", new Patient());
        }

        [HttpPost]
        public ActionResult Save(Patient patient) {
            if (patient.Conditions.Count > 0)
                patient.Conditions = patient.Conditions[0].Split(",".ToCharArray()).ToList();
            _patientRepo.Save(patient);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(ObjectId id) {
            var patient = _patientRepo.SingleOrDefault(x => x.ID == id);
            ViewData["medications"] = GetMedicationListItems();
            return View("Detail", patient);
        }

        public ActionResult Delete(ObjectId id) {
            var patient = _patientRepo.SingleOrDefault(x => x.ID == id);
            _patientRepo.Delete(patient);
            return RedirectToAction("Index");
        }

        private IEnumerable<SelectListItem> GetMedicationListItems() {
            return _medicationRepo.All().OrderBy(x => x.Name)
                .Select(x => new SelectListItem { Text = x.Name, Value = x.ID });
        }
    }
}