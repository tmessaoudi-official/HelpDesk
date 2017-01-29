using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helpdesk
{
    public partial class AgenceHistorique : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Request.Cookies["userInfo"]["Level"] != "1")
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {

                    Panel x = (Panel)GridView1.Rows[i].FindControl("DivEditWindow1");
                    x.Visible = false;
                    AjaxControlToolkit.BalloonPopupExtender x1 = (AjaxControlToolkit.BalloonPopupExtender)GridView1.Rows[i].FindControl("PopupControlExtender3");
                    x1.Enabled = false;
                    Image x3 = (Image)GridView1.Rows[i].FindControl("Supprime");
                    x3.Visible = false;
                }
            }
            
            Session["Changed"] = null;
            Utilitaire.Databases.Scripts.CheckStatut(msgboxpanel);
        }
        protected void GridView1_IndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}