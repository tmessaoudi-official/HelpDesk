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
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
            int ID = Int32.Parse(Request.QueryString["IDAgence"]);
            using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities()) 
            {
                var req = from value in ag.Agences where (value.ID == ID) select value;
                var res = req.FirstOrDefault();

                ResponsableAgence.Value = res.Responsable.ToString();

                IQueryable<Helpdesk.Entities.Agences.Equipement> Equipement = ag.Equipement.Where(eq => eq.Agence_ID == res.ID);
                var router = Equipement.OfType<Helpdesk.Entities.Agences.Routeurs>();
                var switche = Equipement.OfType<Helpdesk.Entities.Agences.Switchers>();
                var Mode = Equipement.OfType<Helpdesk.Entities.Agences.Modems>();

                Routeur.Value = router.FirstOrDefault().ID_Equipement.ToString();
                Switcheur.Value = switche.FirstOrDefault().ID_Equipement.ToString();
                Modem.Value = Mode.FirstOrDefault().ID_Equipement.ToString();

                IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = ag.Liaison.Where(li => li.Agence_ID == res.ID);
                var Ad = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>();
                var Fr = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>();

                Adsl.Value = Ad.FirstOrDefault().ID_Liaison.ToString();
                FrameRelay.Value = Fr.FirstOrDefault().ID_Liaison.ToString();
            }
        }
    }
}