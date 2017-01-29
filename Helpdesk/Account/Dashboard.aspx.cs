using System;

namespace Helpdesk
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilitaire.Databases.Scripts.checksession(msgboxpanel);
        }
    }
}