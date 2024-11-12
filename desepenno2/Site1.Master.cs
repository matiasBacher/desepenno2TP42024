using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace desepenno2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public HyperLink link2 { get { return linkF2; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HyperLink[] links = new HyperLink[] {
                    linkF1,
                    linkF2,
                };
                string paginaActual = Request.Url.AbsolutePath;
                foreach (var link in links)
                {
                    string linkUrl = ResolveUrl(link.NavigateUrl);

                    if (paginaActual.Equals(linkUrl, StringComparison.OrdinalIgnoreCase))
                    {
                        link.CssClass += " active";
                        break;
                    }

                }

            }


        }
    }
}