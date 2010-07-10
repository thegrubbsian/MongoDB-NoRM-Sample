using System.Web.Mvc;
using Norm;
using PatientCenter.Models;

namespace PatientCenter.Controllers {

    public class PatientController : Controller {

        private readonly Repository<Patient> _patientRepo = new Repository<Patient>();

        public ActionResult Index() {
            var patients = _patientRepo.All();
            return View(patients);
        }

        [HttpGet]
        public ActionResult Create() {
            return View("Detail", new Patient());
        }

        [HttpPost]
        public ActionResult Save(Patient patient) {
            _patientRepo.Save(patient);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(ObjectId id) {
            var patient = _patientRepo.SingleOrDefault(x => x.ID == id);
            return View("Detail", patient);
        }

        public ActionResult Delete(ObjectId id) {
            var patient = _patientRepo.SingleOrDefault(x => x.ID == id);
            _patientRepo.Delete(patient);
            return RedirectToAction("Index");
        }
    }
}