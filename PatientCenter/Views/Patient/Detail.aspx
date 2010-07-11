<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<PatientCenter.Models.Patient>" %>

<asp:Content ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#prescriptions").listable();
            $("#vitals").listable();
        });
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <h2><%= Model.ID == null ? "New" : "Edit" %> Patient</h2>
    <div id="actions">
        <%= Html.ActionLink("Patient List", "Index") %>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="Body" runat="server">

    <% using (Html.BeginForm("Save", "Patient", FormMethod.Post)) { %>

        <%= Html.Hidden("patient.ID", Model.ID) %>

        <div class="field cell-3">
            <label>First Name</label>
            <%= Html.TextBox("patient.FirstName", Model.FirstName) %>
        </div>

        <div class="field cell-3">
            <label>Last Name</label>
            <%= Html.TextBox("patient.LastName", Model.LastName) %>
        </div>

        <div class="clear"></div>

        <div class="field">
            <label>DOB</label>
            <%= Html.TextBox("patient.DOB", Model.DOB.ToShortDateString()) %>
        </div>

        <fieldset>
            <legend>Vitals</legend>
            <% Html.RenderPartial("Vitals", Model.Vitals); %>
        </fieldset>
        
        <fieldset>
            <legend>Prescriptions</legend>
            <% Html.RenderPartial("Prescriptions", Model.Prescriptions); %>
        </fieldset>

        <input type="submit" value="Save" />

    <% } %>

</asp:Content>
