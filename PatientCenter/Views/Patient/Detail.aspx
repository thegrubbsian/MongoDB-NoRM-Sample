<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<PatientCenter.Models.Patient>" %>

<asp:Content ContentPlaceHolderID="Body" runat="server">

    <h2><%= Model.ID == null ? "New" : "Edit" %> Patient</h2>

    <% using (Html.BeginForm("Save", "Patient", FormMethod.Post)) { %>

        <div class="field">
            <label>First Name</label>
            <%= Html.TextBox("patient.FirstName", Model.FirstName) %>
        </div>

        <div class="field">
            <label>Last Name</label>
            <%= Html.TextBox("patient.LastName", Model.LastName) %>
        </div>

        <div class="field">
            <label>DOB</label>
            <%= Html.TextBox("patient.DOB", Model.DOB) %>
        </div>

        <input type="submit" value="Save" />

    <% } %>

</asp:Content>
