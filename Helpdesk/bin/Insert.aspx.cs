using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
        }
        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            int emplcamentagence =Int32.Parse(DropDownListAgenceEmplacement.SelectedValue.ToString());
            String statutrouteur = DropDownListRouteurStatut.SelectedValue.ToString();
            String statutswitcheur = DropDownListSwitcheurStatut.SelectedValue.ToString();
            String statutmodem = DropDownListModemStatut.SelectedValue.ToString();
            String statutAdsl = DropDownListAdslStatut.SelectedValue.ToString();
            String statutFramerelay = DropDownListFrarelayStatut.SelectedValue.ToString();
            try
            {
                using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
                {
                    Entities.Agences.Routeurs router = new Entities.Agences.Routeurs() { Routeur_Statut = statutrouteur, Routeur_IPadress = TextBoxRouteurIP.Text, Routeur_Macadress = TextBoxRouteurMac.Text, Routeur_Type = TextBoxRouteurType.Text, Routeur_Description = TextBoxRouteurDescription.Text };
                    Entities.Agences.Switcheurs switche = new Entities.Agences.Switcheurs() { Switcheur_Statut = statutswitcheur, Switcheur_IPadress = TextBoxSwitcheurIP.Text, Switcheur_Macadress = TextBoxSwitcheurMac.Text, Switcheur_Type = TextBoxSwitcheurType.Text, Switcheur_Description = TextBoxSwitcheurDescription.Text };
                    Entities.Agences.Modems modem = new Entities.Agences.Modems() { Modem_Statut = statutmodem, Modem_IPadress = TextBoxModemIP.Text, Modem_Macadress = TextBoxModemMac.Text, Modem_Type = TextBoxModemType.Text, Modem_Description = TextBoxModemDescription.Text };
                    Entities.Agences.Equipements equipement = new Entities.Agences.Equipements() { Equipement_Modem = modem.Modem_ID, Equipement_Routeur = router.Routeur_ID, Equipement_Switcheur = switche.Switcheur_ID, Equipement_Description = TextBoxEquipementDescription.Text };
                    Entities.Agences.Framerelay framerelay = new Entities.Agences.Framerelay() { Framerelay_Statut = statutFramerelay, Framerelay_Identificateur = TextBoxFrameRelayIdentificateur.Text, Framerelay_Description = TextBoxFramerelayDescription.Text };
                    Entities.Agences.Adsl adsl = new Entities.Agences.Adsl() { Adsl_Statut = statutAdsl, Adsl_Identificateur = TextBoxAdslIdentificateur.Text, Adsl_Description = TextBoxAdslDescription.Text };
                    Entities.Agences.Liaisons liaison = new Entities.Agences.Liaisons() { Liaison_Adsl = adsl.Adsl_ID, Liaison_Framerelay = framerelay.Framerelay_ID, Liaison_Description = TextBoxLiaisonDescription.Text };
                    Entities.Agences.Respnosable_Agence responsable = new Entities.Agences.Respnosable_Agence() { Nom = TextBoxResponsableNom.Text, Prenom = TextBoxResponsablePrenom.Text, Email = TextBoxResponsableEmail.Text, Teléphone = TextBoxResponsableTelephone.Text };
                    Entities.Agences.Agences agence = new Entities.Agences.Agences() { Agence_Zone = TextBoxAgenceZone.Text, Adress = TextBoxAgenceAdress.Text, Agence_Coordonnee_Responsable = responsable.ID, Agence_Emplacement = emplcamentagence, Agence_Descriptions = TextBoxAgenceDescription.Text, Agence_Equipements = equipement.Equipement_ID, Agence_Liaisons = liaison.Liaison_ID };

                    dba.AddToRouteurs(router);
                    dba.AddToSwitcheurs(switche);
                    dba.AddToModems(modem);
                    dba.AddToEquipements(equipement);
                    dba.AddToFramerelay(framerelay);
                    dba.AddToAdsl(adsl);
                    dba.AddToLiaisons(liaison);
                    dba.AddToRespnosable_Agence(responsable);
                    dba.AddToAgences(agence);
                    dba.SaveChanges();
                    Utilitaire.Utilites.MSG(msgboxpanel, "L'agence de : " + agence.Emplacement.Emplacement_Libelle + ", " + agence.Agence_Zone + ", " + agence.Adress + " a été ajoutée à la base avec succés", "Ajout Avec Succés");
                }
            }
            catch (System.Data.SqlClient.SqlException sql) { Utilitaire.Utilites.MSG(msgboxpanel, sql.Message, "Sql Error"); }
        }
    }
}