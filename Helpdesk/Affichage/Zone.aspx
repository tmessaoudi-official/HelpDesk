<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zone.aspx.cs" Inherits="Helpdesk.Affichage.Zone" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../Styles/main.css" />
    <style type="text/css">
        #form1
        {
            height: 139px;
            margin-bottom: 4px;
            width: 263px;
        }
    </style>
        <style type="text/css">
body{
font-family:"Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif;
font-size:12px;
}
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}
/* ----------- stylized ----------- */
.stylized{
border:solid 2px #b7ddf2;
background:#ebf4fb;
            margin:0 auto;
padding:14px;
        }
.stylized h1 {
font-size:14px;
font-weight:bold;
margin-bottom:8px;
}
.stylized p{
font-size:11px;
color:#666666;
margin-bottom:20px;
border-bottom:solid 1px #b7ddf2;
padding-bottom:10px;
}
.label{
display:block;
font-weight:bold;
text-align:right;
float:left;
}
.stylized .small{
color:#666666;
display:block;
font-size:11px;
float:left;
font-weight:normal;
text-align:right;
width:100px;
}

}
.input{
float:left;
font-size:12px;
padding:3px 2px;
border:solid 1px #aacfe4;
margin:2px 0 0px 10px;
            }
.button{
clear:both;
margin-left:150px;
width:125px;
height:31px;
background:#666666 url(img/button.png) no-repeat;
text-align:center;
line-height:31px;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
}
    </style>
</head>
<body bgcolor="white" style="height: 114px; width: 261px; margin-bottom: 3px">
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server"></div>
    <div style="height: 63px; width: 259px">
    
        
        <asp:Label runat="server" ID="ZoneID" ></asp:Label>
        <br />
        <asp:Label runat="server" ID="desc" ></asp:Label>
    
        <asp:HiddenField ID="IZone" runat="server" />

    <asp:Panel Visible="false" ID="Edit" runat="server" Height="79px" Width="263px">
        <asp:Label ID="Libelle" Text="Libelle" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextLibelle" runat="server" Height="22px" Width="92px"></asp:TextBox>

        <asp:RequiredFieldValidator ID="V" runat="server" 
            ErrorMessage="(*)" ControlToValidate="TextLibelle" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />
        <asp:Label ID="Description" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="TextDescription" runat="server" Height="22px" Width="92px"></asp:TextBox>

        <br />
        <asp:Button ID="Add" runat="server" Text="Modifier" onclick="Add_Click" />
    </asp:Panel>
                <asp:Panel Visible="false" ID="Delete" runat="server" Height="79px" 
    Width="265px">
                    <asp:Label ID="Del" runat="server" Text="Supprimer cette zone ?!"></asp:Label>
                    
                    <br />
                    <asp:Button ID="Oui" runat="server" Text="Oui" onclick="Oui_Click" />
                    <asp:Button ID="Non" runat="server" Text="Non" onclick="Non_Click" />
        </asp:Panel>
        <asp:Panel ID="Responsable" style="position:absolute; top: -11px; left: -4px;" 
            CssClass="stylized" runat="server" Visible="false" 
            Height="203px" Width="256px">
           <asp:Button style="position:absolute;" Visible="false" CssClass="button" ID="show" 
                Text="show details" runat="server" onclick="show_Click" />
            <asp:Label ID="Label3" runat="server" Text="Nom : "></asp:Label>
            <br />
            <asp:TextBox ID="NomResponsable" runat="server"></asp:TextBox>        
            <br />
            <asp:Label ID="Label4" runat="server" Text="Prenom : "></asp:Label>
            <br />
            <asp:TextBox ID="PrenomResponsable" runat="server"></asp:TextBox>        
            <br />
           <asp:Label ID="Label8" runat="server" CssClass="label" Text="">Email : <asp:RegularExpressionValidator
        id="RegularExpressionValidator3"
        ControlToValidate="EmailResponsable"
        Text="(Invalid email)"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        Runat="server" ForeColor="Red" /></asp:Label><br /><asp:TextBox ID="EmailResponsable" 
                runat="server" Width="197px"></asp:TextBox><br /><asp:Label ID="Label7" 
                runat="server" Text="Téléphone"></asp:Label><br /><asp:TextBox ID="TelephoneResponsable" runat="server"></asp:TextBox><asp:Button 
                ID="SubmitResponsable" runat="server" Text="Enregistrer" 
                onclick="SubmitResponsable_Click" CssClass="button" /><div class="spacer"> <asp:HiddenField ID="IDResponsable" runat="server" />
                </div>
                
                </asp:Panel>
                                <asp:Panel Visible="false" ID="DeleteRes" runat="server" Height="127px" 
    Width="270px"><asp:Label ID="Label1" runat="server" Text="Supprimer ce Responsable ?!"></asp:Label><br /><asp:Label ID="NomRes" runat="server" Text="Nom : "></asp:Label><br /><asp:Label ID="PrenomRes" runat="server" Text="Prenom : "></asp:Label><br /><asp:Label ID="EmailRes" runat="server" Text="Email : "></asp:Label><br /><asp:Label ID="TelRes" runat="server" Text="Téléphone : "></asp:Label><br /><asp:Label ID="Mission" runat="server" Text="Mission : "></asp:Label><br /><asp:Button 
                ID="OuiResponsable" runat="server" Text="Oui" onclick="OuiResponsable_Click"/><asp:Button 
                ID="NonResponsable" runat="server" Text="Non" onclick="NonResponsable_Click"/></asp:Panel>
                </div>
    </form>
</body>
</html>
