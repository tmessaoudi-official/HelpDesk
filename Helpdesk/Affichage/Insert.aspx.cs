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

        public String Mission(int ID)
        {
            String Output = null;
            using (Helpdesk.Entities.Agences.AgenceEntities dbag = new Entities.Agences.AgenceEntities())
            {
                var req = from value in dbag.Agences where value.Responsable == ID select value;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    Output = (res.Zones.Libelle + ", " + res.Nom);
                }
                else
                {
                    Output = ("Free");
                }
            }
            return Output;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
            wzd.PreRender += new EventHandler(wzd_PreRender);

        }
        protected void SubmitChange(object sender, EventArgs e)
        {
            if (DropDownListAgenceZone.SelectedItem.Value != null)
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("function TaskEdit() {");
                System.Web.HttpContext.Current.Response.Write("$find('EditModalPopup').show();");
                System.Web.HttpContext.Current.Response.Write("var frame = $get('IframeEdit');");
                System.Web.HttpContext.Current.Response.Write("frame.src = \"Zone.aspx?Page=Update&Mode=editzone&IDZone=" + DropDownListAgenceZone.SelectedItem.Value + "\"");
                System.Web.HttpContext.Current.Response.Write("}");
                System.Web.HttpContext.Current.Response.Write("function TaskDelete() {");
                System.Web.HttpContext.Current.Response.Write("$find('EditModalPopup').show();");
                System.Web.HttpContext.Current.Response.Write("var frame = $get('IframeEdit');");
                System.Web.HttpContext.Current.Response.Write("frame.src = \"Zone.aspx?Page=Update&Mode=deletezone&IDZone=" + DropDownListAgenceZone.SelectedItem.Value + "\"");
                System.Web.HttpContext.Current.Response.Write("}");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                Edi.Attributes.Add("onclick", "TaskEdit();");
                Dele.Attributes.Add("onclick", "TaskDelete();");
            }
        }
        protected void wzd_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = wzd.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = wzd.WizardSteps;
            SideBarList.DataBind();

        }
        public string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }

            int stepIndex = wzd.WizardSteps.IndexOf(step);

            if (stepIndex < wzd.ActiveStepIndex)
            {
               
                return "stepCompleted";
            }
            else if (stepIndex > wzd.ActiveStepIndex)
            {
                return "stepNotCompleted";
            }
            else
            {
                return "stepCurrent";
            }
        }
        protected void Responsable(object sender, EventArgs e)
        {
            Assigned.DataSource = AssignedResponsable;
            Assigned.DataBind();
            using (Helpdesk.Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                var req = from value in dba.Agences select value;
                var res = req.ToList();
                if (res.Count == 0)
                {
                    AutreResponsable.SelectCommand = "SELECT DISTINCT Responsables.ID, Responsables.Nom + ' ' + Responsables.Prenom AS Detaille FROM Responsables WHERE (Responsables.Niveau = 3) AND (Responsables.Role = 2)";
                    Autres.DataSource = AutreResponsable;
                    Autres.DataBind();
                }
                else
                {
                    AutreResponsable.SelectCommand = "SELECT DISTINCT Responsables.ID, Responsables.Nom + ' ' + Responsables.Prenom AS Detaille FROM Responsables CROSS JOIN Agences WHERE (Responsables.Niveau = 3) AND (Responsables.Role = 2) AND (Responsables.ID NOT IN (SELECT Responsable FROM Agences AS Agences_1))";
                    Autres.DataSource = AutreResponsable;
                    Autres.DataBind();
                }
            }
        }
        protected void wzd_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {

            if ((ComboBox1.Text != null) && ( (Assigned.SelectedItem != null) || (Autres.SelectedItem != null)))
            {
                int responsable = 0;
                if (Assigned.SelectedItem != null)
                {
                    responsable = Int32.Parse(Assigned.SelectedItem.Value);
                }
                if (Autres.SelectedItem != null)
                {
                    responsable = Int32.Parse(Autres.SelectedItem.Value);
                }
                int Found = 0;
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in a.Agences select value;
                    var res = req.ToList();
                    foreach (Helpdesk.Entities.Agences.Agences ag in res)
                    {
                        if (ag.Responsable == responsable)
                        {
                            Found = 1;
                            break;
                        }
                    }
                }
                if (Found == 0)
                {
                    int Zoneagence = Int32.Parse(DropDownListAgenceZone.SelectedItem.Value);
                    String Etatrouteur = DropDownListRouteurEtat.SelectedValue.ToString();
                    String Etatswitcheur = DropDownListSwitcheurEtat.SelectedValue.ToString();
                    String Etatmodem = DropDownListModemEtat.SelectedValue.ToString();
                    String EtatAdslTunnel = DropDownListAdslEtatTunnel.SelectedValue.ToString();
                    String EtatAdslCarte = DropDownListAdslEtatCarte.SelectedValue.ToString();
                    String EtatFramerelay = DropDownListFrarelayEtat.SelectedValue.ToString();
                    try
                    {
                        using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
                        {
                            Entities.Agences.Agences agence = new Entities.Agences.Agences() { Zone = Zoneagence, Adresse = TextBoxAgenceAdress.Text, Nom = TextBoxAgenceNom.Text, Adresse_IP = TextBoxAgenceAdressIP.Text, Code = TextBoxAgenceCode.Text, Responsable = responsable, Descriptions = TextBoxAgenceDescription.Text, Liaison_Description = TextBoxLiaisonDescription.Text, Equipement_Description = TextBoxEquipementDescription.Text };
                            Helpdesk.Entities.Agences.Responsabilité r = new Entities.Agences.Responsabilité() { Agence_ID = agence.ID, Responsable_ID = responsable, DateDebut = DateTime.Now.Date, TimeDebut = DateTime.Now.TimeOfDay };

                            Entities.Agences.Routeurs router = new Entities.Agences.Routeurs() { Agence_ID = agence.ID, Model = TextBoxRouteurModel.Text, Etat = Etatrouteur, Adresse_IP = TextBoxRouteurIP.Text, Adresse_MAC = TextBoxRouteurMac.Text, Type = TextBoxRouteurType.Text, Description = TextBoxRouteurDescription.Text };
                            Entities.Agences.Switchers switche = new Entities.Agences.Switchers() { Agence_ID = agence.ID, Model = TextBoxSwitcheurModel.Text, Etat = Etatswitcheur, Adresse_IP = TextBoxSwitcheurIP.Text, Adresse_MAC = TextBoxSwitcheurMac.Text, Type = TextBoxSwitcheurType.Text, Description = TextBoxSwitcheurDescription.Text };
                            Entities.Agences.Modems modem = new Entities.Agences.Modems() { Agence_ID = agence.ID, Etat = Etatmodem, Type = TextBoxModemType.Text, Model = TextBoxModemModel.Text, Description = TextBoxModemDescription.Text };

                            Entities.Agences.Framerelay framerelay = new Entities.Agences.Framerelay() { Agence_ID = agence.ID, Etat = EtatFramerelay, Adresse_IP = TextBoxFrameRelayAdresseIP.Text, Description = TextBoxFramerelayDescription.Text };
                            Entities.Agences.Adsl adsl = new Entities.Agences.Adsl() { Agence_ID = agence.ID, Etat = EtatAdslTunnel, Etat_Carte = EtatAdslCarte, Adresse_IP = TextBoxAdslAdresseTunnel.Text, Adresse_Carte = TextBoxAdslAdresseCarte.Text, Description = TextBoxAdslDescription.Text };

                            dba.AddToAgences(agence);

                            dba.AddToEquipement(router);
                            dba.AddToEquipement(switche);
                            dba.AddToEquipement(modem);

                            dba.AddToLiaison(framerelay);
                            dba.AddToLiaison(adsl);
                            dba.AddToResponsabilité(r);

                            dba.SaveChanges();
                            Utilitaire.Utilites.MSG(msgboxpanel, "L'agence de : " + agence.Adresse + " a été ajoutée à la base avec succés", "Ajout Avec Succés");
                     
                        }
                    }
                    catch (System.Data.SqlClient.SqlException sql) { Utilitaire.Utilites.MSG(msgboxpanel, sql.Message, "Sql Error"); }
                    Response.Redirect(Request.RawUrl);
                }
                else 
                {
                    Utilitaire.Utilites.MSG(msgboxpanel, "Responsable Assigné a une autre mission ..", "");
                }
            }
            else
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Responsable manquant ..", "");
            }
        }
        protected void Assigned_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Autres.SelectedItem != null)
            {
                Autres.SelectedItem.Selected = false;
            }
        }
        protected void Autres_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Assigned.SelectedItem != null)
            {
                Assigned.SelectedItem.Selected = false;
            }
        }

        protected void TextBoxAgenceAdressIP_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(TextBoxAgenceAdressIP.Text)) { }
            else { TextBoxAgenceAdressIP.Text = null; }
        }
        protected void IP1_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(TextBoxAgenceAdressIP1.Text) || (String.IsNullOrEmpty(TextBoxAgenceAdressIP2.Text)) || (String.IsNullOrEmpty(TextBoxAgenceAdressIP3.Text)) || (String.IsNullOrEmpty(TextBoxAgenceAdressIP4.Text)))
            {

            }
            else 
            {
                try
                {
                ip1 = Int32.Parse(TextBoxAgenceAdressIP1.Text);
                if (ip1 >= 0 && ip1 <= 255)
                {
                    
                }
                else { 
                    TextBoxAgenceAdressIP1.Text = null;
                    ip1 = -1;
                }
                }
                catch (Exception x) 
                {
                    TextBoxAgenceAdressIP1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(TextBoxAgenceAdressIP2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {
                        
                    }
                    else { 
                        TextBoxAgenceAdressIP2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAgenceAdressIP2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(TextBoxAgenceAdressIP3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {
                        
                    }
                    else { TextBoxAgenceAdressIP3.Text = null;
                    ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAgenceAdressIP3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(TextBoxAgenceAdressIP4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {
                        
                    }
                    else { TextBoxAgenceAdressIP4.Text = null;
                    ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAgenceAdressIP4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    TextBoxAgenceAdressIP.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { TextBoxAgenceAdressIP.Text = null; }
            }
        }
        protected void TextBoxRouteurIP_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(TextBoxRouteurIP.Text)) { }
            else { TextBoxRouteurIP.Text = null; }
        }
        protected void RIP1_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(TextBoxRouteurIP1.Text) || (String.IsNullOrEmpty(TextBoxRouteurIP2.Text)) || (String.IsNullOrEmpty(TextBoxRouteurIP3.Text)) || (String.IsNullOrEmpty(TextBoxRouteurIP4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(TextBoxRouteurIP1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxRouteurIP1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxRouteurIP1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(TextBoxRouteurIP2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxRouteurIP2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxRouteurIP2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(TextBoxRouteurIP3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxRouteurIP3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxRouteurIP3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(TextBoxRouteurIP4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxRouteurIP4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxRouteurIP4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    TextBoxRouteurIP.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { TextBoxRouteurIP.Text = null; }
            }
        }
        protected void TextBoxSwitcheurIP_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(TextBoxSwitcheurIP.Text)) { }
            else { TextBoxSwitcheurIP.Text = null; }
        }
        protected void SIP1_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(TextBoxSwitcheurIP1.Text) || (String.IsNullOrEmpty(TextBoxSwitcheurIP2.Text)) || (String.IsNullOrEmpty(TextBoxSwitcheurIP3.Text)) || (String.IsNullOrEmpty(TextBoxSwitcheurIP4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(TextBoxSwitcheurIP1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxSwitcheurIP1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxSwitcheurIP1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(TextBoxSwitcheurIP2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxSwitcheurIP2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxSwitcheurIP2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(TextBoxSwitcheurIP3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxSwitcheurIP3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxSwitcheurIP3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(TextBoxSwitcheurIP4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxSwitcheurIP4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxSwitcheurIP4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    TextBoxSwitcheurIP.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { TextBoxSwitcheurIP.Text = null; }
            }
        }
        protected void TextBoxAdslAdresseTunnel_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(TextBoxAdslAdresseTunnel.Text)) { }
            else { TextBoxAdslAdresseTunnel.Text = null; }
        }
        protected void ATIP1_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(TextBoxAdslAdresseTunnel1.Text) || (String.IsNullOrEmpty(TextBoxAdslAdresseTunnel2.Text)) || (String.IsNullOrEmpty(TextBoxAdslAdresseTunnel3.Text)) || (String.IsNullOrEmpty(TextBoxAdslAdresseTunnel4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(TextBoxAdslAdresseTunnel1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseTunnel1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseTunnel1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(TextBoxAdslAdresseTunnel2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseTunnel2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseTunnel2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(TextBoxAdslAdresseTunnel3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseTunnel3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseTunnel3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(TextBoxAdslAdresseTunnel4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseTunnel4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseTunnel4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    TextBoxAdslAdresseTunnel.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { TextBoxAdslAdresseTunnel.Text = null; }
            }
        }
        protected void TextBoxAdslAdresseCarte_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(TextBoxAdslAdresseCarte.Text)) { }
            else { TextBoxAdslAdresseCarte.Text = null; }
        }
        protected void ACIP1_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(TextBoxAdslAdresseCarte1.Text) || (String.IsNullOrEmpty(TextBoxAdslAdresseCarte2.Text)) || (String.IsNullOrEmpty(TextBoxAdslAdresseCarte3.Text)) || (String.IsNullOrEmpty(TextBoxAdslAdresseCarte4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(TextBoxAdslAdresseCarte1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseCarte1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseCarte1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(TextBoxAdslAdresseCarte2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseCarte2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseCarte2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(TextBoxAdslAdresseCarte3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseCarte3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseCarte3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(TextBoxAdslAdresseCarte4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxAdslAdresseCarte4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxAdslAdresseCarte4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    TextBoxAdslAdresseCarte.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { TextBoxAdslAdresseCarte.Text = null; }
            }
        }
        protected void TextBoxFrameRelayAdresseIP_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(TextBoxFrameRelayAdresseIP.Text)) { }
            else { TextBoxFrameRelayAdresseIP.Text = null; }
        }
        protected void FIP1_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(TextBoxFrameRelayAdresseIP1.Text) || (String.IsNullOrEmpty(TextBoxFrameRelayAdresseIP2.Text)) || (String.IsNullOrEmpty(TextBoxFrameRelayAdresseIP3.Text)) || (String.IsNullOrEmpty(TextBoxFrameRelayAdresseIP4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(TextBoxFrameRelayAdresseIP1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxFrameRelayAdresseIP1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxFrameRelayAdresseIP1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(TextBoxFrameRelayAdresseIP2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxFrameRelayAdresseIP2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxFrameRelayAdresseIP2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(TextBoxFrameRelayAdresseIP3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxFrameRelayAdresseIP3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxFrameRelayAdresseIP3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(TextBoxFrameRelayAdresseIP4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        TextBoxFrameRelayAdresseIP4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    TextBoxFrameRelayAdresseIP4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    TextBoxFrameRelayAdresseIP.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { TextBoxFrameRelayAdresseIP.Text = null; }
            }
        }
        protected void TextBoxRouteurMac_TextChanged(object sender, EventArgs e)
        {
            if (Utilitaire.Utilites.CheckMacAddr(TextBoxRouteurMac.Text))
            {

            }
            else { TextBoxRouteurMac.Text = null; }
        }
        protected void Rmac_TextChanged(object sender, EventArgs e)
        {
            String Mac1 = null;
            String Mac2 = null;
            String Mac3 = null;
            String Mac4 = null;
            String Mac5 = null;
            String Mac6 = null;
            if (String.IsNullOrEmpty(TextBoxRouteurMac1.Text) || (String.IsNullOrEmpty(TextBoxRouteurMac2.Text)) || (String.IsNullOrEmpty(TextBoxRouteurMac3.Text)) || (String.IsNullOrEmpty(TextBoxRouteurMac4.Text)) || (String.IsNullOrEmpty(TextBoxRouteurMac5.Text)) || (String.IsNullOrEmpty(TextBoxRouteurMac6.Text)))
            {

            }
            else
            {
                if(Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac1.Text))
                {
                Mac1 = TextBoxRouteurMac1.Text;
                }
                else
                {
                Mac1 = null; 
                TextBoxRouteurMac1.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac2.Text))
                {
                    Mac2 = TextBoxRouteurMac2.Text;
                }
                else
                {
                    Mac2 = null;
                    TextBoxRouteurMac2.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac3.Text))
                {
                    Mac3 = TextBoxRouteurMac3.Text;
                }
                else
                {
                    Mac3 = null;
                    TextBoxRouteurMac3.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac4.Text))
                {
                    Mac4 = TextBoxRouteurMac4.Text;
                }
                else
                {
                    Mac4 = null;
                    TextBoxRouteurMac4.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac5.Text))
                {
                    Mac5 = TextBoxRouteurMac5.Text;
                }
                else
                {
                    Mac5 = null;
                    TextBoxRouteurMac5.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac6.Text))
                {
                    Mac6 = TextBoxRouteurMac6.Text;
                }
                else
                {
                    Mac6 = null;
                    TextBoxRouteurMac6.Text = null;
                }
                if (Mac1 != null && Mac2 != null && Mac3 != null && Mac4 != null && Mac5 != null && Mac6 != null)
                {
                    TextBoxRouteurMac.Text = Mac1 + "-" + Mac2 + "-" + Mac3 + "-" + Mac4 + "-" + Mac5 + "-" + Mac6;
                }
                else { TextBoxRouteurMac.Text = null; }
                
            }
        }
        protected void TextBoxSwitcheurMac_TextChanged(object sender, EventArgs e)
        {
            if (Utilitaire.Utilites.CheckMacAddr(TextBoxSwitcheurMac.Text))
            {

            }
            else { TextBoxSwitcheurMac.Text = null; }
        }
        protected void Smac_TextChanged(object sender, EventArgs e)
        {
            String Mac1 = null;
            String Mac2 = null;
            String Mac3 = null;
            String Mac4 = null;
            String Mac5 = null;
            String Mac6 = null;
            if (String.IsNullOrEmpty(TextBoxSwitcheurMac1.Text) || (String.IsNullOrEmpty(TextBoxSwitcheurMac2.Text)) || (String.IsNullOrEmpty(TextBoxSwitcheurMac3.Text)) || (String.IsNullOrEmpty(TextBoxSwitcheurMac4.Text)) || (String.IsNullOrEmpty(TextBoxSwitcheurMac5.Text)) || (String.IsNullOrEmpty(TextBoxSwitcheurMac6.Text)))
            {

            }
            else
            {
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxSwitcheurMac1.Text))
                {
                    Mac1 = TextBoxSwitcheurMac1.Text;
                }
                else
                {
                Mac1 = null;
                TextBoxSwitcheurMac1.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxSwitcheurMac2.Text))
                {
                    Mac2 = TextBoxSwitcheurMac2.Text;
                }
                else
                {
                    Mac2 = null;
                    TextBoxSwitcheurMac2.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxSwitcheurMac3.Text))
                {
                    Mac3 = TextBoxSwitcheurMac3.Text;
                }
                else
                {
                    Mac3 = null;
                    TextBoxSwitcheurMac3.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxSwitcheurMac4.Text))
                {
                    Mac4 = TextBoxSwitcheurMac4.Text;
                }
                else
                {
                    Mac4 = null;
                    TextBoxSwitcheurMac4.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxSwitcheurMac5.Text))
                {
                    Mac5 = TextBoxSwitcheurMac5.Text;
                }
                else
                {
                    Mac5 = null;
                    TextBoxSwitcheurMac5.Text = null;
                }
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxSwitcheurMac6.Text))
                {
                    Mac6 = TextBoxSwitcheurMac6.Text;
                }
                else
                {
                    Mac6 = null;
                    TextBoxSwitcheurMac6.Text = null;
                }
                if (Mac1 != null && Mac2 != null && Mac3 != null && Mac4 != null && Mac5 != null && Mac6 != null)
                {
                    TextBoxSwitcheurMac.Text = Mac1 + "-" + Mac2 + "-" + Mac3 + "-" + Mac4 + "-" + Mac5 + "-" + Mac6;
                }
                else { TextBoxSwitcheurMac.Text = null; }
                
            }
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

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            LinkButton value = ((LinkButton)sender).Parent.FindControl("text") as LinkButton;
            wzd.ActiveStepIndex = Int32.Parse(value.Text)-1;
        }

        protected void ComboBox1_TextChanged(object sender, EventArgs e)
        {
            if (ComboBox1.Text != null)
            {
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    int Found = 0;
                    int Li = 0;
                    var req = from value in a.Responsables where value.Niveau == 3 && value.Role == 2 select value;
                    var res = req.ToList();
                    foreach (Helpdesk.Entities.Agences.Responsables r in res)
                    {
                        String Nom = r.Nom + " " + r.Prenom;
                        if (Nom.Contains(ComboBox1.Text))
                        {
                            ComboBox1.Text = Nom;
                            Found = 1;
                            foreach (EO.Web.ListBoxItem li in Assigned.Items)
                            {
                                if ((li.Text == Nom) && (li.Value == r.ID.ToString()))
                                {
                                    if (Assigned.SelectedItem != null)
                                    {
                                        Assigned.SelectedItem.Selected = false;
                                    }
                                    if (Autres.SelectedItem != null)
                                    {
                                        Autres.SelectedItem.Selected = false;
                                    }
                                    Assigned.Items[li.ItemIndex].Selected = true;
                                    Li = 1;
                                }
                            }
                            if (Li == 0)
                            {
                                foreach (EO.Web.ListBoxItem li in Autres.Items)
                                {
                                    if ((li.Text == Nom) && (li.Value == r.ID.ToString()))
                                    {
                                        if (Assigned.SelectedItem != null)
                                        {
                                            Assigned.SelectedItem.Selected = false;
                                        }
                                        if (Autres.SelectedItem != null)
                                        {
                                            Autres.SelectedItem.Selected = false;
                                        }
                                        Autres.Items[li.ItemIndex].Selected = true;
                                        Li = 1;
                                    }
                                }
                            }
                            break;
                        }
                    }
                    if (Found == 0 || Li == 0)
                    {
                        ComboBox1.Text = "";
                    }
                }

            }
            else
            {
                ComboBox1.Text = "";
            }
        }

        protected void CancelResp_Click(object sender, EventArgs e)
        {
            Assigned.DataSource = AssignedResponsable;
            Assigned.DataBind();

            using (Helpdesk.Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                var req = from value in dba.Agences select value;
                var res = req.ToList();
                if (res.Count == 0)
                {
                    AutreResponsable.SelectCommand = "SELECT DISTINCT Responsables.ID, Responsables.Nom + ' ' + Responsables.Prenom AS Detaille FROM Responsables WHERE (Responsables.Niveau = 3) AND (Responsables.Role = 2)";
                    Autres.DataSource = AutreResponsable;
                    Autres.DataBind();
                }
                else
                {
                    AutreResponsable.SelectCommand = "SELECT DISTINCT Responsables.ID, Responsables.Nom + ' ' + Responsables.Prenom AS Detaille FROM Responsables CROSS JOIN Agences WHERE (Responsables.Niveau = 3) AND (Responsables.Role = 2) AND (Responsables.ID NOT IN (SELECT Responsable FROM Agences AS Agences_1))";
                    Autres.DataSource = AutreResponsable;
                    Autres.DataBind();
                }
            }
        }

    }
     
}