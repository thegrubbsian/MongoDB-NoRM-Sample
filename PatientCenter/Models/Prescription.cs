using System;
using Norm;

namespace PatientCenter.Models {

    public class Prescription {

        public DateTime DateIssued { get; set; }
        public ObjectId MedicationID { get; set; }
        public int Count { get; set; }
        public int Refills { get; set; }
    }
}