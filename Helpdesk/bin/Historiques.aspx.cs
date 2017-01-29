using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Helpdesk
{
    public partial class Historiques : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
        }
    }
}