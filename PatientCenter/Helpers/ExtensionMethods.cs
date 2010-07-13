using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace PatientCenter.Helpers {

    public static class ExtensionMethods {

        public static IEnumerable<SelectListItem> MakeSelectedList(
            this IEnumerable<SelectListItem> @this, string selectedValue) {
            return @this.Select(item => new SelectListItem {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedValue
            });
        }
    }
}