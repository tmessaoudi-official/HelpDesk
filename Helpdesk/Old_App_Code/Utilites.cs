using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Net.Mail;
using System.Web.UI.HtmlControls;

namespace Helpdesk.Utilitaire
{
    public class Utilites
    {
        public static bool CheckIpAddr(string ipAddress)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(ipAddress,
            @"^(25[0-5]|2[0-4]\d|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3}$");
        }
        public static bool CheckMacAddr(String Mac)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(Mac, "^([0-9A-Fa-f]{2}[-]){5}([0-9A-Fa-f]{2})$");
        }
        public static bool CheckMacSplit(String Mac)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(Mac, "[0-9A-Fa-f]{2}");
        }
        public static string GetMainDrive()
        {
            string mainDrive = "";
            foreach (string drive in Directory.GetLogicalDrives())
            {
                if (Directory.Exists(drive + "WINDOWS\\System32") || Directory.Exists(drive + "WINDOWS NT\\System32"))
                {
                    mainDrive = drive;
                    break;
                }
            }
            if (mainDrive.Equals(""))
            {
                mainDrive = "C:\\";
            }
            return mainDrive;
        }
        public static void redirect(String URL)
        {
            System.Web.HttpContext.Current.Response.Write("<script>");
            System.Web.HttpContext.Current.Response.Write("window.location = '" + URL + "'");
            System.Web.HttpContext.Current.Response.Write("<" + "/script>");
        }
        public static void ParentRed(String URL)
        {
            System.Web.HttpContext.Current.Response.Write("<script>");
            System.Web.HttpContext.Current.Response.Write("window.parent.location.href = '" + URL + "'");
            System.Web.HttpContext.Current.Response.Write("<" + "/script>");
        }
                public static void ParentRefrech()
        {
            System.Web.HttpContext.Current.Response.Write("<script>");
            System.Web.HttpContext.Current.Response.Write("window.parent.location.reload();");
            System.Web.HttpContext.Current.Response.Write("<" + "/script>");
        }
        
        public static void Warning(HtmlContainerControl div, String _msg, String _title)
        {
            if (_msg == null) { }
            else
            {
                MessageBox msgbox = new MessageBox("c:\\HelpDesk\\HelpDesk\\Old_App_Code\\msgbox.tpl");
                msgbox.SetTitle(_title);
                msgbox.SetIcon("../images/msg_icon_1.png");
                msgbox.SetMessage(_msg);
                div.InnerHtml = msgbox.ReturnObject();
            }
        }
        public static void MSG(HtmlContainerControl div, String _msg, String _title)
        {
            if (_msg == null) { }
            else
            {
                MessageBox msgbox = new MessageBox("C:\\Helpdesk\\Helpdesk\\Old_App_Code\\msgbox.tpl");
                msgbox.SetTitle(_title);
                msgbox.SetIcon("../images/msg_icon_1.png");
                msgbox.SetMessage(_msg);
                msgbox.SetOKButton("msg_button_class");
                div.InnerHtml = msgbox.ReturnObject();
            }
        }
    }
}