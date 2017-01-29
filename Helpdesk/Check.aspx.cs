using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Media;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;
using System.Drawing;
using System.ComponentModel;
using System.Globalization;
using System.Collections;
using System.Net;
using System.Net.Sockets;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
namespace Helpdesk
{
    public partial class Check : System.Web.UI.Page
    {
        public static int Re = 0;
        public static int Count = 0;
        public static int c = 0;
        #region iplibrairies
        const int MAXLEN_PHYSADDR = 8;
        [StructLayout(LayoutKind.Sequential)]
        struct MIB_IPNETROW
        {
            [MarshalAs(UnmanagedType.U4)]
            public int dwIndex;
            [MarshalAs(UnmanagedType.U4)]
            public int dwPhysAddrLen;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac0;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac1;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac2;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac3;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac4;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac5;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac6;
            [MarshalAs(UnmanagedType.U1)]
            public byte mac7;
            [MarshalAs(UnmanagedType.U4)]
            public int dwAddr;
            [MarshalAs(UnmanagedType.U4)]
            public int dwType;
        }
        [DllImport("IpHlpApi.dll")]
        [return: MarshalAs(UnmanagedType.U4)]
        static extern int GetIpNetTable(
           IntPtr pIpNetTable,
           [MarshalAs(UnmanagedType.U4)]
         ref int pdwSize,
           bool bOrder);
        const int ERROR_INSUFFICIENT_BUFFER = 122;
        #endregion iplibrairies
        protected void Page_Load(object sender, System.EventArgs e)
        {

        }
        public void Controle() 
        {

        }
        public static String getMacFromARPwithIP(String IP)
        {
            String mac = null;
            // The number of bytes needed.
            int bytesNeeded = 0;

            // The result from the API call.
            int result = GetIpNetTable(IntPtr.Zero, ref bytesNeeded, false);

            // Call the function, expecting an insufficient buffer.
            if (result != ERROR_INSUFFICIENT_BUFFER)
            {
                // Throw an exception.
                throw new Win32Exception(result);
            }

            // Allocate the memory, do it in a try/finally block, to ensure
            // that it is released.
            IntPtr buffer = IntPtr.Zero;

            // Try/finally.
            try
            {
                // Allocate the memory.
                buffer = Marshal.AllocCoTaskMem(bytesNeeded);

                // Make the call again. If it did not succeed, then
                // raise an error.
                result = GetIpNetTable(buffer, ref bytesNeeded, false);

                // If the result is not 0 (no error), then throw an exception.
                if (result != 0)
                {
                    // Throw an exception.
                    throw new Win32Exception(result);
                }

                // Now we have the buffer, we have to marshal it. We can read
                // the first 4 bytes to get the length of the buffer.
                int entries = Marshal.ReadInt32(buffer);

                // Increment the memory pointer by the size of the int.
                IntPtr currentBuffer = new IntPtr(buffer.ToInt64() +
                   Marshal.SizeOf(typeof(int)));

                // Allocate an array of entries.
                MIB_IPNETROW[] table = new MIB_IPNETROW[entries];

                // Cycle through the entries.
                for (int index = 0; index < entries; index++)
                {
                    // Call PtrToStructure, getting the structure information.
                    table[index] = (MIB_IPNETROW)Marshal.PtrToStructure(new
                       IntPtr(currentBuffer.ToInt64() + (index *
                       Marshal.SizeOf(typeof(MIB_IPNETROW)))), typeof(MIB_IPNETROW));
                }

                for (int index = 0; index < entries; index++)
                {
                    IPAddress ip = new IPAddress(BitConverter.GetBytes(table[index].dwAddr));
                    if (ip.ToString().Equals(IP))
                    {
                        byte b;

                        b = table[index].mac0;
                        if (b < 0x10)
                        {
                            mac = "0";
                            //Console.Write("0");
                        }
                        else
                        {
                            mac = "";
                            Console.Write("");
                        }
                        mac += b.ToString("X");
                        Console.Write(b.ToString("X"));

                        b = table[index].mac1;
                        if (b < 0x10)
                        {
                            mac += "-0";
                        }
                        else
                        {

                            mac += "-";
                        }
                        mac += b.ToString("X");

                        b = table[index].mac2;
                        if (b < 0x10)
                        {
                            mac += "-0";
                        }
                        else
                        {
                            mac += "-";
                        }
                        mac += b.ToString("X");

                        b = table[index].mac3;
                        if (b < 0x10)
                        {
                            mac += "-0";
                        }
                        else
                        {
                            mac += "-";
                        }
                        mac += b.ToString("X");

                        b = table[index].mac4;
                        if (b < 0x10)
                        {
                            mac += "-0";
                        }
                        else
                        {
                            mac += "-";
                        }
                        mac += b.ToString("X");

                        b = table[index].mac5;
                        if (b < 0x10)
                        {
                            mac += "-0";
                        }
                        else
                        {
                            mac += "-";
                        }
                        mac += b.ToString("X");
                    }
                }
            }
            finally
            {
                // Release the memory.
                Marshal.FreeCoTaskMem(buffer);
            }
            return mac;
        }
        public static String SNMPGET(String Host,String OID)
        {
            Process p = new Process();
            p.StartInfo.FileName = "C:\\Helpdesk\\Helpdesk\\mibbrowser\\ireasoning\\mibbrowser\\bin\\snmpget.bat";
            p.StartInfo.Arguments = Host + " " + OID;
            p.StartInfo.UseShellExecute = false;
            p.StartInfo.CreateNoWindow = true;
            p.StartInfo.RedirectStandardOutput = true;
            p.Start();
            string output = p.StandardOutput.ReadToEnd();
            p.WaitForExit();
            if (output.Contains("time out") || output.Contains("PDU error status = No Such Name"))
            {
                return "Time Out";
            }
            if (OID.Contains(".1.3.6.1.2.1.2.2.1.6."))
            {
                Char[] separator = { ':' };
                Char[] separator2 = { ' ' };
                String[] S = output.Split(separator);
                String s2 = S[1].Replace("0x", "-");
                String s4 = s2.Replace(" ", "");
                String s3 = null;
                for (int i = 1; i < s4.Length; i++)
                {
                    s3 += s4[i];
                }
                return s3;
            }
            if (OID.Contains(".1.3.6.1.2.1.2.2.1.8."))
            {
                Char[] separator = { ':' };
                String[] S = output.Split(separator);
                String s3 = S[1].Replace(" ","");
                return s3;
            }
            return output;
        }
        public static String SNMP(String Host)
        {
            String OID = null;
            String Get = null;
            int IntNumbers = 0;
            int index = 0;
            String Mac = null;
            Ping ping = new Ping();
            PingReply pingReply = ping.Send(Host, 1000);
            if (pingReply.Status.Equals("DestinationHostUnreachable") || (pingReply.Status.Equals("TimedOut")))
            {
                return "Time Out";
            }
            if (pingReply.Status.Equals("Success"))
            {
                Mac = getMacFromARPwithIP(Host);
                IntNumbers = Int32.Parse(SNMPGET(Host, ".1.3.6.1.2.1.2.1.0"));
                do
                {
                    index++;
                    Get = SNMPGET(Host, ".1.3.6.1.2.1.2.2.1.6." + index);
                    if (Get.Contains(Mac))
                    {
                    OID = ".1.3.6.1.2.1.2.2.1.6."+index;
                    }
                } while (OID == null);
            }
            return SNMPGET(Host, OID);
        }
        public void playaudio(string s)
        {
            string sSelectedAudio = s;
            SoundPlayer objSoundPlayer = new SoundPlayer(sSelectedAudio);
            objSoundPlayer.Play();
        }

        protected void Delay_Click(object sender, EventArgs e)
        {
            int h;
            int m;
            int s;
            if (String.IsNullOrEmpty(Hours.Text) && String.IsNullOrEmpty(Minutes.Text) && String.IsNullOrEmpty(Secondes.Text))
            {
                MsgBox2.Show("Temp Invalide", "", "", new EO.Web.MsgBoxButton("Ok"));
            }
            else 
            {
                Timer1.Enabled = false;
                try
                {
                    h = Int32.Parse(Hours.Text);
                }
                catch (Exception ex) { h = 0; }
                try
                {
                    m = Int32.Parse(Minutes.Text);
                }
                catch (Exception ex) { m = 0; }
                try
                {
                    s = Int32.Parse(Secondes.Text);
                }
                catch (Exception ex) { s = 0; }
                if (h == 0 && m == 0 && s == 0)
                {
                    MsgBox2.Show("Temp Invalide", "", "", new EO.Web.MsgBoxButton("Ok"));
                }
                else
                {
                    int time = h * 3600000 + m * 60000 + s * 1000;
                    Timer1.Interval = time;
                    Timer1.Enabled = true;
                }
            }
        }
        protected void Stop_Click(object sender, EventArgs e)
        {
            if (Timer1.Enabled == false)
            {
                MsgBox2.Show("Arretez", "deja arretez", "", new EO.Web.MsgBoxButton("Ok"));
            }
            else 
            {
                Timer1.Enabled = false;
                Stop.Enabled = false;
                Start.Enabled = true;
            }
        }
        protected void Start_Click(object sender, EventArgs e)
        {
            if (Timer1.Enabled == true)
            {
                MsgBox2.Show("Demarrer", "deja demarrez", "", new EO.Web.MsgBoxButton("Ok"));
            }
            else
            {
                Timer1.Enabled = true;
                Start.Enabled = false;
                Stop.Enabled = true;
            }
        }
    }
}
