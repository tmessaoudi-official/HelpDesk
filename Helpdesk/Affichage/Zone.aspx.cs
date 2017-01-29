using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk.Affichage
{
    public partial class Zone : System.Web.UI.Page
    {
        public static int Zon = 0;
        public static int Resp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["IDZone"] != null)
            { IZone.Value = Request.QueryString["IDZone"];
            Zon = Int32.Parse(IZone.Value);
            }
            if (Request.QueryString["IDResponsable"] != null)
            {
                IDResponsable.Value = Request.QueryString["IDResponsable"];
                Resp = Int32.Parse(IDResponsable.Value);
            }
            if (Request.QueryString["Mode"] != null)
            {
                if (Request.QueryString["Mode"] == "editzone")
                {
                    Edit.Visible = true;
                    Delete.Visible = false;
                    Responsable.Visible = false;
                    DeleteRes.Visible = false;
                    Add.Text = "Modifier";
                    using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                    {
                        var req = from value in a.Zones where value.ID == Zon select value;
                        var res = req.FirstOrDefault();
                        ZoneID.Text = " Editing Zone : " + res.Libelle;
                        desc.Text = "Description : " + res.Description;
                    }
                }
                if (Request.QueryString["Mode"] == "editresponsable")
                {
                    Edit.Visible = false;
                    Delete.Visible = false;
                    Responsable.Visible = true;
                    DeleteRes.Visible = false;
                    SubmitResponsable.Text = "Modifier";
                    show.Visible = true;
                }
                if (Request.QueryString["Mode"] == "newzone")
                {
                    Add.Text = "Ajouter";
                    ZoneID.Text = "Nouvelle zone : ";
                    Edit.Visible = true;
                    Delete.Visible = false;
                    Responsable.Visible = false;
                    DeleteRes.Visible = false;
                }
                if (Request.QueryString["Mode"] == "newresponsable")
                {
                    Edit.Visible = false;
                    Delete.Visible = false;
                    Responsable.Visible = true;
                    DeleteRes.Visible = false;
                    SubmitResponsable.Text = "Ajouter";
                }
                if (Request.QueryString["Mode"] == "deletezone")
                {
                    Edit.Visible = false;
                    Delete.Visible = true;
                    Responsable.Visible = false;
                    DeleteRes.Visible = false;
                    using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                    {
                        var req = from value in a.Zones where value.ID == Zon select value;
                        var res = req.FirstOrDefault();
                        ZoneID.Text = "Deleting Zone : " + res.Libelle;
                    }
                }
                if (Request.QueryString["Mode"] == "deleteresponsable") 
                {
                    Edit.Visible = false;
                    Delete.Visible = false;
                    Responsable.Visible = false;
                    DeleteRes.Visible = true;
                    using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                    {
                        var req = from value in a.Responsables where value.ID == Resp select value;
                        var res = req.FirstOrDefault();
                        NomRes.Text = "Nom : "+res.Nom;
                        PrenomRes.Text = "Prenom : " + res.Prenom;
                        EmailRes.Text = "Email : " + res.Email;
                        TelRes.Text = "Téléphone : " + res.Teléphone;
                        var reqa = from val in a.Agences where val.Responsable == Resp select val;
                        var resa = reqa.FirstOrDefault();
                        if (resa != null)
                        {
                            Mission.Text = "Mission : " + resa.Zones.Libelle + ", " + resa.Nom;
                        }
                        else 
                        {
                            Mission.Text = "Mission : " + "En Attente";
                        }
                    }

                }
            }
            else 
            {
                Utilitaire.Utilites.Warning(msgboxpanel, "", "");
            }
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (b.Text == "Ajouter")
            {
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    Helpdesk.Entities.Agences.Zones z = new Entities.Agences.Zones() { Libelle = TextLibelle.Text, Description = TextDescription.Text };
                    a.AddToZones(z);
                    a.SaveChanges();

                }
            }
            if (b.Text == "Modifier")
            {
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var requ = from val in ag.Zones where val.ID == Zon select val;
                    var resu = requ.FirstOrDefault();
                    String lib = TextLibelle.Text;
                    resu.Libelle = TextLibelle.Text;
                    
                    resu.Description = TextDescription.Text;
                    ag.SaveChanges();
                }
            }
            if (Request.QueryString["Page"] == "Update")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.document.getElementById('ButtonEditDone').click();");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
            if (Request.QueryString["Page"] == "Affiche")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
        }

        protected void Non_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Page"] == "Update")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.document.getElementById('ButtonEditCancel').click();");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            } 
            if (Request.QueryString["Page"] == "Affiche")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
        }

        protected void Oui_Click(object sender, EventArgs e)
        {
            
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var request = from val in a.Agences where val.Zone == Zon select val;
                var result = request.ToList();
                if (result == null || result.Count == 0)
                {
                    var req = from value in a.Zones where value.ID == Zon select value;
                    var res = req.FirstOrDefault();
                    a.DeleteObject(res);
                    a.SaveChanges();
                    if (Request.QueryString["Page"] == "Update")
                    {
                        System.Web.HttpContext.Current.Response.Write("<script>");
                        System.Web.HttpContext.Current.Response.Write("parent.document.getElementById('ButtonEditDone').click();");
                        System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                    }
                    if (Request.QueryString["Page"] == "Affiche")
                    {
                        System.Web.HttpContext.Current.Response.Write("<script>");
                        System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                        System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                    }
                }
                else { 
                    Response.Write("Cette Zone Contient "+result.Count+" Agences, Deplacer les puis supprimer la zonne"); }
            }
        }

        protected void SubmitResponsable_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            using (Helpdesk.Entities.Agences.AgenceEntities dbag = new Entities.Agences.AgenceEntities())
            {
                if (b.Text == "Ajouter")
                {
                    Helpdesk.Entities.Agences.Responsables respo = new Entities.Agences.Responsables() { Email = EmailResponsable.Text, Niveau = 3, Role = 2, Nom = NomResponsable.Text, Prenom = PrenomResponsable.Text, Teléphone = TelephoneResponsable.Text };
                    dbag.AddToResponsables(respo);
                    dbag.SaveChanges();
                }
                if (b.Text == "Modifier")
                {
                    var req = from value in dbag.Responsables where value.ID == Resp select value;
                    var res = req.FirstOrDefault();
                    res.Nom = NomResponsable.Text;
                    res.Prenom = PrenomResponsable.Text;
                    res.Email = EmailResponsable.Text;
                    res.Teléphone = TelephoneResponsable.Text;

                    dbag.SaveChanges();
                }
            }
            if (Request.QueryString["Page"] == "Update")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.document.getElementById('ButtonEditDone').click();");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
            if (Request.QueryString["Page"] == "Affiche")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
            
        }

        protected void OuiResponsable_Click(object sender, EventArgs e)
        {
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                    var req = from value in a.Responsables where value.ID == Resp select value;
                    var res = req.FirstOrDefault();
                    a.DeleteObject(res);
                    a.SaveChanges();
                    if (Request.QueryString["Page"] == "Update")
                    {
                        System.Web.HttpContext.Current.Response.Write("<script>");
                        System.Web.HttpContext.Current.Response.Write("parent.document.getElementById('ButtonEditDone').click();");
                        System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                    }
                    if (Request.QueryString["Page"] == "Affiche")
                    {
                        System.Web.HttpContext.Current.Response.Write("<script>");
                        System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                        System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                    }
                }
        }

        protected void NonResponsable_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Page"] == "Update")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.document.getElementById('ButtonEditDone').click();");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
            if (Request.QueryString["Page"] == "Affiche")
            {
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
        }

        protected void show_Click(object sender, EventArgs e)
        {
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var req = from value in a.Responsables where value.ID == Resp select value;
                var res = req.FirstOrDefault();
                NomResponsable.Text = res.Nom;
                PrenomResponsable.Text = res.Prenom;
                EmailResponsable.Text = res.Email;
                TelephoneResponsable.Text = res.Teléphone;
            }
        }
    }
}