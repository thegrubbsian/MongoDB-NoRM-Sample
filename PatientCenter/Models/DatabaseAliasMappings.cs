using Norm.Configuration;

namespace PatientCenter.Models {

    public class DatabaseAliasMappings : MongoConfigurationMap {

        public DatabaseAliasMappings() {

            For<Patient>(x => {
                x.ForProperty(p => p.FirstName).UseAlias("fnm");
                x.ForProperty(p => p.LastName).UseAlias("lnm");
                x.ForProperty(p => p.DOB).UseAlias("dob");
                x.ForProperty(p => p.Prescriptions).UseAlias("psc");
                x.ForProperty(p => p.Vitals).UseAlias("vtl");
            });

            For<Vitals>(x => {
                x.ForProperty(p => p.DateTaken).UseAlias("dt");
                x.ForProperty(p => p.Height).UseAlias("ht");
                x.ForProperty(p => p.Weight).UseAlias("wt");
                x.ForProperty(p => p.Temperature).UseAlias("tmp");
            });

            For<Prescription>(x => {
                x.ForProperty(p => p.DateIssued).UseAlias("dt");
                x.ForProperty(p => p.Count).UseAlias("ct");
                x.ForProperty(p => p.Medication).UseAlias("med");
                x.ForProperty(p => p.Refills).UseAlias("rfl");
            });
        }
    }
}