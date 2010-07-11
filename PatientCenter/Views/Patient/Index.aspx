<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<PatientCenter.Models.Patient>>" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <h2>All Patients</h2>
    <div id="actions">
        <%= Html.ActionLink("New Patient", "Create", "Patient") %>
    </div>
</asp:Content>
 
<asp:Content ContentPlaceHolderID="Body" runat="server">

    <table>
        <thead>
            <tr>
                <th>Last Name</th>
                <th>First Name</th>
                <th>DOB</th>
                <th>Age</th>
                <th>Height</th>
                <th>Weight</th>
                <th>Temperature</th>
                <th>Prescriptions</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var patient in Model) { %>
            <tr>
                <td><%: patient.LastName %></td>
                <td><%: patient.FirstName %></td>
                <td><%: patient.DOB.ToShortDateString() %></td>
                <td><%: patient.Age %></td>
                <td><%: patient.RecentVitals.Height %></td>
                <td><%: patient.RecentVitals.Weight %></td>
                <td><%: patient.RecentVitals.Temperature %></td>
                <td><%: patient.Prescriptions.Count %></td>
                <td><%= Html.ActionLink("Edit", "Edit", new { id = patient.ID }, null) %></td>
                <td><%= Html.ActionLink("Delete", "Delete", new { id = patient.ID }, null) %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

</asp:Content>
