<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupprimeAgence.aspx.cs" Inherits="Helpdesk.SupprimeAgence" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="Stylesheet" href="../Styles/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server"></div>
    <div>
                    <asp:Panel ID="Delete" runat="server" Height="79px" 
    Width="257px">
                    <asp:Label ID="Del" runat="server" Text="Supprimer cette agence ?!"></asp:Label>
                    <br />
                        <asp:Label ID="Del0" runat="server" Text=""></asp:Label>
                        <br />
                    <asp:Button ID="Oui" runat="server" Text="Oui" onclick="Oui_Click" />
                    <asp:Button ID="Non" runat="server" Text="Non" onclick="Non_Click" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
