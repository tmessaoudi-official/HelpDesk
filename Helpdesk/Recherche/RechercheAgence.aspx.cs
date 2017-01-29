using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class RechercheAgence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
           
        }
        protected void SubmitAdresse_Click(object sender, EventArgs e)
        {
            if ((String.IsNullOrEmpty(Adress.Text)))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Il faut remplire les champs D'adress", "Champs Vides");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where (value.Adresse == Adress.Text) select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        
                        Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                    }
                }
            }
        }
        protected void SubmitChangeR(object sender, EventArgs e)
        {
            if (ComboBox2.Text != null || CritereR.SelectedItem.Value != null)
            {
                if (CritereR.SelectedItem.Value == "Nom" || ComboBox2.Text == "Nom")
                {
                    Panel5.Visible = true;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                }
                else if (CritereR.SelectedItem.Value == "Email" || ComboBox2.Text == "Email")
                {
                    Panel5.Visible = false;
                    Panel6.Visible = true;
                    Panel7.Visible = false;
                }
                else if (CritereR.SelectedItem.Value == "Telephone" || ComboBox2.Text == "Telephone")
                {
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = true;
                }
            }
            else
            {
                Panel5.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }
        }
        protected void SubmitChangesH(object sender, EventArgs e)
        {
            EO.Web.ListBox a = (EO.Web.ListBox)sender;
            if (a.ID == "CritereH")
            {
                if (CritereH.SelectedItem.Value == "NomH")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = true;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
                else if (CritereH.SelectedItem.Value == "CodeH")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = true;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
                else if (CritereH.SelectedItem.Value == "IPH")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = true;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
                else if (CritereH.SelectedItem.Value == "Date")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = true;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
                else if (CritereH.SelectedItem.Value == "FR")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = true;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
                else if (CritereH.SelectedItem.Value == "AdslC")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = true;
                    Panel15.Visible = false;
                }
                else if (CritereH.SelectedItem.Value == "AdslT")
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = true;
                }
                else
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
            }
        }
        protected void SubmitChange(object sender, EventArgs e)
        {
            EO.Web.ListBox a = (EO.Web.ListBox)sender;
            if (a.ID == "Critere")
            {
                if (Critere.SelectedItem.Value != null)
                {
                    if (Critere.SelectedItem.Value == "Adresse")
                    {
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                        Panel5.Visible = false;
                        Panel6.Visible = false;
                        Panel7.Visible = false;
                        Panel8.Visible = false;
                        Panel9.Visible = false;
                        Panel10.Visible = false;
                        Panel11.Visible = false;
                        Panel12.Visible = false;
                        Panel13.Visible = false;
                        Panel14.Visible = false;
                        Panel15.Visible = false;


                    }
                    else if (Critere.SelectedItem.Value == "Code")
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                        Panel5.Visible = false;
                        Panel6.Visible = false;
                        Panel7.Visible = false;
                        Panel8.Visible = false;
                        Panel9.Visible = false;
                        Panel10.Visible = false;
                        Panel11.Visible = false;
                        Panel12.Visible = false;
                        Panel13.Visible = false;
                        Panel14.Visible = false;
                        Panel15.Visible = false;
                    }
                    else if (Critere.SelectedItem.Value == "Nom")
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = false;
                        Panel3.Visible = true;
                        Panel4.Visible = false;
                        Panel5.Visible = false;
                        Panel6.Visible = false;
                        Panel7.Visible = false;
                        Panel8.Visible = false;
                        Panel9.Visible = false;
                        Panel10.Visible = false;
                        Panel11.Visible = false;
                        Panel12.Visible = false;
                        Panel13.Visible = false;
                        Panel14.Visible = false;
                        Panel15.Visible = false;
                    }
                    else if (Critere.SelectedItem.Value == "IP")
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = true;
                        Panel5.Visible = false;
                        Panel6.Visible = false;
                        Panel7.Visible = false;
                        Panel8.Visible = false;
                        Panel9.Visible = false;
                        Panel10.Visible = false;
                        Panel11.Visible = false;
                        Panel12.Visible = false;
                        Panel13.Visible = false;
                        Panel14.Visible = false;
                        Panel15.Visible = false;
                    }
                    else if (Critere.SelectedItem.Value == "Responsable")
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        Panel4.Visible = false;
                        Panel5.Visible = false;
                        Panel6.Visible = false;
                        Panel7.Visible = false;
                        Panel8.Visible = true;
                        Panel9.Visible = false;
                        Panel10.Visible = false;
                        Panel11.Visible = false;
                        Panel12.Visible = false;
                        Panel13.Visible = false;
                        Panel14.Visible = false;
                        Panel15.Visible = false;
                    }
                }
                else
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    Panel6.Visible = false;
                    Panel7.Visible = false;
                    Panel8.Visible = false;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel11.Visible = false;
                    Panel12.Visible = false;
                    Panel13.Visible = false;
                    Panel14.Visible = false;
                    Panel15.Visible = false;
                }
            }
           
        }

        protected void SubmitCode_Click(object sender, EventArgs e)
        {
            if ((String.IsNullOrEmpty(Code.Text)))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Il faut Donnée le Code D'agence", "Champs Vides");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where (value.Code == Code.Text) select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                    }
                }
            }
        }

        protected void SubmitNom_Click(object sender, EventArgs e)
        {
            if ((String.IsNullOrEmpty(AgenceNom.Text)))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Il faut Donnée le Nom D'agence", "Champs Vides");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where (value.Nom == AgenceNom.Text) select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                    }
                }
            }
        }

        protected void ButtontIP_Click(object sender, EventArgs e)
        {
            if ((String.IsNullOrEmpty(IP.Text)))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Il faut Donnée l'adresse IP", "Champs Vides");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where (value.Adresse_IP == IP.Text) select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                    }
                }
            }
        }

        protected void SubmitResponsableNom_Click(object sender, EventArgs e)
        {
               if ((String.IsNullOrEmpty(Nom.Text)) || (String.IsNullOrEmpty(Prenom.Text)))
                        {
                            Utilitaire.Utilites.MSG(msgboxpanel, "Il faut remplire le nom et le prenom du responsable", "Champs Vides");
                        }
                        else
                        {
                            using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                            {
                                var req = from value in ag.Agences where (value.Responsable_Agence.Nom == Nom.Text && value.Responsable_Agence.Prenom == Prenom.Text) select value;
                                var res = req.FirstOrDefault();
                                if (res != null)
                                {
                                    Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                                }
                                else
                                {
                                    Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                                }
                            }
                        }
        }

        protected void Button1Email_Click(object sender, EventArgs e)
        {
               if (String.IsNullOrEmpty(Email.Text))
                        {
                            Utilitaire.Utilites.MSG(msgboxpanel, "Il faut remplire le l'email du responsable", "Champs Vides");
                        }
                        else
                        {
                            using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                            {
                                var req = from value in ag.Agences where (value.Responsable_Agence.Email == Email.Text) select value;
                                var res = req.FirstOrDefault();
                                if (res != null)
                                {
                                    Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                                }
                                else
                                {
                                    Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                                }
                            }
                        }
        }

        protected void SubmitResponsableTelephone_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Telephone.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Il faut remplire le Telephone du responsable", "Champs Vides");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where (value.Responsable_Agence.Teléphone == Telephone.Text) select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        Utilitaire.Utilites.ParentRed("../Affichage/AfficheAgence.aspx?IDAgence=" + res.ID.ToString());
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, "", "Agence Non Trouvée");
                    }
                }
            }
        }
        protected void IPf_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(IP.Text)) { }
            else { IP.Text = null; }
        }
        protected void IP_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(IP1.Text) || (String.IsNullOrEmpty(IP2.Text)) || (String.IsNullOrEmpty(IP3.Text)) || (String.IsNullOrEmpty(IP4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(IP1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        IP1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    IP1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(IP2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        IP2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    IP2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(IP3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        IP3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    IP3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(IP4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        IP4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    IP4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    IP.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { IP.Text = null; }
            }
        }
        protected void IPA_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(IP.Text)) { }
            else { IPA.Text = null; }
        }
        protected void IPAG_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(IPA1.Text) || (String.IsNullOrEmpty(IPA2.Text)) || (String.IsNullOrEmpty(IPA3.Text)) || (String.IsNullOrEmpty(IPA4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(IPA1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        IPA1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPA1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(IPA2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        IPA2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPA2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(IPA3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        IPA3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPA3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(IPA4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        IPA4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPA4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    IPA.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { IPA.Text = null; }
            }
        }


        protected void IPFR_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(IPF.Text)) { }
            else { IPF.Text = null; }
        }
        protected void IPFL_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(IPF1.Text) || (String.IsNullOrEmpty(IPF2.Text)) || (String.IsNullOrEmpty(IPF3.Text)) || (String.IsNullOrEmpty(IPF4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(IPF1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        IPF1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPF1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(IPF2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        IPF2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPF2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(IPF3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        IPF3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPF3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(IPF4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        IPF4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPF4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    IPF.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { IPF.Text = null; }
            }
        }
        protected void IPADC_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(IPAD.Text)) { }
            else { IPAD.Text = null; }
        }
        protected void IPAC_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(IPAD1.Text) || (String.IsNullOrEmpty(IPAD2.Text)) || (String.IsNullOrEmpty(IPAD3.Text)) || (String.IsNullOrEmpty(IPAD4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(IPAD1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        IPAD1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAD1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(IPAD2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        IPAD2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAD2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(IPAD3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        IPAD3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAD3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(IPAD4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        IPAD4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAD4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    IPAD.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { IPAD.Text = null; }
            }
        }
        protected void IPADT_TextChanged(object sender, EventArgs e)
        {
            if (Helpdesk.Utilitaire.Utilites.CheckIpAddr(IPAT.Text)) { }
            else { IPAT.Text = null; }
        }
        protected void IPAT_TextChanged(object sender, EventArgs e)
        {
            int ip1 = -1;
            int ip2 = -1;
            int ip3 = -1;
            int ip4 = -1;
            if (String.IsNullOrEmpty(IPAT1.Text) || (String.IsNullOrEmpty(IPAT2.Text)) || (String.IsNullOrEmpty(IPAT3.Text)) || (String.IsNullOrEmpty(IPAT4.Text)))
            {

            }
            else
            {
                try
                {
                    ip1 = Int32.Parse(IPAT1.Text);
                    if (ip1 >= 0 && ip1 <= 255)
                    {

                    }
                    else
                    {
                        IPAT1.Text = null;
                        ip1 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAT1.Text = null;
                    ip1 = -1;
                }
                try
                {
                    ip2 = Int32.Parse(IPAT2.Text);
                    if (ip2 >= 0 && ip2 <= 255)
                    {

                    }
                    else
                    {
                        IPAT2.Text = null;
                        ip2 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAT2.Text = null;
                    ip2 = -1;
                }
                try
                {
                    ip3 = Int32.Parse(IPAT3.Text);
                    if (ip3 >= 0 && ip3 <= 255)
                    {

                    }
                    else
                    {
                        IPAT3.Text = null;
                        ip3 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAT3.Text = null;
                    ip3 = -1;
                }
                try
                {
                    ip4 = Int32.Parse(IPAT4.Text);
                    if (ip4 >= 0 && ip4 <= 255)
                    {

                    }
                    else
                    {
                        IPAT4.Text = null;
                        ip4 = -1;
                    }
                }
                catch (Exception x)
                {
                    IPAT4.Text = null;
                    ip4 = -1;
                }
                if (ip1 != -1 && ip2 != -1 && ip3 != -1 && ip4 != -1)
                {
                    IPAT.Text = ip1 + "." + ip2 + "." + ip3 + "." + ip4;
                }
                else { IPAT.Text = null; }
            }
        }
        protected void RechercheHNom_Click(object sender, EventArgs e)
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
                        Utilitaire.Utilites.ParentRed("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void RechercheHCode_Click(object sender, EventArgs e)
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
                        Utilitaire.Utilites.ParentRed("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
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
            if (String.IsNullOrEmpty(IPA.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner l'@ IP d'agence", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in db.Agences where (value.Adresse_IP == IPA.Text) select value;
                    var res = req.FirstOrDefault();

                    if (res != null)
                    {
                        Utilitaire.Utilites.ParentRed("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
                    }
                    else
                    {
                        Utilitaire.Utilites.MSG(msgboxpanel, " Agence Non Trouvéé !! ", " Agence Non Trouvéé !! ");
                    }
                }
            }
        }

        protected void RechercheHDate_Click(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate.ToShortDateString().Equals("01/01/0001"))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Selectionner une Date Valide", "Date Invalide");
            }
            else
            {
                Utilitaire.Utilites.ParentRed("ResultRecherche.aspx?Date=" + Calendar1.SelectedDate.GetDateTimeFormats('d')[4]);
            }
        }

        protected void Submitframerelay_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(IPF.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner une @ IP", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    IQueryable<Helpdesk.Entities.Agences.Liaison> liaison = db.Liaison;
                    var frame = (Helpdesk.Entities.Agences.Framerelay)liaison.OfType<Helpdesk.Entities.Agences.Framerelay>().Where(fr => fr.Adresse_IP == IPF.Text);
                    if (frame != null)
                    {
                        var req = from value in db.Agences where (value.ID == frame.Agence_ID) select value;
                        var res = req.FirstOrDefault();
                        if (res != null)
                        {
                            Utilitaire.Utilites.ParentRed("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
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

        protected void SubmitAdslCarte_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(IPAD.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner une @ IP", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    IQueryable<Helpdesk.Entities.Agences.Liaison> liaison = db.Liaison;
                    var AdsCa = (Helpdesk.Entities.Agences.Adsl)liaison.OfType<Helpdesk.Entities.Agences.Adsl>().Where(ad => ad.Adresse_Carte == IPAD.Text);
                    if (AdsCa != null)
                    {
                        var req = from value in db.Agences where (value.ID == AdsCa.Agence_ID) select value;
                        var res = req.FirstOrDefault();
                        if (res != null)
                        {
                            Utilitaire.Utilites.ParentRed("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
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
            if (String.IsNullOrEmpty(IPAT.Text))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Donner une @ IP", "");
            }
            else
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Entities.Agences.AgenceEntities())
                {
                    IQueryable<Helpdesk.Entities.Agences.Liaison> liaison = db.Liaison;
                    var AdsTu = (Helpdesk.Entities.Agences.Adsl)liaison.OfType<Helpdesk.Entities.Agences.Adsl>().Where(ad => ad.Adresse_IP == IPAT.Text);
                    if (AdsTu != null)
                    {
                        var req = from value in db.Agences where (value.ID == AdsTu.Agence_ID) select value;
                        var res = req.FirstOrDefault();
                        if (res != null)
                        {
                            Utilitaire.Utilites.ParentRed("../Historique/AfficheHistorique.aspx?IDAgence=" + res.ID);
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