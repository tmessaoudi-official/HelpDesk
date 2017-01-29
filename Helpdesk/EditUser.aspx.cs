using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] == "2")
            {
                Ajouter.Visible = false;
                Editer.Visible = false;
                Register.Visible = false;
                Edit.Visible = false;
                Up1.Visible = false;
                Li1.Visible = false;
                EditMeU.Visible = true;
            }
        }

        protected void GridView1_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridView1.PageIndex = e.NewPageIndex;
            //GridView1.DataBind();
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

        protected void Ajouter_Click(object sender, EventArgs e)
        {
            Register.Visible = true;
            Edit.Visible = false;
        }

        protected void Editer_Click(object sender, EventArgs e)
        {
            Register.Visible = false;
            Edit.Visible = true;
        }

        protected void ActionR_Click(object sender, EventArgs e)
        {
            if ((String.IsNullOrEmpty(TextBoxEmailR.Text) || String.IsNullOrWhiteSpace(TextBoxEmailR.Text)) || (String.IsNullOrEmpty(TextBoxNomR.Text) || String.IsNullOrWhiteSpace(TextBoxNomR.Text)) || (String.IsNullOrEmpty(TextBoxPasswordR.Text) || String.IsNullOrWhiteSpace(TextBoxPasswordR.Text)) || (String.IsNullOrEmpty(TextBoxPrenomR.Text) || String.IsNullOrWhiteSpace(TextBoxPrenomR.Text)) || (String.IsNullOrEmpty(TextBoxUsernameR.Text) || String.IsNullOrWhiteSpace(TextBoxUsernameR.Text)))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Remplir les champs", "Champs Invalides");
            }
            else 
            {
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities()) 
                {
                    Helpdesk.Entities.Agences.Responsables u = new Entities.Agences.Responsables() { Email=TextBoxEmailR.Text, Niveau = 2, Nom=TextBoxNomR.Text, Password= Utilitaire.Encryption.AESEncryption.Encrypt(TextBoxPasswordR.Text), Prenom=TextBoxPrenomR.Text, Username=TextBoxUsernameR.Text, Role = 1 };
                    a.AddToResponsables(u);
                    a.SaveChanges();
                    System.Web.HttpContext.Current.Response.Write("<script>");
                    System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                    System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                }
            }
        }

        protected void EditMe_Click(object sender, EventArgs e)
        {
            Up1.Visible = true;
            List1.Visible = false;
            int ID = Int32.Parse(System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"]);
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var req = from val in a.Responsables where val.ID == ID select val;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    TextBoxEmailU.Text = res.Email;
                    TextBoxNomU.Text = res.Nom;
                    TextBoxPasswordU.Text = Utilitaire.Encryption.AESEncryption.Decrypt(res.Password);
                    TextBoxPrenomU.Text = res.Prenom;
                    TextBoxUsernameU.Text = res.Username;
                }
            }
            ActionUM.Visible = true;
            ActionUO.Visible = false;
        }

        protected void ActionU_Click(object sender, EventArgs e)
        {
            List1.Visible = false;
            Up1.Visible = true;
            if ((String.IsNullOrEmpty(TextBoxEmailU.Text) || String.IsNullOrWhiteSpace(TextBoxEmailU.Text)) || (String.IsNullOrEmpty(TextBoxNomU.Text) || String.IsNullOrWhiteSpace(TextBoxNomU.Text)) || (String.IsNullOrEmpty(TextBoxPasswordU.Text) || String.IsNullOrWhiteSpace(TextBoxPasswordU.Text)) || (String.IsNullOrEmpty(TextBoxPrenomU.Text) || String.IsNullOrWhiteSpace(TextBoxPrenomU.Text)) || (String.IsNullOrEmpty(TextBoxUsernameU.Text) || String.IsNullOrWhiteSpace(TextBoxUsernameU.Text)))
            {
                Utilitaire.Utilites.MSG(msgboxpanel, "Remplir les champs", "Champs Invalides");
            }
            else
            {
                int ID = Int32.Parse(System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"]);
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    var req = from val in a.Responsables where val.ID == ID select val;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        res.Email = TextBoxEmailU.Text;
                        res.Nom = TextBoxNomU.Text;
                        res.Password = Utilitaire.Encryption.AESEncryption.Encrypt(TextBoxPasswordU.Text);
                        res.Prenom = TextBoxPrenomU.Text;
                        res.Username = TextBoxUsernameU.Text;
                        a.SaveChanges();
                    }
                    System.Web.HttpContext.Current.Response.Write("<script>");
                    System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                    System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                }
            }
        }

        protected void Lister_Click(object sender, EventArgs e)
        {
            List1.Visible = true;
            Up1.Visible = false;
            Li1.Visible = true;
        }

        protected void Link_Click(object sender, EventArgs e)
        {
            ActionUM.Visible = false;
            ActionUO.Visible = true;
            LinkButton b = (LinkButton)sender;
            Up1.Visible = true;
            List1.Visible = false;
            int ID = Int32.Parse(b.CommandArgument);
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var req = from val in a.Responsables where val.ID == ID select val;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    IDU.Value = res.ID.ToString();
                    TextBoxEmailU.Text = res.Email;
                    TextBoxNomU.Text = res.Nom;
                    TextBoxPasswordU.Text = Utilitaire.Encryption.AESEncryption.Decrypt(res.Password);
                    TextBoxPrenomU.Text = res.Prenom;
                    TextBoxUsernameU.Text = res.Username;
                }
            }
        }
        protected void Link1_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            int ID = Int32.Parse(b.CommandArgument);
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var req = from val in a.Responsables where val.ID == ID select val;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    var req1 = from value in a.Historique_Login where value.ID_User == res.ID select value;
                    var res1 = req1.ToList();
                    foreach(Helpdesk.Entities.Agences.Historique_Login h in res1 )
                    {
                        a.DeleteObject(h);
                        a.SaveChanges();
                    }
                    a.DeleteObject(res);
                    a.SaveChanges();
                    System.Web.HttpContext.Current.Response.Write("<script>");
                    System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                    System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                }
            }

        }
        protected void ActionUO_Click(object sender, EventArgs e)
        {
            List1.Visible = false;
            Up1.Visible = true;
                int ID = Int32.Parse(IDU.Value);
                using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
                {
                    var req = from val in a.Responsables where val.ID == ID select val;
                    var res = req.FirstOrDefault();
                    if (res != null)
                    {
                        res.Email = TextBoxEmailU.Text;
                        res.Nom = TextBoxNomU.Text;
                        res.Password = Utilitaire.Encryption.AESEncryption.Encrypt(TextBoxPasswordU.Text);
                        res.Prenom = TextBoxPrenomU.Text;
                        res.Username = TextBoxUsernameU.Text;
                        a.SaveChanges();
                    }
                    System.Web.HttpContext.Current.Response.Write("<script>");
                    System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                    System.Web.HttpContext.Current.Response.Write("<" + "/script>");
                }
            }

        protected void EditMeU_Click(object sender, EventArgs e)
        {
            ModifUser.Visible = true;
            int ID = Int32.Parse(System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"]);
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var req = from val in a.Responsables where val.ID == ID select val;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    EmailU.Text = res.Email;
                    NomU.Text = res.Nom;
                    PrenomU.Text = res.Prenom;
                }
            }
        }

        protected void EditU_Click(object sender, EventArgs e)
        {
            int ID = Int32.Parse(System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"]);
            using (Helpdesk.Entities.Agences.AgenceEntities a = new Entities.Agences.AgenceEntities())
            {
                var req = from val in a.Responsables where val.ID == ID select val;
                var res = req.FirstOrDefault();
                if (res != null)
                {
                    res.Email = EmailU.Text;
                    res.Nom = NomU.Text;
                    res.Prenom = PrenomU.Text;
                    a.SaveChanges();
                }
                System.Web.HttpContext.Current.Response.Write("<script>");
                System.Web.HttpContext.Current.Response.Write("parent.location.reload(true);");
                System.Web.HttpContext.Current.Response.Write("<" + "/script>");
            }
        }
        }
    }