using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Helpdesk
{
    public partial class WebForm1 : System.Web.UI.Page
    {
                
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                using (Helpdesk.Entities.Agences.AgenceEntities ag = new Entities.Agences.AgenceEntities())
                {
                    var req = from value in ag.Responsables where value.Niveau == 3 && value.Role == 2 select value ;
                    var res = req.ToList();
                    if (res != null)
                    {
                        foreach (Helpdesk.Entities.Agences.Responsables r in res)
                        {
                            Response.Write(r.Nom);
                        }
                    }


                }
            }
            catch (System.Data.SqlClient.SqlException sql) { }
        }
    }
            
}