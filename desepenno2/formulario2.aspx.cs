using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace desepenno2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string usuario;
        string carpetaArchivo;
      

        protected void Page_Load(object sender, EventArgs e)
        {
            PanelMensaje.Visible = false;
            if (this.Session["usuario"] != null)
            {
                this.usuario = Session["usuario"] as string;
                 this.carpetaArchivo = Server.MapPath("~/archivos");
                this.carpetaArchivo = Path.Combine(carpetaArchivo, this.usuario);

                if (!Directory.Exists(this.carpetaArchivo))
                {
                    Directory.CreateDirectory(this.carpetaArchivo);
                }
                this.CargarArchivos();
            }
            else
            {
                Response.Redirect("formulario1.aspx", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                string ruta =Path.Combine(this.carpetaArchivo, FileUpload1.FileName);
                FileUpload1.SaveAs(ruta);
                this.CargarArchivos();
            }
        }
        protected void CargarArchivos()
        {
            if (Directory.Exists(this.carpetaArchivo))
            {

                string[] archivos = Directory.GetFiles(carpetaArchivo);

                DataTable dt = new DataTable();
                dt.Columns.Add("Archivo");
                dt.Columns.Add("Descargar");

                foreach (string archivo in archivos)
                {
                    DataRow dr = dt.NewRow();
                    dr["archivo"] = Path.GetFileName(archivo);
                    dt.Rows.Add(dr);
                }

                GridViewArchivos.DataSource = dt;
                GridViewArchivos.DataBind();
            }
        }

     

        protected void GridViewArchivos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string archivoSelecionado = GridViewArchivos.Rows[GridViewArchivos.SelectedIndex].Cells[0].Text;
            LabelDescargar.Text=archivoSelecionado;

            ViewState["archivoSelecionado"] = archivoSelecionado;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            string archivoSelecionado= ViewState["archivoSelecionado"]==null?"": ViewState["archivoSelecionado"].ToString();
            if (!String.IsNullOrEmpty(archivoSelecionado))
            {
                PanelMensaje.Visible = false;
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", $"attachment; filename={archivoSelecionado}");
                Response.TransmitFile(Path.Combine(this.carpetaArchivo, archivoSelecionado));

                Response.End();
            }
            else
            {
                mensajeLabel.Text = "archivo no seleccionado";
                PanelMensaje.Visible = true;
            }
        }
    }
}