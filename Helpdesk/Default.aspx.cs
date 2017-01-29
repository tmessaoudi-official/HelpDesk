using System;
using System.Linq;
namespace Helpdesk
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Helpdesk.Utilitaire.Databases.Scripts.LoginStatut(msgboxpanel, LoginName);

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Utilitaire.Utilites.redirect("Account/Logout.aspx");
        }
    }
}