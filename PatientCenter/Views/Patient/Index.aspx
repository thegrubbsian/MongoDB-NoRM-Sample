<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<PatientCenter.Models.Patient>>" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <h2>Patients</h2>
    <div id="actions">
        <%= Html.ActionLink("New Patient", "Create", "Patient") %>
    </div>
</asp:Content>
 
<asp:Content ContentPlaceHolderID="Body" runat="server">

    <% if (Model.Count() == 0) { %>
    There are no patients in the system.
    <% } else { %>
    <% Html.RenderPartial("PatientList", Model); %>
    <% } %>

</asp:Content>