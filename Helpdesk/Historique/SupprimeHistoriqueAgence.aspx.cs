using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk.Historique
{
    public partial class SupprimeHistoriqueAgence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["IDAgence"] != null)
            {
                int agence_ID = Int32.Parse(Request.QueryString["IDAgence"]);
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in a.Agences where value.ID == agence_ID select value;
                    var res = req.FirstOrDefault();
                    Del0.Text += " " + res.Nom;
                }
            }
            else 
            {
            
            }
        }
        protected void Non_Click(object sender, EventArgs e)
        {
            System.Web.HttpContext.Current.Response.Write("<script>");
            System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
            System.Web.HttpContext.Current.Response.Write("<" + "/script>");
        }

        protected void Oui_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["IDAgence"] != null)
            {
                int agence_ID = Int32.Parse(Request.QueryString["IDAgence"]);
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in a.Agences where value.ID == agence_ID select value;
                    var res = req.FirstOrDefault();
                    Del.Text += " " + res.Nom;
                }
                Utilitaire.Databases.Scripts.supprimerHistoriqueAgence(msgboxpanel, agence_ID.ToString());
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
            else 
            {
            
            }
        }
    }
}