using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk.Recherche
{
    public partial class RechercheHistorique : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate.ToShortDateString().Equals("01/01/0001"))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Selectionner une Date Valide", "Date Invalide");
            }
            else
            {
                Utilitaire.Utilites.redirect("AfficheHistoriqueDate.aspx?Date=" + Calendar1.SelectedDate.ToShortDateString());
            }
            }

        protected void Submitframerelay_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(IPFramerelay.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner une @ IP", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    IQueryable<Helpdesk.Entities.Agences.Liaison> liaison = db.Liaison;
                    var frame = (Helpdesk.Entities.Agences.Framerelay)liaison.OfType<Helpdesk.Entities.Agences.Framerelay>().Where(fr => fr.Adresse_IP == IPFramerelay.Text);
                    if (frame != null)
                    {
                        var req = from value in db.Agences where (value.ID == frame.Agence_ID) select value;
                        var res = req.FirstOrDefault();
                        if (res != null)
                        {
                            Utilitaire.Utilites.redirect("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                        }
                        else
                        {
                            Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                        }
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void SubmitNom_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(NomAgence.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner le nom d'agence", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in db.Agences where (value.Nom == NomAgence.Text) select value;
                    var res = req.FirstOrDefault();

                    if (res != null)
                    {
                        Utilitaire.Utilites.redirect("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void SubmitCode_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(CodeAgence.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner le Code d'agence", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in db.Agences where (value.Code == CodeAgence.Text) select value;
                    var res = req.FirstOrDefault();

                    if (res != null)
                    {
                        Utilitaire.Utilites.redirect("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void SubmitIP_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(IPAgence.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner l'@ IP d'agence", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in db.Agences where (value.Adresse_IP == IPAgence.Text) select value;
                    var res = req.FirstOrDefault();

                    if (res != null)
                    {
                        Utilitaire.Utilites.redirect("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void SubmitAdslCarte_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(IPAdslCarte.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner une @ IP", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    IQueryable<Helpdesk.Entities.Agences.Liaison> liaison = db.Liaison;
                    var AdsCa = (Helpdesk.Entities.Agences.Adsl)liaison.OfType<Helpdesk.Entities.Agences.Adsl>().Where(ad => ad.Adresse_Carte == IPAdslCarte.Text);
                    if (AdsCa != null)
                    {
                        var req = from value in db.Agences where (value.ID == AdsCa.Agence_ID) select value;
                        var res = req.FirstOrDefault();
                        if (res != null)
                        {
                            Utilitaire.Utilites.redirect("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                        }
                        else
                        {
                            Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                        }
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void SubmitAdslTunnel_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(IPAdslTunnel.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner une @ IP", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    IQueryable<Helpdesk.Entities.Agences.Liaison> liaison = db.Liaison;
                    var AdsTu = (Helpdesk.Entities.Agences.Adsl)liaison.OfType<Helpdesk.Entities.Agences.Adsl>().Where(ad => ad.Adresse_IP == IPAdslTunnel.Text);
                    if (AdsTu != null)
                    {
                        var req = from value in db.Agences where (value.ID == AdsTu.Agence_ID) select value;
                        var res = req.FirstOrDefault();
                        if (res != null)
                        {
                            Utilitaire.Utilites.redirect("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                        }
                        else
                        {
                            Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                        }
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }
    }
}