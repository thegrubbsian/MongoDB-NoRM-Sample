conn = new Mongo("localhost");
db = conn.getDB("PatientCenterSample");

db.Medication.save({ Name: "Ibuprofen", Dosage: 2000 });
db.Medication.save({ Name: "Humalog Insulin", Dosage: 1500 });
db.Medication.save({ Name: "Lipitor", Dosage: 200 });
db.Medication.save({ Name: "Prevacid", Dosage: 500 });
db.Medication.save({ Name: "Boniva", Dosage: 50 });
db.Medication.save({ Name: "Asprin", Dosage: 500 });

