<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="Helpdesk.Check" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">   
<script runat="server">  
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }  
    protected void Timer1_Tick(object sender, System.EventArgs e)  
    {
        try
        {
            String Carte = "";
            String Tunnel = "";
            String Fr = "";
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Helpdesk.Entities.Agences.AgenceEntities())
            {

                All.Text = "";
                Current.Text = "";
                Type.Text = "";
                Etat.Text = "";
                
                
                var req = from value in a.Agences select value;

                var res = req.ToList();
                if (res != null)
                {
                var ress = req.Count();
                var ID = res[Count].ID;
                IQueryable<Helpdesk.Entities.Agences.Equipement> Equipement = a.Equipement.Where(eq => eq.Agence_ID == ID);
                var Swit = Equipement.OfType<Helpdesk.Entities.Agences.Switchers>().First();
                var Rout = Equipement.OfType<Helpdesk.Entities.Agences.Routeurs>().First();
                var Mode = Equipement.OfType<Helpdesk.Entities.Agences.Modems>().First();
                


                    Re++;
                    if (Re == 1)
                    {
                        IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = a.Liaison.Where(li => li.Agence_ID == ID);
                        var Ads = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>().First();
                        var fra = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>().First();
                        All.Text = ress + " Agences En Total";
                        Current.Text = "Agence : " + res[Count].Nom + ", N° : " + (Count + 1);
                        Type.Text = "Adsl Tunnel , Adresse IP : " + Ads.Adresse_IP;
                        Tunnel = SNMP(Ads.Adresse_IP);
                        Etat.Text = Tunnel;
                        
                        if ((Tunnel.Contains("Time Out") || Tunnel.Contains("2") || Tunnel.Contains("6")) && (Ads.Etat.Contains("Fonctionnel")))
                        {
                         playaudio("C:\\Helpdesk\\Helpdesk\\420.wav");
                         MsgBox1.Show("Panne Adsl Tunnel", "Tunnel Adsl est en panne", "", new MsgBoxButton("Ok"));
                         Helpdesk.Entities.Agences.Historiques_Adsls adc = new Helpdesk.Entities.Agences.Historiques_Adsls() { Personnel = "SNMP", Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Etat_Carte = "(*)", Etat_Tunnel = "Fonctionnel", Adresse_Carte = "(*)", Adresse_Tunnel = "(*)", Adsl_ID = Ads.ID_Liaison, Description = "(*)", Agence_ID = ID };
                            
                         a.AddToHistoriques_Adsls(adc);                         
                            
                         Ads.Etat = "En Panne";
                         a.SaveChanges();
                         String Title = "Panne Adsl Tunnel, Agence : "+res[Count].Nom+", Adresse : "+Ads.Adresse_IP;
                         String Body = "Une pannes detécter dans l'agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_IP
                             +" Date de detection : "+DateTime.Now.ToShortDateString()+" "+DateTime.Now.ToShortTimeString();
                         Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", res[Count].Responsable_Agence.Email, "", "",Title, Body);
                         Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Email"], "", "", Title, Body);
                         if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
                         {
                             var ree = from vale in a.Responsables where vale.Niveau == 1 select vale;
                             var rss = ree.FirstOrDefault();
                             if (rss != null)
                             {
                                 Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", rss.Email, "", "", Title, Body);
                             }
                         }
                            
                        }
                        
                        if ((Tunnel.Contains("1")) && (Ads.Etat.Contains("En Panne")))
                        {
                            MsgBox1.Show("Panne Adsl Tunnel Dégager", "Tunnel Adsl est Fonctionnel", "", new MsgBoxButton("Ok"));

                            Helpdesk.Entities.Agences.Historiques_Adsls adc = new Helpdesk.Entities.Agences.Historiques_Adsls() { Personnel = "SNMP", Date = DateTime.Now, Time = DateTime.Now.TimeOfDay, Etat_Carte = "(*)", Etat_Tunnel = "En Panne", Description = "(*)", Adresse_Carte = "(*)", Adresse_Tunnel = "(*)", Adsl_ID = Ads.ID_Liaison, Agence_ID = ID };

                            a.AddToHistoriques_Adsls(adc);

                            
                            Ads.Etat = "Fonctionnel";
                            a.SaveChanges();
                            String Title = "Adsl Tunnel Est fonctionnel, Agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_IP;
                            String Body = "La tunnel Adsl est fonctionnel dans l'agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_IP
                                + " Date de detection : " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", res[Count].Responsable_Agence.Email, "", "", Title, Body);
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Email"], "", "", Title, Body);
                            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
                            {
                                var ree = from vale in a.Responsables where vale.Niveau == 1 select vale;
                                var rss = ree.FirstOrDefault();
                                if (rss != null)
                                {
                                    Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", rss.Email, "", "", Title, Body);
                                }
                            }
                        }

                    }

                    
                    if (Re == 2)
                    {
                        IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = a.Liaison.Where(li => li.Agence_ID == ID);
                        var Ads = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>().First();
                        var fra = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>().First();
                        All.Text = ress + " Agences En Total";
                        Current.Text = "Agence : " + res[Count].Nom + ", N° : " + (Count + 1);
                        Type.Text = "Adsl Carte , Adresse IP : " + Ads.Adresse_Carte;
                        Carte = SNMP(Ads.Adresse_Carte);
                        Etat.Text = Carte;
                        if ((Carte.Contains("Time Out") || Carte.Contains("2") || Carte.Contains("6")) && (Ads.Etat_Carte.Contains("Fonctionnel")))
                        {
                            playaudio("C:\\Helpdesk\\Helpdesk\\420.wav");
                            MsgBox1.Show("Panne Carte Adsl", "Carte Adsl est en panne", "", new MsgBoxButton("Ok"));
                            Helpdesk.Entities.Agences.Historiques_Adsls adc = new Helpdesk.Entities.Agences.Historiques_Adsls() { Personnel = "SNMP", Date = DateTime.Now, Time = DateTime.Now.TimeOfDay, Etat_Carte = "Fonctionnel", Etat_Tunnel = "(*)", Adresse_Carte = "(*)", Adresse_Tunnel = "(*)", Adsl_ID = Ads.ID_Liaison, Agence_ID = ID, Description = "(*)" };

                            a.AddToHistoriques_Adsls(adc);
                            
                            Ads.Etat_Carte = "En Panne";
                            a.SaveChanges();
                            String Title = "Panne Adsl Carte, Agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_Carte;
                            String Body = "Une pannes detécter dans l'agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_Carte
                                + " Date de detection : " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", res[Count].Responsable_Agence.Email, "", "", Title, Body);
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Email"], "", "", Title, Body);
                            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
                            {
                                var ree = from vale in a.Responsables where vale.Niveau == 1 select vale;
                                var rss = ree.FirstOrDefault();
                                if (rss != null)
                                {
                                    Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", rss.Email, "", "", Title, Body);
                                }
                            }
                            
                        }
                        if ((Carte.Contains("1")) && (Ads.Etat_Carte.Contains("En Panne")))
                        {
                            MsgBox1.Show("Panne Carte Dégager", "Carte Adsl est Fonctionnel", "", new MsgBoxButton("Ok"));
                            Helpdesk.Entities.Agences.Historiques_Adsls adc = new Helpdesk.Entities.Agences.Historiques_Adsls() { Personnel = "SNMP", Date = DateTime.Now, Time = DateTime.Now.TimeOfDay, Etat_Carte = "En Panne", Etat_Tunnel = "(*)", Adresse_Carte = "(*)", Adresse_Tunnel = "(*)", ID = Ads.ID_Liaison, Agence_ID = ID, Description = "(*)" };
                            
                            a.AddToHistoriques_Adsls(adc);

                            Ads.Etat_Carte = "Fonctionnel";
                            a.SaveChanges();
                            String Title = "Adsl Carte Est fonctionnel, Agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_Carte;
                            String Body = "La Carte Adsl est fonctionnel dans l'agence : " + res[Count].Nom + ", Adresse : " + Ads.Adresse_Carte
                                + " Date de detection : " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", res[Count].Responsable_Agence.Email, "", "", Title, Body);
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Email"], "", "", Title, Body);
                            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
                            {
                                var ree = from vale in a.Responsables where vale.Niveau == 1 select vale;
                                var rss = ree.FirstOrDefault();
                                if (rss != null)
                                {
                                    Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", rss.Email, "", "", Title, Body);
                                }
                            }
                        }
                    }
                    
                    
                    if (Re == 3)
                    {
                        IQueryable<Helpdesk.Entities.Agences.Liaison> Liaison = a.Liaison.Where(li => li.Agence_ID == ID);
                        var Frame = Liaison.OfType<Helpdesk.Entities.Agences.Framerelay>().First();
                        var Ads = Liaison.OfType<Helpdesk.Entities.Agences.Adsl>().First();
                        All.Text = ress + " Agences En Total";
                        Current.Text = "Agence : " + res[Count].Nom + ", N° : " + (Count + 1);
                        Type.Text = "Frame Relay , Adresse IP : " + Frame.Adresse_IP;
                        Fr = SNMP(Frame.Adresse_IP);
                        Etat.Text = Fr;
                        if ((Fr.Contains("Time Out") || Fr.Contains("2") || Fr.Contains("6")) && (Frame.Etat.Contains("Fonctionnel")))
                        {
                            playaudio("C:\\Helpdesk\\Helpdesk\\420.wav");
                            MsgBox1.Show("Panne Frame Relay", "Frame Relay est en panne", "", new MsgBoxButton("Ok"));

                            Helpdesk.Entities.Agences.Historiques_Framerelays frc = new Helpdesk.Entities.Agences.Historiques_Framerelays() { Personnel = "SNMP", Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Adresse_IP = "(*)", Description = "(*)", Etat = "Fonctionnel", Framerelay_ID = Frame.ID_Liaison, Agence_ID = ID };
                            
                            a.AddToHistoriques_Framerelays(frc);

                            Frame.Etat = "En Panne";
                            a.SaveChanges();
                            String Title = "Panne Frame Relay, Agence : " + res[Count].Nom + ", Adresse : " + Frame.Adresse_IP;
                            String Body = "Une pannes detécter dans l'agence : " + res[Count].Nom + ", Adresse : " + Frame.Adresse_IP
                                + " Date de detection : " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", res[Count].Responsable_Agence.Email, "", "", Title, Body);
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Email"], "", "", Title, Body);
                            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
                            {
                                var ree = from vale in a.Responsables where vale.Niveau == 1 select vale;
                                var rss = ree.FirstOrDefault();
                                if (rss != null)
                                {
                                    Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", rss.Email, "", "", Title, Body);
                                }
                            }
                        }
                        
                        
                        if ((Fr.Contains("1")) && (Frame.Etat.Contains("En Panne")))
                        {
                            MsgBox1.Show("Panne Frame Relay Dégager", "Frame Relay est Fonctionnel", "", new MsgBoxButton("Ok"));
                            Helpdesk.Entities.Agences.Historiques_Framerelays frc = new Helpdesk.Entities.Agences.Historiques_Framerelays() { Personnel = "SNMP", Date = DateTime.Now.Date, Time = DateTime.Now.TimeOfDay, Adresse_IP = "(*)", Description = "(*)", Etat = "En Panne", Framerelay_ID = Frame.ID_Liaison, Agence_ID = ID };
                            a.AddToHistoriques_Framerelays(frc);


                            Frame.Etat = "Fonctionnel";
                            a.SaveChanges();
                            String Title = "Frame Relay Est fonctionnel, Agence : " + res[Count].Nom + ", Adresse : " + Frame.Adresse_IP;
                            String Body = "Frame Relay est fonctionnel dans l'agence : " + res[Count].Nom + ", Adresse : " + Frame.Adresse_IP
                                + " Date de detection : " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", res[Count].Responsable_Agence.Email, "", "", Title, Body);
                            Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Email"], "", "", Title, Body);
                            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
                            {
                                var ree = from vale in a.Responsables where vale.Niveau == 1 select vale;
                                var rss = ree.FirstOrDefault();
                                if (rss != null)
                                {
                                    Helpdesk.Utilitaire.Mail.Scripts.SendMailMessage("SNMPHelpdesk@Amenbank.com.tn", rss.Email, "", "", Title, Body);
                                }
                            }
                        }
                        Re = 0;
                        if ((Count >= ress - 1))
                        {
                            Count = 0;
                        }
                        else
                        {
                            Count++;
                        }
                    }
                }
                else
                {
                    MsgBox2.Show("Acune Agence", "Aucune Agence à controler", "", new EO.Web.MsgBoxButton("Ok"));
                }
            }
        }
        catch (Exception ex) { MsgBox2.Show("Exception", ex.Message, "", new MsgBoxButton("Ok")); }
    }
    protected void StopCheck_Click(object sender, EventArgs e)
    {
        if (Timer1.Enabled == true)
        { Timer1.Enabled = false; }
        else { }
    }
    protected void StartCheck_Click(object sender, EventArgs e)
    {
        if (Timer1.Enabled == false)
        { Timer1.Enabled = true; }
        else { }
    }
</script>  
<html xmlns="http://www.w3.org/1999/xhtml" >  
<head id="Head1" runat="server">  
    <title></title>  
    <link rel="Stylesheet" href="../Styles/main.css" />
    <style type="text/css">
        #form1
        {
            width: 189px;
            height: 169px;
        }
        #msgboxpanel
        {
            width: 193px;
        }
    </style>
</head>  
<body id="Body1" style="width: 187px; height: 255px; margin-right: 11px;" 
    runat="server">  
    <form id="form1" runat="server">  
            <div id="msgboxpanel" runat="server">
    </div>
    <div style="width: 188px; height: 132px">  
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
            <ContentTemplate>  
                <asp:Timer   
                    ID="Timer1"  
                    runat="server"  
                    Interval="60000"  
                    OnTick="Timer1_Tick"  
                    >  
                </asp:Timer>  
              <asp:Label runat="server" ID="All" ForeColor="Red"></asp:Label>
              <br />
              <asp:Label runat="server" ID="Current" ForeColor="#009900"></asp:Label>
              <br />
              <asp:Label runat="server" Text="" ID="Type"></asp:Label>
              <br />
              <asp:Label runat="server" Text="" ID="Etat"></asp:Label>
                        <br />
                        <br />
<br />
                        <br />
                <asp:Label ID="Label1" runat="server" Text="H : " Font-Names="Andalus" 
                    Font-Size="9pt" ForeColor="#009900"></asp:Label><asp:TextBox runat="server" ID="Hours" Width="30px"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="M : " Font-Names="Andalus" 
                    Font-Size="9pt" ForeColor="#009900"></asp:Label><asp:TextBox runat="server" ID="Minutes" Width="30px"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Text="S : " Font-Names="Andalus" 
                    Font-Size="9pt" ForeColor="#009900"></asp:Label><asp:TextBox runat="server" ID="Secondes" Width="30px"></asp:TextBox>
                <asp:Button runat="server" ID="Delay" Text="Delay" onclick="Delay_Click" />
                <br />
                <br />
<asp:Button runat="server" ID="Stop" Text="Arreter" onclick="Stop_Click" />
<asp:Button runat="server" ID="Start" Text="Démarrer" onclick="Start_Click" Enabled="False" />
                        <eo:MsgBox ID="MsgBox1" runat="server" BackColor="White" 
                    CloseButtonUrl="00020312" ControlSkinID="None" HeaderHtml="Dialog Title" 
                    Height="122px" Width="161px"><HeaderStyleActive CssText="background-image:url('00020311');color:black;font-family:'trebuchet ms';font-size:10pt;font-weight:bold;padding-bottom:5px;padding-left:8px;padding-right:3px;padding-top:0px;height:18px;" /><ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" /><FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" /><BorderImages BottomBorder="00020305" BottomLeftCorner="00020304" 
                                BottomRightCorner="00020306" LeftBorder="00020303" RightBorder="00020307" 
                                TopBorder="00020310" TopLeftCorner="00020301" TopLeftCornerBottom="00020302" 
                                TopRightCorner="00020309" TopRightCornerBottom="00020308" /></eo:MsgBox>
                                                        <eo:MsgBox ID="MsgBox2" runat="server" BackColor="White" 
                    CloseButtonUrl="00020312" ControlSkinID="None" HeaderHtml="Dialog Title" 
                    Height="122px" Width="161px"><HeaderStyleActive CssText="background-image:url('00020311');color:black;font-family:'trebuchet ms';font-size:10pt;font-weight:bold;padding-bottom:5px;padding-left:8px;padding-right:3px;padding-top:0px;height:18px;" /><ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" /><FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" /><BorderImages BottomBorder="00020305" BottomLeftCorner="00020304" 
                                BottomRightCorner="00020306" LeftBorder="00020303" RightBorder="00020307" 
                                TopBorder="00020310" TopLeftCorner="00020301" TopLeftCornerBottom="00020302" 
                                TopRightCorner="00020309" TopRightCornerBottom="00020308" /></eo:MsgBox>
            </ContentTemplate>  
        </asp:UpdatePanel>  
    </div>  
    </form>  
</body>  
</html> 