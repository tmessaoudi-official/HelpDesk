using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class AfficheAgence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Int32.Parse(Request.QueryString["IDAgence"]);
            int E = 0;
            int L = 0;
            using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities()) 
            {
             var req = from value in ag.Agences where (value.Agence_ID == id) select value;
             var res = req.FirstOrDefault();
             IDagence.Value = id.ToString();
                E = res.Agence_Equipements;
                L = res.Agence_Liaisons;
                Equipement.Value = E.ToString();
                Liaison.Value = L.ToString();
            }
        }
    }
}