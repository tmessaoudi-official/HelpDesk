<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Helpdesk.Default" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<html>
<head runat="server">
    <title>Accueil</title>
        <link href="Styles/Responsable.css" rel="stylesheet" type="text/css" />
        <link href="Styles/Compteinfo.css" rel="stylesheet" type="text/css" />
      	<link rel="stylesheet" href="Styles/animated-menu.css"/>
        <link rel="Stylesheet" href="Styles/main.css" />
        <script src="JavaScript/jquery-1.3.js" type="text/javascript"></script>
	    <script src="JavaScript/jquery.easing.1.3.js" type="text/javascript"></script>
	    <script src="JavaScript/animated-menu.js" type="text/javascript"></script>
        <script src="JavaScript/overlay.js" type="text/javascript"></script>
        <script src="JavaScript/overlayUser.js" type="text/javascript"></script>
        <style type="text/css">
       .drag
        {
        position:absolute;
        }
        .dragBody
        {}
        .HandleCSS  
        {  
            width:20px;  
            height:20px;  
            background-color:Red;  
            }  
    </style>
        </head>
        
<body background="images/bg.png" style="background-repeat:no-repeat;">
 <form id="Form" runat="server">
 
 <div id="msgboxpanel" runat="server"></div>
 <div style="width: 207px; margin-top:-8; margin-left:-8;">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
         <ajaxToolkit:CollapsiblePanelExtender ID="cpe" runat="Server" 
             CollapseControlID="Image1" Collapsed="true" 
             CollapsedImage="~/images/expand_blue.jpg" CollapsedText="(More)" 
             ExpandControlID="Image1" ExpandedImage="~/images/collapse_blue.jpg" 
             ExpandedText="(Less)" ImageControlID="Image1" SuppressPostBack="true" 
             TargetControlID="PanelBody" TextLabelID="Label1">
         </ajaxToolkit:CollapsiblePanelExtender>

         <ajaxToolkit:DragPanelExtender ID="DragPanelExtender1" runat="server" 
             DragHandleID="PanelHeader" TargetControlID="PanelContainer">
         </ajaxToolkit:DragPanelExtender> 
         <asp:Panel ID="PanelContainer" runat="server">
             <asp:Panel ID="PanelHeader" runat="server" BackImageUrl="~/images/Bgb.jpg" Height="20px" 
                 Width="217px">
                 
                 <asp:Image ID="Image1" runat="server" ImageUrl="images/expand_blue.jpg" />
                 <asp:Label ID="Check" Text="Checking ..." runat="server" ForeColor="White"></asp:Label>
                 <asp:Label ID="Label1" runat="server" ForeColor="White" Text="(More)"></asp:Label>
             </asp:Panel>
             <asp:Panel ID="PanelBody" runat="server" CssClass="dragBody" Height="397px" 
                 Width="217px">
                 <iframe runat="server" id="Frame" src="Check.aspx" 
                     style="width: 213px; height: 379px; margin-right: 0px;">
                 </iframe>
             </asp:Panel>
         </asp:Panel>
  
               <script type="text/javascript">
                   function setBodyHeightToContentHeight() {
                       document.body.style.height = Math.max(document.documentElement.scrollHeight, document.body.scrollHeight) + "px";
                   }
                   setBodyHeightToContentHeight();
                   window.attachEvent('onresize', setBodyHeightToContentHeight);
    </script>   
    </div>
 <div id="overlay" class="calque"></div>
<div id="window" class="window" title="Helpdesk Task">
<div style="position :absolute; width: 919px; height : 590px; border-left-style:outset; border-right-style:outset; border-left-width:4PX; border-right-width:4PX;"></div>
<iframe scrolling="no" class = "contemp_window" id = "contempwindow" name = "contempwindow" title="Helpdesk Task"></iframe>

</div>
 <div id="banner" style="background-color:#006600; border-style:outset; border-width:4PX;" class="banner">
 <div id="overlay1" class="calque1" style="border-style:hidden;"></div>
 <div id="window1" class="window1" title="Helpdesk Task" style="border-style:hidden;">

<iframe class = "contemp_window1" id = "contempwindow1" name = "contempwindow1" title="Helpdesk Task" style="border-style:hidden;"></iframe>

</div>

  <div id="logo" class="logo">
    <object style="position:absolute; top: -13px; left: 0px; height: 56px;" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
          codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" 
          width="152" accesskey="L" tabindex="1" title="Logo" style="height: 87px">
      <param name="movie" value="images/Logo.swf">
      <param name="quality" value="high">
      <param name="wmode" value="opaque">
      <embed src="images/Logo.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="152" height="132"></embed>
    </object>
  </div>
  <div id="logoutpanel" class="logout">

    <asp:Label style="background-image:url(../images/Bgb.jpg);" ToolTip="" ID="LoginName" runat="server" Font-Size="Large" ForeColor="White"></asp:Label>
          <ajaxToolkit:HoverMenuExtender ID="bu_HoverMenuExtender" runat="server" 
          DynamicServicePath="" PopupControlID="POP" Enabled="True" TargetControlID="LoginName">
      </ajaxToolkit:HoverMenuExtender>
      <asp:Panel style="position:absolute; top: 22px; left: -368px; height: 500px; width: 380px;" ID="POP" 
          runat="server">
<div id="DivEditWindow">
     <iframe ID="I1" frameborder="0" name="I1" scrolling="no" 
              src="EditUser.aspx" style="height: 500px; width: 380px;"></iframe>
</div>         
</asp:Panel>
     <br />
  &nbsp;<asp:LinkButton ID="Deconnexion" 
          runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="White" 
          onclick="LinkButton1_Click">Deconnexion</asp:LinkButton>
      <a href="#" onClick="affiche_overlay_window1('./images/load.gif','userinfo.aspx');">
      <asp:Image CssClass="History" runat="server" ID="History" ImageUrl="~/images/History.png" ToolTip="Afficher mon historique de connexion"></asp:Image></a>
     </div>
<div id="menu1"  class="Menu1">
        <div id="menu" class="menu">
        
<ul>
		<li class="Item1">
			<p><strong><font size="+1" style="border-style:outset; border-width:4;"><a href="#">Gestion des Agences</a></font></strong></p>
            <p class="subtext"><strong><a href="#" OnClick = "affiche_overlay_window('./images/load.gif','Affichage/ZoneAffichage.aspx');">Consulter les Agences</a></strong></p>
			<p class="subtext"><strong><a href="#" OnClick = "affiche_overlay_window('./images/load.gif','Affichage/Insert.aspx');">Ajouter une agence</a></strong></p>
        </li>
        <li class="Item2">
		  <p><strong><font size="+1" style="border-style:outset; border-width:4;"><a href="#" OnClick = "affiche_overlay_window('./images/load.gif','Historique/ZoneHistoriques.aspx');">Gestion d'historiques</a></font></strong></p>
		</li>
        		<li class="Item3">
			<p><strong><font size="+1" style="border-style:outset; border-width:4;"><a href="#">À propos des développeurs</a></font></strong></p>
			<p class="subtext"><strong><a href="#">Messaoudi Takieddine</a></strong></strong></p>
            <p class="subtext"><strong><a href="#">Hatem Hassan</a></strong></strong></p>
		</li>
	    <li>&nbsp; </li>
	</ul>
    </div>
</div>
     </div>

 <div id="Div2" class="Bottom" style="background-color:#006600;">
    <div id="footer" class="footer" style="background-color:#006600;">
        <asp:Label ID="Label2" runat="server" 
        Text="CopyRight @ Messaoudi Takieddine and Hatem Hassan 2012" Font-Bold="True" 
        Font-Italic="True" Font-Names="Andalus" Font-Size="Small" ForeColor="White"></asp:Label></div>

</div>
 </form>
 </body>
 </html>