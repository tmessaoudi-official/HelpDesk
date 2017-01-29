using System;

namespace Helpdesk
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilitaire.Databases.Scripts.Dashboard(msgboxpanel);
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            String un = username.Text;
            String ps = password.Text;
            if (un.Length == 0 || ps.Length == 0)
            {
               
            }
            else
            {
                Utilitaire.Databases.Scripts.LoginScript(msgboxpanel, un, ps);
            }
        }
    }
}