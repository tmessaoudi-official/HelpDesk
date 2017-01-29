using System;

namespace Helpdesk
{
    public partial class forgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            String email = null;
            email = mail.Text;
            Utilitaire.Mail.Scripts.SendForgotmail(msgboxpanel, email);
        }
    }
}