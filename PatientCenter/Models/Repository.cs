using System;
using System.Collections.Generic;
using System.Linq;
using Norm;

namespace PatientCenter.Models {

    public class Repository<T> {

        public IEnumerable<T> All() {
            return Read(db => db.GetCollection<T>().Find());
        }

        public IEnumerable<T> Where(Func<T, bool> predicate) {
            return Read(db => db.GetCollection<T>().Find().Where(predicate));
        }

        public T SingleOrDefault(Func<T, bool> predicate) {
            return ReadOne(db => db.GetCollection<T>().Find().SingleOrDefault(predicate));
        }

        public void Save(T entity) {
            Write(db => db.GetCollection<T>().Save(entity));
        }

        public void Delete(T entity) {
            Write(db => db.GetCollection<T>().Delete(entity));
        }

        private static Mongo GetConnection() {
            return new Mongo("PatientCenterSample", "localhost", "27017", null);
        }

        private static IEnumerable<T> Read(Func<Mongo, IEnumerable<T>> action) {
            using (var db = GetConnection()) { return action(db); }
        }

        private static T ReadOne(Func<Mongo, T> action) {
            using (var db = GetConnection()) { return action(db); }
        }

        private static void Write(Action<Mongo> action) {
            using (var db = GetConnection()) { action(db); }
        }
    }
}