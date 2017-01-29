using System;
using System.Net;
using System.Net.NetworkInformation;

namespace Helpdesk.Utilitaire.Reseau
{
    public class Network
    {
        public static String GetIpLocale()
        {
            IPHostEntry h = Dns.GetHostEntry(Dns.GetHostName());

            String ip_adr = String.Empty;

            foreach (IPAddress ip in h.AddressList)
            {
                if (ip.ToString().Contains("."))
                {
                    ip_adr = ip.ToString();
                }
            }

            return ip_adr;
        }
        public static String GetHostname()
        {
            return Dns.GetHostName();
        }
    }
}