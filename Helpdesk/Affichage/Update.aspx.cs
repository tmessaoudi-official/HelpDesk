using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class Update : System.Web.UI.Page
    {
        public static char[] separator1 = new char[] { '.' };
        public static char[] separator2 = new char[] { '-' };
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            LinkButton value = ((LinkButton)sender).Parent.FindControl("text") as LinkButton;
            wzd.ActiveStepIndex = Int32.Parse(value.Text)-1;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
            wzd.PreRender += new EventHandler(wzd_PreRender);
            int agence_ID = Int32.Parse(Request.QueryString["IDAgence"]);
            using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                var requete = from value in dba.Agences where (value.ID == agence_ID) select value;
                var result = requete.FirstOrDefault();
                ResponsableA.Value = result.Responsable.ToString();
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
        protected void wzd_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            
            if (Request.QueryString["IDAgence"] == null)
            { }
            else
            {

                if ((ComboBox1.Text != null) && ((Actuel.SelectedItem != null) || (Assigned.SelectedItem != null) || (Autres.SelectedItem != null)))
                {
                    int responsable = 0;
                    int agence_ID = Int32.Parse(Request.QueryString["IDAgence"]);

                    if (Actuel.SelectedItem != null)
                    {
                        responsable = Int32.Parse(Actuel.SelectedItem.Value);
                    }
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
                        var req = from value in a.Agences where value.ID != agence_ID select value;
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
                        int AgenceZone = Int32.Parse(DropDownListAgenceZone.SelectedValue);
                        
                        String Etatrouteur = DropDownListRouteurEtat.SelectedValue.ToString();
                        String Etatswitcheur = DropDownListSwitcheurEtat.SelectedValue.ToString();
                        String Etatmodem = DropDownListModemEtat.SelectedValue.ToString();
                        String EtatAdslTunnel = DropDownListAdslEtatTunnel.SelectedValue.ToString();
                        String EtatAdslCarte = DropDownListAdslEtatCarte.SelectedValue.ToString();
                        String EtatFramerelay = DropDownListFrarelayEtat.SelectedValue.ToString();
                        
                        String CurrentUser = null;
                        using (Helpdesk.Entities.Agences.AgenceEntities dba = new Helpdesk.Entities.Agences.AgenceEntities())
                        {
                            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
                            {
                                CurrentUser = System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Username"];
                            }
                            var requete = from value in dba.Agences where (value.ID == agence_ID) select value;
                            var result = requete.FirstOrDefault();
                            if (result != null)
                            {
                                IQueryable<Helpdesk.Entities.Agences.Equipement> Equipement = dba.Equipement.Where(eqi => eqi.Agence_ID == result.ID);
                                var Swit = Equipement.OfType<Helpdesk.Entities.Agences.Switchers>().First();
                                var Rout = Equipement.OfType<Helpdesk.Entities.Agences.Routeurs>().First();
                                var Mode = Equipement.OfType<Helpdesk.Entities.Agences.Modems>().First();

                                IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = dba.Liaison.Where(lii => lii.Agence_ID == result.ID);
                                var Ads = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>().First();
                                var fra = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>().First();

                                Helpdesk.Entities.Agences.Historiques_Modems mo = new Helpdesk.Entities.Agences.Historiques_Modems() { Personnel = CurrentUser, Modem_ID = Mode.ID_Equipement, Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Agence_ID = result.ID };
                                Helpdesk.Entities.Agences.Historiques_Routeurs ro = new Helpdesk.Entities.Agences.Historiques_Routeurs() { Personnel = CurrentUser, Routeur_ID = Rout.ID_Equipement, Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Agence_ID = result.ID };
                                Helpdesk.Entities.Agences.Historiques_Switcheurs sw = new Helpdesk.Entities.Agences.Historiques_Switcheurs() { Personnel = CurrentUser, Switcheur_ID = Swit.ID_Equipement, Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Agence_ID = result.ID };
                                Helpdesk.Entities.Agences.Historiques_Adsls ad = new Helpdesk.Entities.Agences.Historiques_Adsls() { Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Personnel = CurrentUser, Adsl_ID = Ads.ID_Liaison, Agence_ID = result.ID };
                                Helpdesk.Entities.Agences.Historiques_Framerelays fr = new Helpdesk.Entities.Agences.Historiques_Framerelays() { Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Personnel = CurrentUser, Framerelay_ID = fra.ID_Liaison, Agence_ID = result.ID };

                                Helpdesk.Entities.Agences.Historiques_Agences ag = new Helpdesk.Entities.Agences.Historiques_Agences() { Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Agence_ID = agence_ID, Personnel = CurrentUser, };


                                ag.Adresse = result.Adresse != TextBoxAgenceAdress.Text ? result.Adresse : "(*)";
                                ag.Zone = result.Zone != AgenceZone ? result.Zones.Libelle : "(*)";
                                ag.Description = result.Descriptions != TextBoxAgenceDescription.Text ? result.Descriptions : "(*)";
                                ag.Adresse_IP = result.Adresse_IP != TextBoxAgenceAdressIP.Text ? result.Adresse_IP : "(*)";
                                ag.Code = result.Code != TextBoxAgenceCode.Text ? result.Code : "(*)";
                                ag.Nom = result.Nom != TextBoxAgenceNom.Text ? result.Nom : "(*)";
                                ag.Equipement_Description = result.Equipement_Description != TextBoxEquipementDescription.Text ? result.Equipement_Description : "(*)";
                                ag.Liaison_Description = result.Liaison_Description != TextBoxLiaisonDescription.Text ? result.Liaison_Description : "(*)";
                                if (result.Adresse == TextBoxAgenceAdress.Text && result.Zone == AgenceZone 
                                    && result.Descriptions == TextBoxAgenceDescription.Text && result.Adresse_IP == TextBoxAgenceAdressIP.Text 
                                    && result.Code == TextBoxAgenceCode.Text && result.Nom == TextBoxAgenceNom.Text 
                                    && result.Equipement_Description == TextBoxEquipementDescription.Text && result.Liaison_Description == TextBoxLiaisonDescription.Text)
                                {
                                }
                                else { dba.AddToHistoriques_Agences(ag); }

                                mo.Description = Mode.Description != TextBoxModemDescription.Text ? Mode.Description : "(*)";
                                mo.Etat = Mode.Etat != Etatmodem ? Mode.Etat : "(*)";
                                mo.Type = Mode.Type != TextBoxModemType.Text ? Mode.Type : "(*)";
                                mo.Model = Mode.Model != TextBoxModemModel.Text ? Mode.Model : "(*)";

                                if (Mode.Description == TextBoxModemDescription.Text && Mode.Etat == Etatmodem 
                                    && Mode.Type == TextBoxModemType.Text && Mode.Model == TextBoxModemModel.Text)
                                { }
                                else { dba.AddToHistoriques_Modems(mo); }

                                ro.Description = Rout.Description != TextBoxRouteurDescription.Text ? Rout.Description : "(*)";
                                ro.Adresse_IP = Rout.Adresse_IP != TextBoxRouteurIP.Text ? Rout.Adresse_IP : "(*)";
                                ro.Adresse_MAC = Rout.Adresse_MAC != TextBoxRouteurMac.Text ? Rout.Adresse_MAC : "(*)";
                                ro.Etat = Rout.Etat != Etatrouteur ? Rout.Etat : "(*)";
                                ro.Type = Rout.Type != TextBoxRouteurType.Text ? Rout.Type : "(*)";
                                ro.Model = Rout.Model != TextBoxRouteurModel.Text ? Rout.Model : "(*)";
                                if (Rout.Description == TextBoxRouteurDescription.Text && Rout.Adresse_IP == TextBoxRouteurIP.Text &&
                                    Rout.Adresse_MAC == TextBoxRouteurMac.Text && Rout.Etat == Etatrouteur && Rout.Type == TextBoxRouteurType.Text
                                    && Rout.Model == TextBoxRouteurModel.Text)
                                { }
                                else { dba.AddToHistoriques_Routeurs(ro); }

                                sw.Description = Swit.Description != TextBoxSwitcheurDescription.Text ? Swit.Description : "(*)";
                                sw.Adresse_IP = Swit.Adresse_IP != TextBoxSwitcheurIP.Text ? Swit.Adresse_IP : "(*)";
                                sw.Adresse_MAC = Swit.Adresse_MAC != TextBoxSwitcheurMac.Text ? Swit.Adresse_MAC : "(*)";
                                sw.Etat = Swit.Etat != Etatswitcheur ? Swit.Etat : "(*)";
                                sw.Type = Swit.Type != TextBoxSwitcheurType.Text ? Swit.Type : "(*)";
                                sw.Model = Swit.Model != TextBoxSwitcheurModel.Text ? Swit.Model : "(*)";
                                if (Swit.Description == TextBoxSwitcheurDescription.Text && Swit.Adresse_IP == TextBoxSwitcheurIP.Text &&
                                    Swit.Adresse_MAC == TextBoxSwitcheurMac.Text && Swit.Etat == Etatswitcheur && Swit.Type == TextBoxSwitcheurType.Text
                                    && Swit.Model == TextBoxSwitcheurModel.Text)
                                { }
                                else { dba.AddToHistoriques_Switcheurs(sw); }

                                ad.Description = Ads.Description != TextBoxAdslDescription.Text ? Ads.Description : "(*)";
                                ad.Adresse_Carte = Ads.Adresse_Carte != TextBoxAdslAdresseCarte.Text ? Ads.Adresse_Carte : "(*)";
                                ad.Adresse_Tunnel = Ads.Adresse_IP != TextBoxAdslAdresseTunnel.Text ? Ads.Adresse_IP : "(*)";
                                ad.Etat_Tunnel = Ads.Etat != EtatAdslTunnel ? Ads.Etat : "(*)";
                                ad.Etat_Carte = Ads.Etat_Carte != EtatAdslCarte ? Ads.Etat_Carte : "(*)";

                                if (Ads.Description == TextBoxAdslDescription.Text && Ads.Adresse_Carte == TextBoxAdslAdresseCarte.Text
                                    && Ads.Adresse_IP == TextBoxAdslAdresseTunnel.Text && Ads.Etat == EtatAdslTunnel && Ads.Etat_Carte == EtatAdslCarte)
                                { }
                                else { dba.AddToHistoriques_Adsls(ad); }

                                fr.Description = fra.Description != TextBoxFramerelayDescription.Text ? fra.Description : "(*)";
                                fr.Adresse_IP = fra.Adresse_IP != TextBoxFrameRelayAdresseIP.Text ? fra.Adresse_IP : "(*)";
                                fr.Etat = fra.Etat != EtatFramerelay ? fra.Etat : "(*)";

                                if (fra.Description == TextBoxFramerelayDescription.Text && fra.Adresse_IP == TextBoxFrameRelayAdresseIP.Text
                                    && fra.Etat == EtatFramerelay)
                                { }
                                else { dba.AddToHistoriques_Framerelays(fr); }

                                if (responsable != result.Responsable)
                                {
                                    var resp = result.Responsabilité.Where(res => res.DateFin == null).FirstOrDefault();
                                    if (resp != null)
                                    { resp.DateFin = DateTime.Now;
                                    resp.TimeFin = DateTime.Now.TimeOfDay;
                                    resp.Personnel = CurrentUser;
                                    }
                                    Helpdesk.Entities.Agences.Responsabilité r = new Entities.Agences.Responsabilité() { Agence_ID = agence_ID, Responsable_ID = responsable, DateDebut = DateTime.Now.Date, TimeDebut = DateTime.Now.TimeOfDay };
                                    dba.AddToResponsabilité(r);
                                }
                                

                                result.Descriptions = TextBoxAgenceDescription.Text;
                                result.Equipement_Description = TextBoxEquipementDescription.Text;
                                result.Liaison_Description = TextBoxLiaisonDescription.Text;
                                result.Adresse = TextBoxAgenceAdress.Text;
                                result.Zone = AgenceZone;
                                result.Responsable = responsable;
                                result.Equipement_Description = TextBoxEquipementDescription.Text;
                                result.Liaison_Description = TextBoxLiaisonDescription.Text;

                                Mode.Description = TextBoxModemDescription.Text;
                                Mode.Etat = Etatmodem;
                                Mode.Type = TextBoxModemType.Text;
                                Mode.Model = TextBoxModemModel.Text;

                                Rout.Description = TextBoxModemDescription.Text;
                                Rout.Adresse_IP = TextBoxRouteurIP.Text;
                                Rout.Adresse_MAC = TextBoxRouteurMac.Text;
                                Rout.Etat = Etatrouteur;
                                Rout.Type = TextBoxRouteurType.Text;
                                Rout.Model = TextBoxRouteurModel.Text;

                                Swit.Description = TextBoxSwitcheurDescription.Text;
                                Swit.Adresse_IP = TextBoxSwitcheurIP.Text;
                                Swit.Adresse_MAC = TextBoxSwitcheurMac.Text;
                                Swit.Etat = Etatswitcheur;
                                Swit.Type = TextBoxSwitcheurType.Text;
                                Swit.Model = TextBoxSwitcheurModel.Text;

                                Ads.Description = TextBoxAdslDescription.Text;
                                Ads.Adresse_Carte = TextBoxAdslAdresseCarte.Text;
                                Ads.Adresse_IP = TextBoxAdslAdresseTunnel.Text;
                                Ads.Etat = EtatAdslTunnel;
                                Ads.Etat = EtatAdslCarte;

                                fra.Description = TextBoxFramerelayDescription.Text;
                                fra.Adresse_IP = TextBoxFrameRelayAdresseIP.Text;
                                fra.Etat = EtatFramerelay;

                                dba.SaveChanges();
                                Response.Redirect(Request.RawUrl);
                            }
                        }

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
                    else
                    {
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
                    else
                    {
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
                    else
                    {
                        TextBoxAgenceAdressIP3.Text = null;
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
                    else
                    {
                        TextBoxAgenceAdressIP4.Text = null;
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
                if (Utilitaire.Utilites.CheckMacSplit(TextBoxRouteurMac1.Text))
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

        protected void Actuel_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (Assigned.SelectedItem != null)
            {
                Assigned.SelectedItem.Selected = false;
            }
            if (Autres.SelectedItem != null)
            {
                Autres.SelectedItem.Selected = false;
            }
        }

        protected void Assigned_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Actuel.SelectedItem != null)
            {
                Actuel.SelectedItem.Selected = false;
            }
            if (Autres.SelectedItem != null)
            {
                Autres.SelectedItem.Selected = false;
            }
        }
        protected void Autres_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Actuel.SelectedItem != null)
            {
                Actuel.SelectedItem.Selected = false;
            }
            if (Assigned.SelectedItem != null)
            {
                Assigned.SelectedItem.Selected = false;
            }
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
                            foreach (EO.Web.ListBoxItem li in Actuel.Items)
                            {
                                if ((li.Text == Nom) && (li.Value == r.ID.ToString()))
                                {
                                    if (Actuel.SelectedItem != null)
                                    {
                                        Actuel.SelectedItem.Selected = false;
                                    }
                                    if (Assigned.SelectedItem != null)
                                    {
                                        Assigned.SelectedItem.Selected = false;
                                    }
                                    if (Autres.SelectedItem != null)
                                    {
                                        Autres.SelectedItem.Selected = false;
                                    }
                                    Actuel.Items[li.ItemIndex].Selected = true;
                                    Li = 1;
                                }
                            }
                            if (Li == 0)
                            {
                                foreach (EO.Web.ListBoxItem li in Assigned.Items)
                                {
                                    if ((li.Text == Nom) && (li.Value == r.ID.ToString()))
                                    {
                                        if (Actuel.SelectedItem != null)
                                        {
                                            Actuel.SelectedItem.Selected = false;
                                        }
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
                            }
                            if (Li == 0)
                            {
                                foreach (EO.Web.ListBoxItem li in Autres.Items)
                                {
                                    if ((li.Text == Nom) && (li.Value == r.ID.ToString()))
                                    {
                                        if (Actuel.SelectedItem != null)
                                        {
                                            Actuel.SelectedItem.Selected = false;
                                        }
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
        public String Mission(int ID)
        {
            String Output = null;
            using (Helpdesk.Entities.Agences.AgenceEntities dbag = new Entities.Agences.AgenceEntities())
            {
                var req = from value in dbag.Agences where value.Responsable == ID select value;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    int agence_ID = Int32.Parse(Request.QueryString["IDAgence"]);
                    if (res.ID == agence_ID)
                    {
                        Output = "Current";
                    }
                    else
                    {
                        Output = (res.Zones.Libelle + ", " + res.Nom);
                    }
                }
                else
                {
                    Output = ("Free");
                }
            }
            return Output;
        }
        protected void CancelResp_Click(object sender, EventArgs e)
        {

            Actuel.DataSource = ActualResponsable;
            Actuel.DataBind();

            Assigned.DataSource = AssignedResponsable;
            Assigned.DataBind();

            Autres.DataSource = AutreResponsable;
            Autres.DataBind();
        }

        protected void Initialiser_Click(object sender, EventArgs e)
        {
            int agence_ID = Int32.Parse(Request.QueryString["IDAgence"]);
            using (Entities.Agences.AgenceEntities dba = new Entities.Agences.AgenceEntities())
            {
                    var requete = from value in dba.Agences where (value.ID == agence_ID) select value;
                    var result = requete.FirstOrDefault();
                    if (result != null)
                    {

                        DropDownListAgenceZone.SelectedValue = result.Zone.ToString();
                        

                        TextBoxAgenceAdress.Text = result.Adresse;
                        TextBoxAgenceCode.Text = result.Code;
                        TextBoxAgenceNom.Text = result.Nom;
                        TextBoxAgenceAdressIP.Text = result.Adresse_IP;
                        String[] ipag = result.Adresse_IP.Split(separator1);
                        TextBoxAgenceAdressIP1.Text = ipag[0];
                        TextBoxAgenceAdressIP2.Text = ipag[1];
                        TextBoxAgenceAdressIP3.Text = ipag[2];
                        TextBoxAgenceAdressIP4.Text = ipag[3];
                        TextBoxAgenceAdressIP.Text = TextBoxAgenceAdressIP1.Text + "." + TextBoxAgenceAdressIP2.Text + "." + TextBoxAgenceAdressIP3.Text + "." + TextBoxAgenceAdressIP4.Text;
                        String Nom = result.Responsable_Agence.Nom + " " + result.Responsable_Agence.Prenom;

                        ComboBox1.Text = Nom;
                        foreach (EO.Web.ListBoxItem li in Actuel.Items)
                        {
                            if ((li.Text == Nom) && (li.Value == result.Responsable_Agence.ID.ToString()))
                            {
                                if (Actuel.SelectedItem != null)
                                {
                                    Actuel.SelectedItem.Selected = false;
                                }
                                Actuel.Items[li.ItemIndex].Selected = true;
                            }
                        }
                        TextBoxAgenceDescription.Text = result.Descriptions;

                        TextBoxEquipementDescription.Text = result.Equipement_Description;

                        IQueryable<Helpdesk.Entities.Agences.Equipement> Equipement = dba.Equipement.Where(eq => eq.Agence_ID == result.ID);
                        var router = Equipement.OfType<Helpdesk.Entities.Agences.Routeurs>();
                        var switche = Equipement.OfType<Helpdesk.Entities.Agences.Switchers>();
                        var Mode = Equipement.OfType<Helpdesk.Entities.Agences.Modems>();
                        DropDownListRouteurEtat.SelectedValue = router.FirstOrDefault().Etat.ToString();
                        TextBoxRouteurType.Text = router.FirstOrDefault().Type;
                        TextBoxRouteurModel.Text = router.FirstOrDefault().Model;
                        String[] ipro = router.FirstOrDefault().Adresse_IP.Split(separator1);
                        TextBoxRouteurIP1.Text = ipro[0];
                        TextBoxRouteurIP2.Text = ipro[1];
                        TextBoxRouteurIP3.Text = ipro[2];
                        TextBoxRouteurIP4.Text = ipro[3];
                        TextBoxRouteurIP.Text = TextBoxRouteurIP1.Text + "." + TextBoxRouteurIP2.Text + "." + TextBoxRouteurIP3.Text + "." + TextBoxRouteurIP4.Text;
                        String[] MacRo = router.FirstOrDefault().Adresse_MAC.Split(separator2);
                        TextBoxRouteurMac1.Text = MacRo[0];
                        TextBoxRouteurMac2.Text = MacRo[1];
                        TextBoxRouteurMac3.Text = MacRo[2];
                        TextBoxRouteurMac4.Text = MacRo[3];
                        TextBoxRouteurMac5.Text = MacRo[4];
                        TextBoxRouteurMac6.Text = MacRo[5];
                        TextBoxRouteurMac.Text = router.FirstOrDefault().Adresse_MAC;
                        TextBoxRouteurDescription.Text = router.FirstOrDefault().Description;

                        DropDownListSwitcheurEtat.SelectedValue = switche.FirstOrDefault().Etat.ToString();
                        TextBoxSwitcheurType.Text = switche.FirstOrDefault().Type;
                        TextBoxSwitcheurModel.Text = switche.FirstOrDefault().Model;
                        String[] ipsw = switche.FirstOrDefault().Adresse_IP.Split(separator1);
                        TextBoxSwitcheurIP1.Text = ipsw[0];
                        TextBoxSwitcheurIP2.Text = ipsw[1];
                        TextBoxSwitcheurIP3.Text = ipsw[2];
                        TextBoxSwitcheurIP4.Text = ipsw[3];
                        TextBoxSwitcheurIP.Text = TextBoxSwitcheurIP1.Text + "." + TextBoxSwitcheurIP2.Text + "." + TextBoxSwitcheurIP3.Text + "." + TextBoxSwitcheurIP4.Text;
                        String[] MacSw = switche.FirstOrDefault().Adresse_MAC.Split(separator2);
                        TextBoxSwitcheurMac1.Text = MacSw[0];
                        TextBoxSwitcheurMac2.Text = MacSw[1];
                        TextBoxSwitcheurMac3.Text = MacSw[2];
                        TextBoxSwitcheurMac4.Text = MacSw[3];
                        TextBoxSwitcheurMac5.Text = MacSw[4];
                        TextBoxSwitcheurMac6.Text = MacSw[5];
                        TextBoxSwitcheurMac.Text = switche.FirstOrDefault().Adresse_MAC;

                        TextBoxSwitcheurDescription.Text = switche.FirstOrDefault().Description;

                        DropDownListModemEtat.SelectedValue = Mode.FirstOrDefault().Etat.ToString();
                        TextBoxModemType.Text = Mode.FirstOrDefault().Type;
                        TextBoxModemModel.Text = Mode.FirstOrDefault().Model;
                        TextBoxModemDescription.Text = Mode.FirstOrDefault().Description;

                        TextBoxLiaisonDescription.Text = result.Liaison_Description;
                        IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = dba.Liaison.Where(li => li.Agence_ID == result.ID);
                        var Ad = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>();
                        var Fr = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>();

                        DropDownListAdslEtatTunnel.SelectedValue = Ad.FirstOrDefault().Etat.ToString();
                        DropDownListAdslEtatCarte.SelectedValue = Ad.FirstOrDefault().Etat_Carte.ToString();
                        String[] ipat = Ad.FirstOrDefault().Adresse_IP.Split(separator1);
                        TextBoxAdslAdresseTunnel1.Text = ipat[0];
                        TextBoxAdslAdresseTunnel2.Text = ipat[1];
                        TextBoxAdslAdresseTunnel3.Text = ipat[2];
                        TextBoxAdslAdresseTunnel4.Text = ipat[3];
                        TextBoxAdslAdresseTunnel.Text = TextBoxAdslAdresseTunnel1.Text + "." + TextBoxAdslAdresseTunnel2.Text + "." + TextBoxAdslAdresseTunnel3.Text + "." + TextBoxAdslAdresseTunnel4.Text;

                        String[] ipac = Ad.FirstOrDefault().Adresse_Carte.Split(separator1);
                        TextBoxAdslAdresseCarte1.Text = ipac[0];
                        TextBoxAdslAdresseCarte2.Text = ipac[1];
                        TextBoxAdslAdresseCarte3.Text = ipac[2];
                        TextBoxAdslAdresseCarte4.Text = ipac[3];
                        TextBoxAdslAdresseCarte.Text = TextBoxAdslAdresseCarte1.Text + "." + TextBoxAdslAdresseCarte2.Text + "." + TextBoxAdslAdresseCarte3.Text + "." + TextBoxAdslAdresseCarte4.Text;
                        TextBoxAdslDescription.Text = Ad.FirstOrDefault().Description;

                        DropDownListFrarelayEtat.SelectedValue = Fr.FirstOrDefault().Etat.ToString();
                        String[] ipf = Fr.FirstOrDefault().Adresse_IP.Split(separator1);
                        TextBoxFrameRelayAdresseIP1.Text = ipf[0];
                        TextBoxFrameRelayAdresseIP2.Text = ipf[1];
                        TextBoxFrameRelayAdresseIP3.Text = ipf[2];
                        TextBoxFrameRelayAdresseIP4.Text = ipf[3];
                        TextBoxFrameRelayAdresseIP.Text = TextBoxFrameRelayAdresseIP1.Text + "." + TextBoxFrameRelayAdresseIP2.Text + "." + TextBoxFrameRelayAdresseIP3.Text + "." + TextBoxFrameRelayAdresseIP4.Text;
                        TextBoxFramerelayDescription.Text = Fr.FirstOrDefault().Description;
                }
            }
        }
    }
}