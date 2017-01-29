using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class ZoneAffichage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
        }

        protected void GridView1_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void CheckSqlSelected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Helpdesk.Utilitaire.Utilites.MSG(msgboxpanel, e.Exception.Message, "Erreur");
                e.ExceptionHandled = true;
            }

        }
        protected void CheckSqlSelecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
        }
    }
}