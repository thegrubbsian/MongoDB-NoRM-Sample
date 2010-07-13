using System;

namespace PatientCenter.Models {

    public class Vitals {

        public DateTime DateTaken { get; set; }
        public string Height { get; set; }
        public int Weight { get; set; }
        public string Temperature { get; set; }
    }
}