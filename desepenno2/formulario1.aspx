<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formulario1.aspx.cs" Inherits="desepenno2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Panel ID="PanelMensaje" runat="server" CssClass="mm-3">
     <div class="alert alert-success" role="alert">
         <asp:Label ID="mensajeLabel" runat="server" Text="Se ha registrado exitosamente"></asp:Label>
     </div>
 </asp:Panel>
    <form id="form1" runat="server" class="container" >
    <div class="mb-3">
        <asp:Label ID="LabelUser" runat="server" Text="Usuario" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="TextBoxUser" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidadorUser" runat="server" ControlToValidate="TextBoxUser" 
                    Display="Dynamic" ErrorMessage="Ingreso un usuario" CssClass="invalid-feedback"></asp:RequiredFieldValidator>

    </div>
     <div class="mb-3">
        <asp:Label ID="LabelCorreo" runat="server" Text="Correo" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="TextBoxCorreo" runat="server" CssClass="form-control"></asp:TextBox>
         <asp:RegularExpressionValidator ID="validadorCorreo" runat="server" ErrorMessage="Correo no válido" CssClass="invalid-feedback" Display="Dynamic" ControlToValidate="TextBoxCorreo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

    </div>
     <div class="mb-3">
         <asp:Label ID="LabelEdad" runat="server" Text="Edad" CssClass="form-label"></asp:Label>
         
         <asp:TextBox ID="TextBoxEdad" runat="server" TextMode="Number" CssClass="form-control" ControlToValidate="TextBoxEdad"></asp:TextBox>
         <asp:RangeValidator ID="validadorEdad" runat="server" ErrorMessage="Debe ser mayor a 16 años" MinimumValue="16" Display="Dynamic" CssClass="invalid-feedback" ControlToValidate="TextBoxEdad" Type="Integer" MaximumValue="200"> </asp:RangeValidator>
    </div>
     <div class="mb-3">
         <asp:Label ID="Label1" runat="server" Text="Contraseña" CssClass="form-label" ></asp:Label>
        <asp:TextBox ID="TextBoxContrasenna" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
          <asp:RegularExpressionValidator 
        ID="validadorLongitudContrasenna" 
        runat="server" 
        ControlToValidate="TextBoxContrasenna" 
        Display="Dynamic" 
        ErrorMessage="La contraseña debe tener al menos 8 caracteres" 
        CssClass="invalid-feedback" 
        ValidationExpression="^.{8,}$">
    </asp:RegularExpressionValidator>

    </div>
    <div class="mb-3">
         <asp:Label ID="Label2" runat="server" Text="Repite la contraseña" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="TextBoxContrasenna2" runat="server" TextMode="Password" CssClass="form-control" ControlToCompare="TextBoxContrasenna"></asp:TextBox>
        <asp:CompareValidator ID="validadorConIgual" runat="server" ErrorMessage="Las contraseñas no coinciden" CssClass="invalid-feedback" ControlToCompare="TextBoxContrasenna" ControlToValidate="TextBoxContrasenna2" Display="Dynamic"> </asp:CompareValidator>
    </div>
   <div class="mb-3">
               
        <asp:Button ID="ButtonRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary" OnClick="ButtonRegistrar_Click"/>

    </div>

</form>
</asp:Content>
