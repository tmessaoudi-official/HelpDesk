using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;

namespace Helpdesk
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
            using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                var requete = from value in dba.Agences select value;
                var result = requete.FirstOrDefault();
                if (result != null)
                {
                    DropDownListAgenceEmplacement.SelectedValue = result.Agence_Emplacement.ToString();
                    TextBoxAgenceZone.Text = result.Agence_Zone;
                    TextBoxAgenceAdress.Text = result.Adress;
                    TextBoxResponsableNom.Text = result.Respnosable_Agence.Nom;
                    TextBoxResponsablePrenom.Text = result.Respnosable_Agence.Prenom;
                    TextBoxResponsableEmail.Text = result.Respnosable_Agence.Email;
                    TextBoxResponsableTelephone.Text = result.Respnosable_Agence.Teléphone;
                    TextBoxAgenceDescription.Text = result.Agence_Descriptions;

                    TextBoxEquipementDescription.Text = result.Equipements.Equipement_Description;

                    DropDownListRouteurStatut.SelectedValue = result.Equipements.Routeurs.Routeur_Statut.ToString();
                    TextBoxRouteurType.Text = result.Equipements.Routeurs.Routeur_Type;
                    TextBoxRouteurIP.Text = result.Equipements.Routeurs.Routeur_IPadress;
                    TextBoxRouteurMac.Text = result.Equipements.Routeurs.Routeur_Macadress;
                    TextBoxRouteurDescription.Text = result.Equipements.Routeurs.Routeur_Description;

                    DropDownListSwitcheurStatut.SelectedValue = result.Equipements.Switcheurs.Switcheur_Statut.ToString();
                    TextBoxSwitcheurType.Text = result.Equipements.Switcheurs.Switcheur_Type;
                    TextBoxSwitcheurIP.Text = result.Equipements.Switcheurs.Switcheur_IPadress;
                    TextBoxSwitcheurMac.Text = result.Equipements.Switcheurs.Switcheur_Macadress;
                    TextBoxSwitcheurDescription.Text = result.Equipements.Switcheurs.Switcheur_Description;

                    DropDownListModemStatut.SelectedValue = result.Equipements.Modems.Modem_Statut.ToString();
                    TextBoxModemType.Text = result.Equipements.Modems.Modem_Type;
                    TextBoxModemIP.Text = result.Equipements.Modems.Modem_IPadress;
                    TextBoxModemMac.Text = result.Equipements.Modems.Modem_Macadress;
                    TextBoxModemDescription.Text = result.Equipements.Modems.Modem_Description;

                    TextBoxLiaisonDescription.Text = result.Liaisons.Liaison_Description;

                    DropDownListAdslStatut.SelectedValue = result.Liaisons.Adsl.Adsl_Statut.ToString();
                    TextBoxAdslIdentificateur.Text = result.Liaisons.Adsl.Adsl_Identificateur;
                    TextBoxAdslDescription.Text = result.Liaisons.Adsl.Adsl_Description;

                    DropDownListFrarelayStatut.SelectedValue = result.Liaisons.Framerelay.Framerelay_Statut.ToString();
                    TextBoxFrameRelayIdentificateur.Text = result.Liaisons.Framerelay.Framerelay_Identificateur;
                    TextBoxFramerelayDescription.Text = result.Liaisons.Framerelay.Framerelay_Description;

                }
            }
        }
        protected void DropDownListAgenceID_SelectedIndexChanged(object sender, EventArgs e)
        {
            int agence_ID = Int32.Parse(DropDownListAgenceID.SelectedValue);
            using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                var requete = from value in dba.Agences where (value.Agence_ID == agence_ID) select value;
                var result = requete.FirstOrDefault();
                if (result != null)
                {
                    DropDownListAgenceEmplacement.SelectedValue = result.Agence_Emplacement.ToString();
                    TextBoxAgenceZone.Text = result.Agence_Zone;
                    TextBoxAgenceAdress.Text = result.Adress;
                    TextBoxResponsableNom.Text = result.Respnosable_Agence.Nom;
                    TextBoxResponsablePrenom.Text = result.Respnosable_Agence.Prenom;
                    TextBoxResponsableEmail.Text = result.Respnosable_Agence.Email;
                    TextBoxResponsableTelephone.Text = result.Respnosable_Agence.Teléphone;
                    TextBoxAgenceDescription.Text = result.Agence_Descriptions;

                    TextBoxEquipementDescription.Text = result.Equipements.Equipement_Description;

                    DropDownListRouteurStatut.SelectedValue = result.Equipements.Routeurs.Routeur_Statut.ToString();
                    TextBoxRouteurType.Text = result.Equipements.Routeurs.Routeur_Type;
                    TextBoxRouteurIP.Text = result.Equipements.Routeurs.Routeur_IPadress;
                    TextBoxRouteurMac.Text = result.Equipements.Routeurs.Routeur_Macadress;
                    TextBoxRouteurDescription.Text = result.Equipements.Routeurs.Routeur_Description;

                    DropDownListSwitcheurStatut.SelectedValue = result.Equipements.Switcheurs.Switcheur_Statut.ToString();
                    TextBoxSwitcheurType.Text = result.Equipements.Switcheurs.Switcheur_Type;
                    TextBoxSwitcheurIP.Text = result.Equipements.Switcheurs.Switcheur_IPadress;
                    TextBoxSwitcheurMac.Text = result.Equipements.Switcheurs.Switcheur_Macadress;
                    TextBoxSwitcheurDescription.Text = result.Equipements.Switcheurs.Switcheur_Description;

                    DropDownListModemStatut.SelectedValue = result.Equipements.Modems.Modem_Statut.ToString();
                    TextBoxModemType.Text = result.Equipements.Modems.Modem_Type;
                    TextBoxModemIP.Text = result.Equipements.Modems.Modem_IPadress;
                    TextBoxModemMac.Text = result.Equipements.Modems.Modem_Macadress;
                    TextBoxModemDescription.Text = result.Equipements.Modems.Modem_Description;

                    TextBoxLiaisonDescription.Text = result.Liaisons.Liaison_Description;

                    DropDownListAdslStatut.SelectedValue = result.Liaisons.Adsl.Adsl_Statut.ToString();
                    TextBoxAdslIdentificateur.Text = result.Liaisons.Adsl.Adsl_Identificateur;
                    TextBoxAdslDescription.Text = result.Liaisons.Adsl.Adsl_Description;

                    DropDownListFrarelayStatut.SelectedValue = result.Liaisons.Framerelay.Framerelay_Statut.ToString();
                    TextBoxFrameRelayIdentificateur.Text = result.Liaisons.Framerelay.Framerelay_Identificateur;
                    TextBoxFramerelayDescription.Text = result.Liaisons.Framerelay.Framerelay_Description;

                }
            }
        }
        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            int emplcamentagence = Int32.Parse(DropDownListAgenceEmplacement.SelectedValue.ToString());
            String statutrouteur = DropDownListRouteurStatut.SelectedValue.ToString();
            String statutswitcheur = DropDownListSwitcheurStatut.SelectedValue.ToString();
            String statutmodem = DropDownListModemStatut.SelectedValue.ToString();
            String statutAdsl = DropDownListAdslStatut.SelectedValue.ToString();
            String statutFramerelay = DropDownListFrarelayStatut.SelectedValue.ToString();
            int agence_ID = Int32.Parse(DropDownListAgenceID.SelectedValue);
            String CurrentUser = null;
            using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
                {
                    CurrentUser = System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Username"];
                }
                var requete = from value in dba.Agences where (value.Agence_ID == agence_ID) select value;
                var result = requete.FirstOrDefault();
                if (result != null)
                {
                    Entities.Agences.Historique_Modem mo = new Entities.Agences.Historique_Modem() { Historique_Modem_Personnel = CurrentUser, Historique_Modem_ID = result.Equipements.Modems.Modem_ID, Historique_Modem_Date = DateTime.Now };
                    Entities.Agences.Historique_Routeur ro = new Entities.Agences.Historique_Routeur() { Historique_Routeur_Personnel = CurrentUser, Historique_Routeur_ID = result.Equipements.Routeurs.Routeur_ID, Historique_Routeur_Date = DateTime.Now };
                    Entities.Agences.Historique_Switcheur sw = new Entities.Agences.Historique_Switcheur() { Historique_Switcheur_Personnel = CurrentUser, Historique_Switcheur_ID = result.Equipements.Switcheurs.Switcheur_ID, Historique_Switcheur_Date = DateTime.Now };
                    Entities.Agences.Historique_Equipements eq = new Entities.Agences.Historique_Equipements() { Historique_Equipement_Date = DateTime.Now, Historique_Equipement_ID = result.Equipements.Equipement_ID, Historique_Equipement_Modem = mo.Historique_Modem1, Historique_Equipement_Routeur = ro.Historique_Routeur1, Historique_Equipement_Switcheur = sw.Historique_Switcheur1, Historique_Equipement_Personnel = CurrentUser, };
                    Entities.Agences.Historique_Adsl ad = new Entities.Agences.Historique_Adsl() { Historique_Adsl_Date = DateTime.Now, Historique_Adsl_Personnel = CurrentUser, Historique_Adsl_ID = result.Liaisons.Adsl.Adsl_ID };
                    Entities.Agences.Historique_FrameRelay fr = new Entities.Agences.Historique_FrameRelay() { Historique_Framerelay_Date = DateTime.Now, Historique_Framerelay_Personnel = CurrentUser, Historique_Framerelay_ID = result.Liaisons.Framerelay.Framerelay_ID };

                    Entities.Agences.Historique_Liaison li = new Entities.Agences.Historique_Liaison() { Historique_Liaison_Date = DateTime.Now, Historique_Liaison_ID = result.Liaisons.Liaison_ID, Historique_Liaison_Personnel = CurrentUser, Historique_Liaison_Adsl = ad.Historique_Adsl1, Historique_Liaison_Framerelay = fr.Historique_Framerelay1 };
                    Entities.Agences.Historique_Responsable re = new Entities.Agences.Historique_Responsable() { Historique_ID_Responsable = result.Respnosable_Agence.ID };
                    Entities.Agences.Historique_Agences ag = new Entities.Agences.Historique_Agences() { Historique_Coordonne_Responsable = re.Historique_Responsable1, Historique_Agence_Date = DateTime.Now, Historique_Agence_ID = agence_ID, Historique_Personnel = CurrentUser, Historique_Agence_Equipements = eq.Historique_Equipement, Historique_Agence_Liaisons = li.Historique_Liaison1 };

                    if (result.Agence_Descriptions != TextBoxAgenceDescription.Text)
                    {
                        ag.Historique_Agence_Description_Ancien = result.Agence_Descriptions;
                        ag.Historique_Agence_Description_Nouveau = TextBoxAgenceDescription.Text;
                    }
                    if (result.Agence_Emplacement != emplcamentagence)
                    {
                        ag.Historique_Agence_Emplacement_ancien = result.Emplacement.Emplacement_Libelle;
                        using (Entities.Agences.AgenceEntities emp = new Entities.Agences.AgenceEntities())
                        {
                            var emreq = from val in emp.Emplacement where (val.Emplacement_ID == emplcamentagence) select val;
                            var emres = emreq.FirstOrDefault();
                            ag.Historique_Agence_Emplacement_nouveau = emres.Emplacement_Libelle;
                        }

                    }
                    if (result.Equipements.Equipement_Description != TextBoxEquipementDescription.Text)
                    {
                        eq.Historique_Equipement_Description_Ancien = result.Equipements.Equipement_Description;
                        eq.Historique_Equipement_Description_Nouveau = TextBoxEquipementDescription.Text;
                    }
                    if (result.Liaisons.Liaison_Description != TextBoxLiaisonDescription.Text)
                    {
                        li.Historique_Liaison_Description_Ancien = result.Liaisons.Liaison_Description;
                        li.Historique_Liaison_Description_Nouveau = TextBoxLiaisonDescription.Text;
                    }
                    if (result.Equipements.Modems.Modem_Description != TextBoxModemDescription.Text)
                    {
                        mo.Historique_Modem_Description_Ancien = result.Equipements.Modems.Modem_Description;
                        mo.Historique_Modem_Description_Nouveau = TextBoxModemDescription.Text;
                    }
                    if (result.Equipements.Modems.Modem_IPadress != TextBoxModemIP.Text)
                    {
                        mo.Historique_Modem_Ip_Ancien = result.Equipements.Modems.Modem_IPadress;
                        mo.Historique_Modem_Ip_Nouveau = TextBoxModemIP.Text;
                    }
                    if (result.Equipements.Modems.Modem_Macadress != TextBoxModemMac.Text)
                    {
                        mo.Historique_Modem_Mac_Ancien = result.Equipements.Modems.Modem_Macadress;
                        mo.Historique_Modem_Mac_Nouveau = TextBoxModemMac.Text;
                    }
                    if (result.Equipements.Modems.Modem_Statut != statutmodem)
                    {
                        mo.Historique_Modem_Statut_ancien = result.Equipements.Modems.Modem_Statut;
                        mo.Historique_Modem_Statut_Nouveau = statutmodem;
                    }
                    if (result.Equipements.Modems.Modem_Type != TextBoxModemType.Text)
                    {
                        mo.Historique_Modem_Type_Ancien = result.Equipements.Modems.Modem_Type;
                        mo.Historique_Modem_Type_Nouveau = TextBoxModemType.Text;
                    }
                    if (result.Equipements.Routeurs.Routeur_Description != TextBoxRouteurDescription.Text)
                    {
                        ro.Historique_Routeur_Description_Ancien = result.Equipements.Routeurs.Routeur_Description;
                        ro.Historique_Routeur_Description_Nouveau = TextBoxRouteurDescription.Text;
                    }
                    if (result.Equipements.Routeurs.Routeur_IPadress != TextBoxRouteurIP.Text)
                    {
                        ro.Historique_Routeur_Ip_Ancien = result.Equipements.Routeurs.Routeur_IPadress;
                        ro.Historique_Routeur_Ip_Nouveau = TextBoxRouteurIP.Text;
                    }
                    if (result.Equipements.Routeurs.Routeur_Macadress != TextBoxRouteurMac.Text)
                    {
                        ro.Historique_Routeur_Mac_Ancien = result.Equipements.Routeurs.Routeur_Macadress;
                        ro.Historique_Routeur_Mac_Nouveau = TextBoxRouteurMac.Text;
                    }
                    if (result.Equipements.Routeurs.Routeur_Statut != statutrouteur)
                    {
                        ro.Historique_Routeur_Statut_ancien = result.Equipements.Routeurs.Routeur_Statut;
                        ro.Historique_Routeur_Statut_Nouveau = statutrouteur;
                    }
                    if (result.Equipements.Routeurs.Routeur_Type != TextBoxRouteurType.Text)
                    {
                        ro.Historique_Routeur_Type_Ancien = result.Equipements.Routeurs.Routeur_Type;
                        ro.Historique_Routeur_Type_Nouveau = TextBoxRouteurType.Text;
                    }
                    if (result.Equipements.Switcheurs.Switcheur_Description != TextBoxSwitcheurDescription.Text)
                    {
                        sw.Historique_Switcheur_Description_Ancien = result.Equipements.Switcheurs.Switcheur_Description;
                        sw.Historique_Switcheur_Description_Nouveau = TextBoxSwitcheurDescription.Text;
                    }
                    if (result.Equipements.Switcheurs.Switcheur_IPadress != TextBoxSwitcheurIP.Text)
                    {
                        sw.Historique_Switcheur_Ip_Ancien = result.Equipements.Switcheurs.Switcheur_IPadress;
                        sw.Historique_Switcheur_Ip_Nouveau = TextBoxSwitcheurIP.Text;
                    }
                    if (result.Equipements.Switcheurs.Switcheur_Macadress != TextBoxSwitcheurMac.Text)
                    {
                        sw.Historique_Switcheur_Mac_Ancien = result.Equipements.Switcheurs.Switcheur_Macadress;
                        sw.Historique_Switcheur_Mac_Nouveau = TextBoxSwitcheurMac.Text;
                    }
                    if (result.Equipements.Switcheurs.Switcheur_Statut != statutswitcheur)
                    {
                        sw.Historique_Switcheur_Statut_ancien = result.Equipements.Switcheurs.Switcheur_Statut;
                        sw.Historique_Switcheur_Statut_Nouveau = statutswitcheur;
                    }
                    if (result.Equipements.Switcheurs.Switcheur_Type != TextBoxSwitcheurType.Text)
                    {
                        sw.Historique_Switcheur_Type_Ancien = result.Equipements.Switcheurs.Switcheur_Type;
                        sw.Historique_Switcheur_Type_Nouveau = TextBoxSwitcheurType.Text;
                    }
                    if (result.Liaisons.Adsl.Adsl_Description != TextBoxAdslDescription.Text)
                    {
                        ad.Historique_Adsl_Description_Ancien = result.Liaisons.Adsl.Adsl_Description;
                        ad.Historique_Adsl_Description_Nouveau = TextBoxAdslDescription.Text;
                    }
                    if (result.Liaisons.Adsl.Adsl_Identificateur != TextBoxAdslIdentificateur.Text)
                    {
                        ad.Historique_Adsl_Identificateur_Ancien = result.Liaisons.Adsl.Adsl_Identificateur;
                        ad.Historique_Adsl_Identificateur_Nouveau = TextBoxAdslIdentificateur.Text;
                    }
                    if (result.Liaisons.Adsl.Adsl_Statut != statutAdsl)
                    {
                        ad.Historique_Adsl_Statut_Ancien = result.Liaisons.Adsl.Adsl_Statut;
                        ad.Historique_Adsl_Statut_Nouveau = statutAdsl;
                    }
                    if (result.Liaisons.Framerelay.Framerelay_Description != TextBoxFramerelayDescription.Text)
                    {
                        fr.Historique_Framerelay_Description_Ancien = result.Liaisons.Framerelay.Framerelay_Description;
                        fr.Historique_Framerelay_Description_Nouveau = TextBoxFramerelayDescription.Text;
                    }
                    if (result.Liaisons.Framerelay.Framerelay_Identificateur != TextBoxFrameRelayIdentificateur.Text)
                    {
                        fr.Historique_Framerelay_Identificateur_Ancien = result.Liaisons.Framerelay.Framerelay_Identificateur;
                        fr.Historique_Framerelay_Identificateur_Nouveau = TextBoxFrameRelayIdentificateur.Text;
                    }
                    if (result.Liaisons.Framerelay.Framerelay_Statut != statutFramerelay)
                    {
                        fr.Historique_Framerelay_Statut_Ancien = result.Liaisons.Framerelay.Framerelay_Statut;
                        fr.Historique_Framerelay_Statut_Nouveau = statutFramerelay;
                    }
                    if (result.Respnosable_Agence.Nom == TextBoxResponsableNom.Text)
                    {
                        re.Historique_Responsable_Nom_Ancien = result.Respnosable_Agence.Nom;
                        re.Historique_Responsable_Nom_Nouveau = TextBoxResponsableNom.Text;
                    }
                    if (result.Respnosable_Agence.Prenom == TextBoxResponsablePrenom.Text)
                    {
                        re.Historique_Responsable_Prenom_Ancien = result.Respnosable_Agence.Prenom;
                        re.Historique_Responsable_Prenom_Nouveau = TextBoxResponsablePrenom.Text;
                    }
                    if (result.Respnosable_Agence.Email == TextBoxResponsableEmail.Text)
                    {
                        re.Historique_Responsable_Email_ancien = result.Respnosable_Agence.Email;
                        re.Historique_Responsable_Email_Nouveau = TextBoxResponsableEmail.Text;
                    }
                    if (result.Respnosable_Agence.Teléphone == TextBoxResponsableTelephone.Text)
                    {
                        re.Historique_Responsable_Telephone_Ancien = result.Respnosable_Agence.Teléphone;
                        re.Historique_Responsable_Telephone_Nouveau = TextBoxResponsableTelephone.Text;
                    }
                    result.Agence_Descriptions = TextBoxAgenceDescription.Text;
                    result.Agence_Emplacement = emplcamentagence;
                    result.Equipements.Equipement_Description = TextBoxEquipementDescription.Text;
                    result.Liaisons.Liaison_Description = TextBoxLiaisonDescription.Text;
                    result.Equipements.Modems.Modem_Description = TextBoxModemDescription.Text;
                    result.Equipements.Modems.Modem_IPadress = TextBoxModemIP.Text;
                    result.Equipements.Modems.Modem_Macadress = TextBoxModemMac.Text;
                    result.Equipements.Modems.Modem_Statut = statutmodem;
                    result.Equipements.Modems.Modem_Type = TextBoxModemType.Text;
                    result.Equipements.Routeurs.Routeur_Description = TextBoxModemDescription.Text;
                    result.Equipements.Routeurs.Routeur_IPadress = TextBoxRouteurIP.Text;
                    result.Equipements.Routeurs.Routeur_Macadress = TextBoxRouteurMac.Text;
                    result.Equipements.Routeurs.Routeur_Statut = statutrouteur;
                    result.Equipements.Routeurs.Routeur_Type = TextBoxRouteurType.Text;
                    result.Equipements.Switcheurs.Switcheur_Description = TextBoxSwitcheurDescription.Text;
                    result.Equipements.Switcheurs.Switcheur_IPadress = TextBoxSwitcheurIP.Text;
                    result.Equipements.Switcheurs.Switcheur_Macadress = TextBoxSwitcheurMac.Text;
                    result.Equipements.Switcheurs.Switcheur_Statut = statutswitcheur;
                    result.Equipements.Switcheurs.Switcheur_Type = TextBoxSwitcheurType.Text;
                    result.Liaisons.Adsl.Adsl_Description = TextBoxAdslDescription.Text;
                    result.Liaisons.Adsl.Adsl_Identificateur = TextBoxAdslIdentificateur.Text;
                    result.Liaisons.Adsl.Adsl_Statut = statutAdsl;
                    result.Liaisons.Framerelay.Framerelay_Description = TextBoxFramerelayDescription.Text;
                    result.Liaisons.Framerelay.Framerelay_Identificateur = TextBoxFrameRelayIdentificateur.Text;
                    result.Liaisons.Framerelay.Framerelay_Statut = statutFramerelay;
                    result.Adress = TextBoxAgenceAdress.Text;
                    result.Agence_Zone = TextBoxAgenceZone.Text;

                    result.Respnosable_Agence.Nom = TextBoxResponsableNom.Text;
                    result.Respnosable_Agence.Prenom = TextBoxResponsablePrenom.Text;
                    result.Respnosable_Agence.Email = TextBoxResponsableEmail.Text;
                    result.Respnosable_Agence.Teléphone = TextBoxResponsableTelephone.Text;
                    dba.AddToHistorique_Responsable(re);
                    dba.AddToHistorique_Adsl(ad);
                    dba.AddToHistorique_FrameRelay(fr);
                    dba.AddToHistorique_Liaison(li);
                    dba.AddToHistorique_Modem(mo);
                    dba.AddToHistorique_Routeur(ro);
                    dba.AddToHistorique_Switcheur(sw);
                    dba.AddToHistorique_Equipements(eq);
                    dba.AddToHistorique_Agences(ag);
                    dba.SaveChanges();
                    Utilitaire.Utilites.MSG(msgboxpanel, "", "Mis Ajour Avec Succes");

                }
            }
        }
    }
}