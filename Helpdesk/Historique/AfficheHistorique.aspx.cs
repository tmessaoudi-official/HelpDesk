using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class AfficheHistorique : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
            int id = Int32.Parse(Request.QueryString["IDAgence"]);
            using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
            {
                var req = from value in ag.Agences where ((value.ID == id)) select value;
                var res = req.FirstOrDefault();
                HEquipement.Value = res.ID.ToString();
                HLiaison.Value = res.ID.ToString();

                IQueryable<Helpdesk.Entities.Agences.Equipement> Equipement = ag.Equipement.Where(eq => eq.Agence_ID == res.ID);
                var router = Equipement.OfType<Helpdesk.Entities.Agences.Routeurs>();
                var switche = Equipement.OfType<Helpdesk.Entities.Agences.Switchers>();
                var Mode = Equipement.OfType<Helpdesk.Entities.Agences.Modems>();
                HRouteur.Value = router.FirstOrDefault().ID_Equipement.ToString();
                HSwitcheur.Value = switche.FirstOrDefault().ID_Equipement.ToString();
                HModem.Value = Mode.FirstOrDefault().ID_Equipement.ToString();

                IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = ag.Liaison.Where(li => li.Agence_ID == res.ID);
                var Ad = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>();
                var Fr = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>();
                HFramerelay.Value = Fr.FirstOrDefault().ID_Liaison.ToString();
                HAdsl.Value = Ad.FirstOrDefault().ID_Liaison.ToString();
                HResponsable.Value = res.Responsable.ToString();
            }
        }
        protected void GridView1_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
        protected void GridView2_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            GridView2.DataBind();
        }
        protected void GridView3_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            GridView3.DataBind();
        }

        protected void GridView4_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView4.PageIndex = e.NewPageIndex;
            GridView4.DataBind();
        }
        protected void GridView6_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView6.PageIndex = e.NewPageIndex;
            GridView6.DataBind();
        }
        protected void GridView7_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView7.PageIndex = e.NewPageIndex;
            GridView7.DataBind();
        }
        protected void GridView8_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView8.PageIndex = e.NewPageIndex;
            GridView8.DataBind();
        }
        protected void GridView9_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView9.PageIndex = e.NewPageIndex;
            GridView9.DataBind();
        }
        
        protected void GridView19_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView19.PageIndex = e.NewPageIndex;
            GridView19.DataBind();
        }

    }
}