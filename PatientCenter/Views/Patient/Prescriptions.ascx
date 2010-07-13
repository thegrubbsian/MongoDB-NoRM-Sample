<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PatientCenter.Models.Prescription>>" %>
<%@ Import Namespace="PatientCenter.Helpers" %>

<% var meds = (IEnumerable<SelectListItem>) ViewData["medications"]; %>

<table id="prescriptions" class="listable">
    <thead>
        <tr>
            <th>Date Issued</th>
            <th>Medication</th>
            <th>Count</th>
            <th>Refills</th>
        </tr>
    </thead>
    <tbody>
        <% var i = 0; foreach (var prescription in Model) { %>
        <tr>
            <td><%= Html.TextBox("patient.Prescriptions[" + i + "].DateIssued", prescription.DateIssued.ToShortDateString()) %></td>
            <td><%= Html.DropDownList("patient.Prescriptions[" + i +"].MedicationID", 
                    meds.MakeSelectedList(prescription.MedicationID)) %></td>
            <td><%= Html.TextBox("patient.Prescriptions[" + i + "].Count", prescription.Count) %></td>
            <td><%= Html.TextBox("patient.Prescriptions[" + i + "].Refills", prescription.Refills) %></td>
        </tr>
        <% i++; } %>
    </tbody>
    <tfoot>
        <tr>
            <td><%= Html.TextBox("footer_patient.Prescriptions[0].DateIssued", string.Empty) %></td>
            <td><%= Html.DropDownList("footer_patient.Prescriptions[0].MedicationID", meds) %></td>
            <td><%= Html.TextBox("footer_patient.Prescriptions[0].Count", string.Empty)%></td>
            <td><%= Html.TextBox("footer_patient.Prescriptions[0].Refills", string.Empty)%></td>
        </tr>
    </tfoot>
</table>