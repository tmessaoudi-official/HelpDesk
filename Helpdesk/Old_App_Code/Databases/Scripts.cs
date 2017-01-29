using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace Helpdesk.Utilitaire.Databases
{
    public class Scripts
    {

        public static void LoginScript(HtmlContainerControl div, String username, String password)
        {
            try
            {
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Helpdesk.Entities.Agences.AgenceEntities())
                {
                    String encryptedpass = Utilitaire.Encryption.AESEncryption.Encrypt(password);
                    var req = from valeur in db.Responsables where (valeur.Username == username && valeur.Password == encryptedpass && (valeur.Niveau == 1 || valeur.Niveau == 2) && valeur.Role == 1) select valeur;
                    var r = req.FirstOrDefault();
                    if (r != null)
                    {
                        Utilites.MSG(div, "Login Successfull", "Successful");
                        HttpCookie userck = new HttpCookie("userInfo");
                        userck.Values["ID"] = r.ID.ToString();
                        userck.Values["Password"] = r.Password;
                        userck.Values["Username"] = r.Username;
                        userck.Values["Nom"] = r.Nom;
                        userck.Values["Email"] = r.Email;
                        userck.Values["Prenom"] = r.Prenom;
                        userck.Values["Level"] = r.Niveau.ToString();
                        userck.Expires = DateTime.Now.AddDays(30);
                        System.Web.HttpContext.Current.Response.Cookies.Add(userck);
                        Helpdesk.Entities.Agences.Historique_Login hislog = new Entities.Agences.Historique_Login() { ID_User = r.ID, Time = DateTime.Now.TimeOfDay, Date = DateTime.Now.Date, Hostname = Helpdesk.Utilitaire.Reseau.Network.GetHostname(), IPAdresse = Helpdesk.Utilitaire.Reseau.Network.GetIpLocale() };
                        db.AddToHistorique_Login(hislog);
                        db.SaveChanges();
                        Utilites.redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Utilites.MSG(div, "Your login was not found in database", "Invalid Login");
                    }
                }
            }
            catch (System.Data.SqlClient.SqlException sql) { Utilites.MSG(div, sql.Message, sql.Errors.ToString()); }
        }
        //to use in default.aspx
        public static void checksession(HtmlContainerControl div)
        {
            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
            {
                Utilites.redirect("../Default.aspx");
            }
            else
            {
                Utilites.redirect("login.aspx");
            }
        }
        public static void LogoutScript(HtmlContainerControl div)
        {
            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
            {
                HttpCookie userck = new HttpCookie("userInfo");
                userck.Expires = DateTime.Now.AddDays(-30);
                System.Web.HttpContext.Current.Response.Cookies.Add(userck);
                Utilites.redirect("login.aspx");
            }
        }
        //To use in Responsable.aspx
        public static void LoginStatut(HtmlContainerControl div, System.Web.UI.WebControls.Label LoginName)
        {
            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
            {
                int ID = Int32.Parse(System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"]);
                using (Helpdesk.Entities.Agences.AgenceEntities db = new Helpdesk.Entities.Agences.AgenceEntities())
                {
                    var req = from value in db.Responsables where (value.ID == ID) select value;
                    var r = req.FirstOrDefault();
                    if (r != null)
                    {
                        HttpCookie userck = new HttpCookie("userInfo");
                        userck.Values["ID"] = r.ID.ToString();
                        userck.Values["Password"] = r.Password;
                        userck.Values["Username"] = r.Username;
                        userck.Values["Nom"] = r.Nom;
                        userck.Values["Email"] = r.Email;
                        userck.Values["Prenom"] = r.Prenom;
                        userck.Values["Level"] = r.Niveau.ToString();
                        userck.Expires = System.Web.HttpContext.Current.Request.Cookies["userInfo"].Expires;
                        System.Web.HttpContext.Current.Response.Cookies.Add(userck);
                        LoginName.Text = r.Nom + " " + r.Prenom;
                    }
                    else {
                        HttpCookie userck = new HttpCookie("userInfo");
                        userck.Expires = DateTime.Now.AddDays(-30);
                        System.Web.HttpContext.Current.Response.Cookies.Add(userck);
                        Utilites.redirect("Account/login.aspx");
                    }
                }
            }
            else
            {
                Utilites.redirect("Account/login.aspx");
            }
        }
        public static void CheckStatut(HtmlContainerControl div)
        {

                    if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
                    {

                    }
                    else
                    {
                        Utilites.redirect("Account/login.aspx");
                    }

        }
        public static void Dashboard(HtmlContainerControl div)
        {
            try
            {
                using (Helpdesk.Entities.Agences.AgenceEntities dbses = new Helpdesk.Entities.Agences.AgenceEntities())
                {
                    if (System.Web.HttpContext.Current.Request.Cookies["userInfo"] != null)
                    {
                        Utilites.redirect("Dashboard.aspx");
                    }
                    else
                    {
                    }
                }
            }
            catch (System.Data.SqlClient.SqlException sql) { Utilites.MSG(div, sql.Message, sql.Errors.ToString()); }
        }
        public static void supprimerHistoriqueAgence(HtmlContainerControl div,String id)
        {
            try
            {
                int IDagence;
                IDagence = Int32.Parse(id);
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where value.ID == IDagence select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        var HisA = from val in ag.Historiques_Agences where val.Agence_ID == IDagence select val;
                        var ResHisA = HisA.ToList();
                        if (ResHisA != null)
                        {
                            foreach (Helpdesk.Entities.Agences.Historiques_Agences ha in ResHisA)
                            {
                                ag.DeleteObject(ha);
                            }
                        }
                        var eqq = from equip in ag.Equipement where equip.Agence_ID == res.ID select equip;
                        var eqqres = eqq.ToList();
                        foreach (Helpdesk.Entities.Agences.Equipement equ in eqqres)
                        {
                            Helpdesk.Entities.Agences.Routeurs r = eqqres.OfType<Helpdesk.Entities.Agences.Routeurs>().FirstOrDefault();
                            var HisR = from val in ag.Historiques_Routeurs where val.Routeur_ID == r.ID_Equipement select val;
                            var resHisR = HisR.ToList();
                            if (resHisR != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Routeurs hr in resHisR)
                                {
                                    ag.DeleteObject(hr);
                                }
                            }
                            Helpdesk.Entities.Agences.Switchers s = eqqres.OfType<Helpdesk.Entities.Agences.Switchers>().FirstOrDefault();
                            var HisS = from val in ag.Historiques_Switcheurs where val.Switcheur_ID == s.ID_Equipement select val;
                            var resHisS = HisS.ToList();
                            if (resHisS != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Switcheurs hs in resHisS)
                                {
                                    ag.DeleteObject(hs);
                                }
                            }

                            Helpdesk.Entities.Agences.Modems m = eqqres.OfType<Helpdesk.Entities.Agences.Modems>().FirstOrDefault();
                            var HisM = from val in ag.Historiques_Modems where val.Modem_ID == m.ID_Equipement select val;
                            var resHisM = HisM.ToList();
                            if (resHisM != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Modems hm in resHisM)
                                {
                                    ag.DeleteObject(hm);
                                }
                            }
                        }
                        var lii = from li in ag.Liaison where li.Agence_ID == res.ID select li;
                        var liires = lii.ToList();
                        foreach (Helpdesk.Entities.Agences.Liaison li in liires)
                        {
                            Helpdesk.Entities.Agences.Adsl ads = liires.OfType<Helpdesk.Entities.Agences.Adsl>().FirstOrDefault();
                            var HisAd = from val in ag.Historiques_Adsls where val.Adsl_ID == ads.ID_Liaison select val;
                            var resHisAd = HisAd.ToList();
                            if (resHisAd != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Adsls had in resHisAd)
                                {
                                    ag.DeleteObject(had);
                                }
                            }
                            Helpdesk.Entities.Agences.Framerelay Fr = liires.OfType<Helpdesk.Entities.Agences.Framerelay>().FirstOrDefault();
                            var Hisfr = from val in ag.Historiques_Framerelays where val.Framerelay_ID == Fr.ID_Liaison select val;
                            var resHisfr = Hisfr.ToList();
                            if (resHisfr != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Framerelays hfr in resHisfr)
                                {
                                    ag.DeleteObject(hfr);
                                }
                            }
                        }
                        var HisRes = from val in ag.Responsabilité where val.Agence_ID == res.ID && val.DateFin != null select val;
                        var resHisRes = HisRes.ToList();
                        if (resHisRes != null)
                        {
                            foreach (Helpdesk.Entities.Agences.Responsabilité hres in resHisRes)
                            {
                                ag.DeleteObject(hres);
                            }
                        }
                        ag.SaveChanges();


                    }

                    }
            }
            catch (System.Data.SqlClient.SqlException sql) { Utilitaire.Utilites.MSG(div, sql.Message, sql.ErrorCode.ToString()); }
        }
        public static void supprimerAgence(HtmlContainerControl div,String id)
        {
            
            try
            {
                int IDagence;
                IDagence = Int32.Parse(id);
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Agences where value.ID == IDagence select value;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        var HisA = from val in ag.Historiques_Agences where val.Agence_ID == IDagence select val;
                        var ResHisA = HisA.ToList();
                        if (ResHisA != null)
                        {
                            foreach (Helpdesk.Entities.Agences.Historiques_Agences ha in ResHisA)
                            {
                                ag.DeleteObject(ha);
                            }
                        }
                        String Adress = res.Nom+", "+res.Adresse;

                        var eqq = from equip in ag.Equipement where equip.Agence_ID == res.ID select equip;
                        var eqqres = eqq.ToList();
                        foreach( Helpdesk.Entities.Agences.Equipement equ in eqqres )
                        {
                            Helpdesk.Entities.Agences.Routeurs r = eqqres.OfType<Helpdesk.Entities.Agences.Routeurs>().FirstOrDefault();
                            var HisR = from val in ag.Historiques_Routeurs where val.Routeur_ID == r.ID_Equipement select val;
                            var resHisR = HisR.ToList();
                            if (resHisR != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Routeurs hr in resHisR)
                                {
                                    ag.DeleteObject(hr);
                                }
                            }
                            ag.DeleteObject(r);
                            Helpdesk.Entities.Agences.Switchers s = eqqres.OfType<Helpdesk.Entities.Agences.Switchers>().FirstOrDefault();
                            var HisS = from val in ag.Historiques_Switcheurs where val.Switcheur_ID == s.ID_Equipement select val;
                            var resHisS = HisS.ToList();
                            if (resHisS != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Switcheurs hs in resHisS)
                                {
                                    ag.DeleteObject(hs);
                                }
                            }
                            ag.DeleteObject(s);
                            Helpdesk.Entities.Agences.Modems m = eqqres.OfType<Helpdesk.Entities.Agences.Modems>().FirstOrDefault();
                            var HisM = from val in ag.Historiques_Modems where val.Modem_ID == m.ID_Equipement select val;
                            var resHisM = HisM.ToList();
                            if (resHisM != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Modems hm in resHisM)
                                {
                                    ag.DeleteObject(hm);
                                }
                            }
                            ag.DeleteObject(m);
                        }

                        var lii = from li in ag.Liaison where li.Agence_ID == res.ID select li;
                        var liires = lii.ToList();
                        foreach (Helpdesk.Entities.Agences.Liaison li in liires)
                        {
                            Helpdesk.Entities.Agences.Adsl ads = liires.OfType<Helpdesk.Entities.Agences.Adsl>().FirstOrDefault();
                            var HisAd = from val in ag.Historiques_Adsls where val.Adsl_ID == ads.ID_Liaison select val;
                            var resHisAd = HisAd.ToList();
                            if (resHisAd != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Adsls had in resHisAd)
                                {
                                    ag.DeleteObject(had);
                                }
                            }
                            ag.DeleteObject(ads);
                            Helpdesk.Entities.Agences.Framerelay Fr = liires.OfType<Helpdesk.Entities.Agences.Framerelay>().FirstOrDefault();
                            var Hisfr = from val in ag.Historiques_Framerelays where val.Framerelay_ID == Fr.ID_Liaison select val;
                            var resHisfr = Hisfr.ToList();
                            if (resHisfr != null)
                            {
                                foreach (Helpdesk.Entities.Agences.Historiques_Framerelays hfr in resHisfr)
                                {
                                    ag.DeleteObject(hfr);
                                }
                            }
                            ag.DeleteObject(Fr);
                        }
                        var HisRes = from val in ag.Responsabilité where val.Agence_ID == res.ID select val;
                        var resHisRes = HisRes.ToList();
                        if (resHisRes != null)
                        {
                            foreach (Helpdesk.Entities.Agences.Responsabilité hres in resHisRes)
                            {
                                ag.DeleteObject(hres);
                            }
                        }

                        ag.DeleteObject(res);
                        ag.SaveChanges();
                         
                        Utilitaire.Utilites.MSG(div, "Suppression de l'agence "+Adress, "Suppression");
                    }


                }
            }
            catch (System.Data.SqlClient.SqlException sql) { Utilitaire.Utilites.MSG(div, sql.Message, sql.ErrorCode.ToString()); }
        }
    }
}