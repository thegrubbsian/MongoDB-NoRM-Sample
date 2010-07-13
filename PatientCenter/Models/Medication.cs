using Norm;

namespace PatientCenter.Models {

    public class Medication {

        public ObjectId ID { get; set; }
        public string Name { get; set; }
        public int Dosage { get; set; }
    }
}