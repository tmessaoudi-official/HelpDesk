using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
namespace Helpdesk.Utilitaire.Mail
{
    public class Scripts
    {

        public static void SendMailMessage(string from, string to, string bcc, string cc, string subject, string body)
        {
            MailMessage mMailMessage = new MailMessage();
            mMailMessage.From = new MailAddress(from);
            mMailMessage.To.Add(new MailAddress(to));
            if ((bcc != null) && (bcc != string.Empty))
            {
                mMailMessage.Bcc.Add(new MailAddress(bcc));
            }
            if ((cc != null) && (cc != string.Empty))
            {
                mMailMessage.CC.Add(new MailAddress(cc));
            }
            mMailMessage.Subject = subject;
            mMailMessage.Body = body;
            mMailMessage.IsBodyHtml = true;
            mMailMessage.Priority = MailPriority.Normal;

            SmtpClient mSmtpClient = new SmtpClient("smtp.topnet.tn");
            mSmtpClient.Send(mMailMessage);
        }
        public static void SendForgotmail(HtmlContainerControl div, String email)
        {
            using (Helpdesk.Entities.Agences.AgenceEntities db = new Helpdesk.Entities.Agences.AgenceEntities())
            {
                var req = from value in db.Responsables where (value.Email == email) select value;
                var r = req.FirstOrDefault();
                if (r != null)
                {
                    SendMailMessage("admin@helpdesk.com", email, "", "", "Your password Request", "Username : " + r.Username + " \n Password : " + Utilitaire.Encryption.AESEncryption.Decrypt(r.Password));
                    Utilites.MSG(div, "password sent to your email adress", "Successful");
                }
                else
                {
                    Utilites.MSG(div, "email not registred in database", "Invalid Email");
                }
            }
        }
    }
}