using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Helpdesk
{
    public partial class userinfo : System.Web.UI.Page
    {
        
        String[] titreEnv = new String[4];
        String[,] valuesEnv;
        protected void Page_Load(object sender, EventArgs e)
        {
            Helpdesk.Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
            try
            {
                int id = 0;
                if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"] != null)
                {
                    id = Int32.Parse(System.Web.HttpContext.Current.Request.Cookies["userInfo"]["ID"]);
                }
                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Helpdesk.Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Historique_Login where value.ID_User == id select value;
                    var res = req.ToList();
                    titreEnv[0] = "Host Name : ";
                    titreEnv[1] = "@IP : ";
                    titreEnv[2] = "Date : ";
                    titreEnv[3] = "Time : ";
                    int nl = res.Count;
                    valuesEnv = new String[nl, 4];
                    int ligne = 0;
                    int colomne = 0;
                    foreach (Helpdesk.Entities.Agences.Historique_Login histlo in res)
                    {
                        valuesEnv[ligne, colomne] = histlo.Hostname;
                        valuesEnv[ligne, colomne + 1] = histlo.IPAdresse;
                        valuesEnv[ligne, colomne + 2] = histlo.Date.Value.Date.ToShortDateString();
                        valuesEnv[ligne, colomne + 3] = histlo.Time.ToString();
                        ligne++;
                    }
                    GetUserInfo();
                }
            }
            catch (Exception x) { Helpdesk.Utilitaire.Utilites.MSG(msgboxpanel, x.Message, "Erreur"); }
        }
        private DataView BindGridView(DataTable dt)
        {

            DataView dv = null;
            dv = new DataView(dt);
            return dv;
        }
        public DataTable GetCustomMadeDataTable(int titleno, String[] title, int rowno, String[,] rows)
        {
            System.Data.DataTable objDataTable = new System.Data.DataTable();
            for (int l = 0; l < titleno; l++)
            {
                objDataTable.Columns.Add(title[l], typeof(string));
            }
            DataRow dr;
            int ti = 0;
            int ligne = 0;
            do
            {
                dr = objDataTable.NewRow();
                do
                {
                    dr[ti] = rows[ligne, ti];
                    ti++;
                } while (ti < titleno);
                ti = 0;
                objDataTable.Rows.Add(dr);
                ligne++;
            } while (ligne < rowno);
            return objDataTable;
        }
        public void GetUserInfo()
        {
            Me.DataSource = GetCustomMadeDataTable(titreEnv.Length, titreEnv, valuesEnv.GetLength(0), valuesEnv);
            Me.DataBind();
        }

        protected void Me_IndexChanged(object sender, GridViewPageEventArgs e)
        {
            Me.PageIndex =  e.NewPageIndex;
            Me.DataBind();
        }

    }
}