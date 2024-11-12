using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace desepenno2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelMensaje.Visible = false;

                if (Session["usuario"] != null)
                {
                    PanelMensaje.Visible = true;
                    mensajeLabel.Text = $"bienvenido {Session["usuario"]}";
                }
            }

        }

        protected void ButtonRegistrar_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                HttpCookie contrasena = new HttpCookie("contrasena", TextBoxContrasenna.Text);
                contrasena.Expires = DateTime.Now.AddDays(5);
                this.Response.Cookies.Add(contrasena);

                Session["usuario"] = TextBoxUser.Text;
                PanelMensaje.Visible=true;
                


            }
        }
    }
}