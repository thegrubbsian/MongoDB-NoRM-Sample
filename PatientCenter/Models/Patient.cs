using System;
using System.Collections.Generic;
using System.Linq;
using Norm;
using Norm.Attributes;

namespace PatientCenter.Models {

    public class Patient {

        public ObjectId ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DOB { get; set; }
        
        private List<Vitals> _vitals = new List<Vitals>();
        public List<Vitals> Vitals {
            get { return _vitals; }
            set { _vitals = value; }
        }

        private List<Prescription> _prescriptions = new List<Prescription>();
        public List<Prescription> Prescriptions {
            get { return _prescriptions; }
            set { _prescriptions = value; }
        }

        private List<string> _conditions = new List<string>();
        public List<string> Conditions {
            get { return _conditions; }
            set { _conditions = value; }
        }

        [MongoIgnore]
        public Vitals RecentVitals {
            get {
                return _vitals.Count == 0 ? new Vitals() : 
                    _vitals.OrderByDescending(x => x.DateTaken).First();
            }
        }

        [MongoIgnore]
        public int Age {
            get { return DateTime.Now.Year - DOB.Year; }
        }
    }
}