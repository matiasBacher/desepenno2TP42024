<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="formulario2.aspx.cs" Inherits="desepenno2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <form id="form1" runat="server">
        <asp:Panel ID="PanelMensaje" runat="server" CssClass="mb-3">
            <div class="alert alert-danger" role="alert">
                <asp:Label ID="mensajeLabel" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>

        <div class="input-group my-5">
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
        <asp:Button ID="Button1" runat="server" Text="Subir" OnClick="Button1_Click" CssClass="btn btn-outline-secondary"/>
        </div>
        <asp:GridView ID="GridViewArchivos" runat="server" AutoGenerateColumns="False"  CssClass="table table-striped mb-3" OnSelectedIndexChanged="GridViewArchivos_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="archivo" HeaderText="Nombre Archivo" />
                <asp:CommandField ShowSelectButton="True" ButtonType="Button"  >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="LabelDescargar" runat="server" Text="Sin Selección"></asp:Label>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Descargar" CssClass="btn btn-primary" />
    </form>
    </div>
</asp:Content>
