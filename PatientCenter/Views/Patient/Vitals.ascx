<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PatientCenter.Models.Vitals>>" %>

<table id="vitals" class="listable">
    <thead>
        <tr>
            <th>Date Taken</th>
            <th>Height</th>
            <th>Weight</th>
            <th>Temperature</th>
        </tr>
    </thead>
    <tbody>
        <% var i = 0; foreach (var vitals in Model) { %>
        <tr>
            <td><%= Html.TextBox("patient.Vitals[" + i + "].DateTaken", vitals.DateTaken.ToShortDateString()) %></td>
            <td><%= Html.TextBox("patient.Vitals[" + i + "].Height", vitals.Height)%></td>
            <td><%= Html.TextBox("patient.Vitals[" + i + "].Weight", vitals.Weight)%></td>
            <td><%= Html.TextBox("patient.Vitals[" + i + "].Temperature", vitals.Temperature)%></td>
        </tr>
        <% i++; } %>
    </tbody>
    <tfoot>
        <tr>
            <td><%= Html.TextBox("footer_patient.Vitals[0].DateTaken", string.Empty)%></td>
            <td><%= Html.TextBox("footer_patient.Vitals[0].Height", string.Empty)%></td>
            <td><%= Html.TextBox("footer_patient.Vitals[0].Weight", string.Empty)%></td>
            <td><%= Html.TextBox("footer_patient.Vitals[0].Temperature", string.Empty)%></td>
        </tr>
    </tfoot>
</table>