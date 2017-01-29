using System;
using System.Text;
using System.Web;
using System.Web.UI;

public class MessageBoxButton
{
    private string msg_button = "";
	public MessageBoxButton(string btnValue)
	{
        msg_button = "<input type=\"button\" value=\"" + btnValue + "\"";
	}
    public void SetClass(string btnClass)
    {
        msg_button += " class=\"" + btnClass + "\"";
    }
    public void SetLocation(string btnLocation)
    {
        msg_button += " onClick=\"window.location='" + btnLocation + "'\"";
    }
    public string ReturnObject()
    {
       return msg_button += ">";
    }
}
