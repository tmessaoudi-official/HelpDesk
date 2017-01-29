using System;

namespace Helpdesk
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.LogoutScript(msgboxpanel);    
        }
    }
}