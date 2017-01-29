<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AfficheHistoriqueDate.aspx.cs" Inherits="Helpdesk.Recherche.AfficheHistoriqueDate" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../Styles/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server"></div>
         <div style=" position:absolute; width: 247px; margin-top: -8; margin-left: -8; height: 281px; top: 0px; left: 4px; right: 783px;">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" 
                EnablePageMethods="true" />
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
            <asp:Panel ID="PanelContainer" runat="server" Height="193px">
                <asp:Panel ID="PanelHeader" runat="server" BackImageUrl="~/images/Bgb.jpg" 
                    Height="20px" Width="244px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                    <asp:Label ID="Check" runat="server" ForeColor="White" Text="Recherche"></asp:Label>
                    <asp:Label ID="Label1" runat="server" ForeColor="White" Text="(More)"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="PanelBody" runat="server" CssClass="dragBody" Height="224px" 
                    Width="242px">
                    <iframe ID="Frame" runat="server" src="RechercheAgence.aspx" 
                        style="width: 239px; height: 217px; margin-right: 0px;"></iframe>
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
    <p align="center"><font size="+3" Color="teal">&nbsp;&nbsp;&nbsp;&nbsp; Recherche Dans L'Historiques</font></p>
    

            <div  style="position: absolute; left: 145px; top: 104px; width: 495px; height: 105px;">
<eo:TabStrip ID="TabStrip1" runat="server" ControlSkinID="None" 
            MultiPageID="MultiPage1" Width="363px" SelectedIndex="0">
            <lookitems>
                <eo:TabItem 
                    ItemID="_TopGroup" 
                    LeftIcon-Url="" 
                    RightIcon-Url="">
                    <subgroup itemspacing="1" 
                        
                        style-csstext="background-image:url(00010410);background-position-y:bottom;background-repeat:repeat-x;cursor:hand;font-family:'Microsoft Sans Serif',Verdana;font-size:8.25pt;">
                    </subgroup>
                </eo:TabItem>
                <eo:TabItem HoverStyle-CssText="background-image:url('~/images/Menu.png');background-repeat:repeat-x;border-bottom-color:#006600;border-bottom-style:outset;border-bottom-width:4px;border-left-color:#006600;border-left-style:outset;border-left-width:4px;border-right-color:#006600;border-right-style:outset;border-right-width:4px;border-top-color:#006600;border-top-style:outset;border-top-width:4px;color:white;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;position:relative;top:2px;" 
                    ItemID="_Default" LeftIcon-Url="" 
                    NormalStyle-CssText="background-image:url('~/images/Menu.png');border-bottom-color:green;border-bottom-style:outset;border-bottom-width:4px;border-left-color:green;border-left-style:outset;border-left-width:4px;border-right-color:green;border-right-style:outset;border-right-width:4px;border-top-color:green;border-top-style:outset;border-top-width:4px;color:white;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;" 
                    RightIcon-Url="" 
                    SelectedStyle-CssText="background-image:url(00010403);background-repeat:repeat-x;border-bottom-color:#cccccc;border-bottom-style:outset;border-bottom-width:4px;border-left-color:#cccccc;border-left-style:outset;border-left-width:4px;border-right-color:#cccccc;border-right-style:outset;border-right-width:4px;border-top-color:#cccccc;border-top-style:outset;border-top-width:4px;color:black;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;" 
                    Text-Padding-Bottom="2" Text-Padding-Top="1">
                    <SubGroup ItemSpacing="1" 
                        Style-CssText="background-image:url(00010410);background-position-y:bottom;background-repeat:repeat-x;color:black;cursor:hand;font-family:'Microsoft Sans Serif',Verdana;font-size:8.25pt;">
                    </SubGroup>
                </eo:TabItem>
            </lookitems>
            <TopGroup>
                <Items>
                    <eo:TabItem Selected="true" Text-Html="Détaille Agence" Width="150">
                    </eo:TabItem>
                    <eo:TabItem Text-Html="Responsable" Width="150">
                    </eo:TabItem>
                    <eo:TabItem Text-Html="Equipements" Width="150">
                        <SubGroup>
                            <Items>
                                <eo:TabItem Selected="true" PageViewID="AgenceEquipements" 
                                    Text-Html="Equipements" Width="60">
                                </eo:TabItem>
                                <eo:TabItem PageViewID="AgenceRouteur" Text-Html="Routeur" Width="60">
                                </eo:TabItem>
                                <eo:TabItem PageViewID="AgenceSwitcheur" Text-Html="Switcheur" Width="60">
                                </eo:TabItem>
                                <eo:TabItem PageViewID="AgenceModem" Text-Html="Modem" Width="60">
                                </eo:TabItem>
                            </Items>
                        </SubGroup>
                    </eo:TabItem>
                    <eo:TabItem Text-Html="Liaisons" Width="150">
                        <SubGroup>
                            <Items>
                                <eo:TabItem Selected="true" PageViewID="AgenceLiaisons" Text-Html="Liaisons" 
                                    Width="60">
                                </eo:TabItem>
                                <eo:TabItem Text-HorizontalAlign="Center" PageViewID="AgenceAdsl" Text-Html="Adsl" Width="60">
                                </eo:TabItem>
                                <eo:TabItem Text-HorizontalAlign="Center" PageViewID="AgenceFramerelay" Text-Html="Framerelay" Width="60">
                                </eo:TabItem>
                            </Items>
                        </SubGroup>
                    </eo:TabItem>
                </Items>
            </TopGroup>
        </eo:TabStrip>
        <div style="position: absolute; top: 91px; left: -12px; width: 670px;">
        <eo:MultiPage ID="MultiPage1" runat="server" Height="180px" Width="101%" 
                style="margin-right: 11px">
            <eo:PageView ID="DetailleAgence" runat="server" Width="100%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False"
                     DataSourceID="HIstAgence" HorizontalAlign="Center" 
                    OnPageIndexChanging="GridView1_IndexChanging" PageSize="4"
                    HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Green" 
                    HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                    CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                        <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                        <asp:BoundField DataField="Adresse_IP" HeaderText="Adresse IP" 
                            SortExpression="Adresse_IP" />
                        <asp:BoundField DataField="Adresse" HeaderText="Adresse" ReadOnly="True" 
                            SortExpression="Adresse" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateA" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeA" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="Modifié_Par" HeaderText="Modifiéé Par" 
                            SortExpression="Modifié_Par" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Green" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
            <eo:PageView ID="AgenceResponsable" runat="server" Width="100%">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstResponsable" 
                    HorizontalAlign="Center" OnPageIndexChanging="GridView2_IndexChanging" 
                    PageSize="4" HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                    HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                    CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                        <asp:BoundField DataField="Prenom" HeaderText="Prenom" 
                            SortExpression="Prenom" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Teléphone" HeaderText="Teléphone" 
                            SortExpression="Teléphone" />
                        <asp:BoundField DataField="DateDebut" DataFormatString="{0:yyyy-MM-dd}" Visible="false" HtmlEncode="false" HeaderText="DateDebut" 
                            SortExpression="DateDebut" />
                     <asp:BoundField DataField="TimeDebut" DataFormatString="{0:T}" Visible="false" HtmlEncode="false" HeaderText="TimeDebut" 
                            SortExpression="TimeDebut" />
                            <asp:TemplateField HeaderText="Date Affectation">
                            <ItemTemplate>
                          <asp:Label ID="DateD" runat="server" Text=<%#Eval("DateDebut","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeD" runat="server" Text=<%#Eval("TimeDebut","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="DateFin" Visible="false" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" HeaderText="DateFin" 
                            SortExpression="DateFin" />

                        <asp:BoundField DataField="TimeFin" Visible="false" DataFormatString="{0:T}" HtmlEncode="false" HeaderText="TimeFin" 
                            SortExpression="TimeFin" />
                         <asp:TemplateField HeaderText="Date Démission">
                            <ItemTemplate>
                          <asp:Label ID="DateF" runat="server" Text=<%#Eval("DateFin","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="imeF" runat="server" Text=<%#Eval("TimeFin","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>

                        <asp:BoundField DataField="ModifiéPar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéPar" />

                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
            <eo:PageView ID="AgenceEquipements" runat="server" Width="100%">
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstEquipement" 
                    HorizontalAlign="Center" OnPageIndexChanging="GridView3_IndexChanging" 
                    PageSize="4" HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                    HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                    CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Equipement_Description" HeaderText="Description" 
                            SortExpression="Equipement_Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false"
                            SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateE" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeE" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiePar" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
            <eo:PageView ID="AgenceRouteur" runat="server" Width="100%">
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstRouteur" 
                    HorizontalAlign="Center" OnPageIndexChanging="GridView4_IndexChanging" 
                    PageSize="4" HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                    HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                    CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Etat" HeaderText="Etat" 
                            SortExpression="Etat" />
                        <asp:BoundField DataField="Type" HeaderText="Type" 
                            SortExpression="Type" ReadOnly="True" />
                        <asp:BoundField DataField="Adresse_IP" HeaderText="Adresse IP" 
                            SortExpression="Adresse_IP" />
                        <asp:BoundField DataField="Adresse_MAC" 
                            HeaderText="Adresse MAC" 
                            SortExpression="Adresse_MAC" />
                        <asp:BoundField DataField="Description" 
                            HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateR" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeR" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiéePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéePar" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
                <eo:PageView ID="AgenceSwitcheur" runat="server" Width="100%">
                <asp:GridView ID="GridView19" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstSwitcheur" 
                    HorizontalAlign="Center" OnPageIndexChanging="GridView19_IndexChanging" 
                    PageSize="4" HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                        HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                        CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Etat" 
                            HeaderText="Etat" 
                            SortExpression="Etat" />
                        <asp:BoundField DataField="Type" 
                            HeaderText="Type" 
                            SortExpression="Type" ReadOnly="True" />
                        <asp:BoundField DataField="Adresse_IP" 
                            HeaderText="Adresse IP" 
                            SortExpression="Adresse_IP" />
                        <asp:BoundField DataField="Adresse_MAC" 
                            HeaderText="Adresse MAC" 
                            SortExpression="Adresse_MAC" />
                        <asp:BoundField DataField="Description" 
                            HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date" SortExpression="Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateS" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeS" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiéePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéePar" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
            <eo:PageView ID="AgenceModem" runat="server" Width="100%">
                <asp:GridView ID="GridView6" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstModem" HorizontalAlign="Center" 
                    OnPageIndexChanging="GridView6_IndexChanging" PageSize="4" 
                    HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                    HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                    CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Etat" HeaderText="Etat" 
                            SortExpression="Etat" />
                        <asp:BoundField DataField="Type" HeaderText="Type" 
                            SortExpression="Type" ReadOnly="True" />
                                                    <asp:BoundField DataField="Description" 
                            HeaderText="Description" 
                            SortExpression="Description" />
                                                    <asp:BoundField DataField="Date" Visible="false" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" HeaderText="Date" 
                            SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" 
                            SortExpression="Time" />
                           <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateM" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeM" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiéePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéePar" />


                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
            <eo:PageView ID="AgenceLiaisons" runat="server" Width="100%">
                <asp:GridView ID="GridView7" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstLiaison" 
                    HorizontalAlign="Center" OnPageIndexChanging="GridView7_IndexChanging" 
                    PageSize="4" HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Liaison_Description" HeaderText="Description" 
                            SortExpression="Liaison_Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" 
                            SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateL" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeL" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiéePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéePar" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
            <eo:PageView ID="AgenceAdsl" runat="server" Width="100%">
                <asp:GridView ID="GridView8" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstAdsl" HorizontalAlign="Center" 
                    OnPageIndexChanging="GridView8_IndexChanging" PageSize="4" 
                    HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                    HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                    CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Etat_Tunnel" HeaderText="Etat Tunnel" 
                            SortExpression="Etat_Tunnel" />
                        <asp:BoundField DataField="Etat_Carte" HeaderText="Etat Carte" 
                            SortExpression="Etat_Carte" />
                        <asp:BoundField DataField="Adresse_Tunnel" HeaderText="IP Tunnel" 
                            SortExpression="Adresse_Tunnel" />
                        <asp:BoundField DataField="Adresse_Carte" HeaderText="IP Carte" 
                            SortExpression="Adresse_Carte" />
                        <asp:BoundField DataField="Description" 
                            HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" HeaderText="Time" SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateAd" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeAd" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiéePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéePar" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
                        <eo:PageView ID="AgenceFramerelay" runat="server" Width="100%">
                <asp:GridView ID="GridView9" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="HIstFrameRelay" HorizontalAlign="Center" 
                    OnPageIndexChanging="GridView9_IndexChanging" PageSize="4" 
                                HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                                HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                                CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" >
                    <Columns>
                        <asp:BoundField DataField="Etat" HeaderText="Etat" 
                            SortExpression="Etat" />
                        <asp:BoundField DataField="IP" HeaderText="IP" 
                            SortExpression="IP" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Date" Visible="false" HeaderText="Date"  DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false"
                            SortExpression="Date" />
                        <asp:BoundField DataField="Time" Visible="false" 
                            HeaderText="Time" 
                            SortExpression="Time" />
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                          <asp:Label ID="DateF" runat="server" Text=<%#Eval("Date","{0:yyyy-MM-dd}")%>></asp:Label> - <asp:Label ID="TimeF" runat="server" Text=<%#Eval("Time","{0:T}")%>></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="ModifiéePar" HeaderText="Modifiée Par" 
                            SortExpression="ModifiéePar" />
                    </Columns>
                    <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                        BorderWidth="4px" ForeColor="Black" />
                    <PagerStyle BackColor="Khaki" />
                </asp:GridView>
            </eo:PageView>
        </eo:MultiPage>
        </div>
        </div>
        <div style="position: absolute; left: 376px; top: 73px;">
            <asp:Label ID="Label10" runat="server" BackColor="#FFFF99" ForeColor="Red" 
            Text="(*) : Champ intact"></asp:Label>
            </div>

        <div style="position: absolute; width: 130px;">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        
                <asp:SqlDataSource ID="HIstFrameRelay" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            
                
                SelectCommand="SELECT Etat, Adresse_IP AS IP, Description, Date AS Date, Time AS Time, Personnel AS ModifiéePar FROM Historiques_Framerelays WHERE (Framerelay_ID = @Framerelay) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HFramerelay" DefaultValue="0" 
                    Name="Framerelay" PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstAdsl" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                SelectCommand="SELECT Etat_Tunnel, Etat_Carte, Adresse_Tunnel, Adresse_Carte, Description, Date AS Date, Time AS Time, Personnel AS ModifiéePar FROM Historiques_Adsls WHERE (Adsl_ID = @Adsl) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HAdsl" DefaultValue="0" Name="Adsl" 
                    PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstLiaison" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
                
                SelectCommand="SELECT Liaison_Description, Date AS Date, Time AS Time, Personnel AS ModifiéePar FROM Historiques_Agences WHERE (Agence_ID = @Liaison) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HLiaison" DefaultValue="0" Name="Liaison" 
                    PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstModem" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            
                
                SelectCommand="SELECT Etat, Type + '-' + Model AS Type, Date AS Date, Time AS Time, Personnel AS ModifiéePar, Description FROM Historiques_Modems WHERE (Modem_ID = @Modem) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HModem" DefaultValue="0" Name="Modem" 
                    PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstSwitcheur" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            
                
                SelectCommand="SELECT Etat, Type + '-' + Model AS Type, Adresse_IP, Adresse_MAC, Description, Date AS Date, Time AS Time, Personnel AS ModifiéePar FROM Historiques_Switcheurs WHERE (Switcheur_ID = @Switcheur) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HSwitcheur" DefaultValue="0" Name="Switcheur" 
                    PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstRouteur" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            
                
                SelectCommand="SELECT Etat, Type + '-' + Model AS Type, Adresse_IP, Adresse_MAC, Description, Date AS Date, Time AS Time, Personnel AS ModifiéePar FROM Historiques_Routeurs WHERE (Routeur_ID = @Routeur) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HRouteur" DefaultValue="0" Name="Routeur" 
                    PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstEquipement" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            
                
                SelectCommand="SELECT Equipement_Description, Date AS Date, Time AS Time, Personnel AS ModifiePar FROM Historiques_Agences WHERE (Agence_ID = @Equipement) AND (Date = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HEquipement" DefaultValue="0" 
                    Name="Equipement" PropertyName="Value" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstResponsable" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            
                
                
                
                SelectCommand="SELECT Responsables.Nom, Responsables.Prenom, Responsables.Email, Responsables.Teléphone, Responsabilité.DateDebut, Responsabilité.TimeDebut, Responsabilité.DateFin, Responsabilité.TimeFin, Responsabilité.Personnel AS ModifiéPar FROM Responsables INNER JOIN Responsabilité ON Responsables.ID = Responsabilité.Responsable_ID WHERE (Responsabilité.Agence_ID = @IDAgence) AND (Responsabilité.DateFin = @Date) AND (Responsabilité.DateFin IS NOT NULL)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="IDAgence" 
                    QueryStringField="IDAgence" />
                    <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="HIstAgence" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 

                
                    SelectCommand="SELECT Code, Nom, Adresse_IP, Zone + ', ' + Adresse AS Adresse, Description, Date, Time, Personnel AS Modifié_Par FROM Historiques_Agences WHERE (Agence_ID = @IDAgence) AND (Date = @Date)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="IDAgence" 
                    QueryStringField="IDAgence" />
                <asp:ControlParameter ControlID="HDate" Name="Date" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="IDagence" runat="server" />
        <asp:HiddenField ID="HEquipement" runat="server" />
        <asp:HiddenField ID="HLiaison" runat="server" />
        <asp:HiddenField ID="HRouteur" runat="server" />
        <asp:HiddenField ID="HSwitcheur" runat="server" />
        <asp:HiddenField ID="HModem" runat="server" />
        <asp:HiddenField ID="HFramerelay" runat="server" />
        <asp:HiddenField ID="HAdsl" runat="server" />
        <asp:HiddenField ID="HResponsable" runat="server" />
        <asp:HiddenField ID="HDate" runat="server" />
    </div>
    </form>
</body>
</html>
