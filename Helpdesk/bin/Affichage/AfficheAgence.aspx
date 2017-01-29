<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AfficheAgence.aspx.cs" Inherits="Helpdesk.AfficheAgence" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../Styles/main.css" />
    <link rel="Stylesheet" href="../Styles/BodyFrame.css" />
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
                    <iframe ID="Frame" runat="server" src="../Recherche/RechercheAgence.aspx" 
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
   <p align="center"><font size="+3" Color="teal">&nbsp;&nbsp;&nbsp;&nbsp; Consulter les agences</font></p>
        <div  style="position:absolute; left: 124px; top: 80px; width: 541px;">
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
        <div style="position:absolute; top: 108px; left: -9px; width: 686px; height: 397px;">
        <eo:MultiPage ID="MultiPage1" runat="server" Width="702px">
            <eo:PageView ID="Agence" runat="server" Width="100%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="DetAgence" HeaderStyle-BackColor="Green" 
                        HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" 
                        BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" 
                        HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center" >
            <Columns>
                <asp:BoundField DataField="Code" HeaderText="Code" 
                    SortExpression="Code" FooterText="Code" >
                </asp:BoundField>
                <asp:BoundField DataField="IP" HeaderText="@ IP" 
                    SortExpression="IP" >
                </asp:BoundField>
                <asp:BoundField DataField="Nom" HeaderText="Nom" 
                    SortExpression="Nom" >
                </asp:BoundField>
                <asp:BoundField DataField="Adresse" HeaderText="Adresse" 
                    SortExpression="Adresse" >
                </asp:BoundField>
                <asp:BoundField DataField="Description" 
                    HeaderText="Descriptions" SortExpression="Description" >
                </asp:BoundField>
            </Columns>
        </asp:GridView>
            </eo:PageView>
                        <eo:PageView ID="AgenceResponsable" runat="server" Width="100%">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Responsable" 
                                HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                                HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                                CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center" >
                                <Columns>
                                    <asp:BoundField DataField="Nom" HeaderText="Nom" 
                                        SortExpression="Nom">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Prenom" HeaderText="Prenom" 
                                        SortExpression="Prenom">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" 
                                        SortExpression="Email">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Teléphone" HeaderText="Teléphone" 
                                        SortExpression="Teléphone">
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                                    BorderWidth="4px" ForeColor="Black" />
                                <PagerStyle BackColor="Khaki" />
                            </asp:GridView>
            </eo:PageView>
                        <eo:PageView ID="AgenceEquipements" runat="server" Width="100%">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="EquipementsDet" HeaderStyle-BackColor="Green" 
                                HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" 
                                BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" 
                                HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center" >
                                <Columns>
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description">
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
            </eo:PageView>
                        <eo:PageView ID="AgenceRouteur" runat="server" Width="100%">
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="RouteurDet" HeaderStyle-BackColor="Green" 
                                HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" 
                                BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" 
                                HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center">
                                <Columns>
                                    <asp:BoundField DataField="Etat" HeaderText="Etat" 
                                        SortExpression="Etat">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                                        SortExpression="Type">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IP" HeaderText="IP" 
                                        SortExpression="IP">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MAC" HeaderText="MAC" 
                                        SortExpression="MAC">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description">
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                                    BorderWidth="4px" ForeColor="Black" />
                                <PagerStyle BackColor="Khaki" />
                            </asp:GridView>
            </eo:PageView>
                                    <eo:PageView ID="AgenceSwitcheur" runat="server" Width="100%">
                                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SwitcheurDet" 
                                            HorizontalAlign="Center" HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki">
                                            <Columns>
                                                <asp:BoundField DataField="Etat" HeaderText="Etat" 
                                                    SortExpression="Etat">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                                                    SortExpression="Type">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IP" HeaderText="IP" 
                                                    SortExpression="IP">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MAC" HeaderText="MAC" 
                                                    SortExpression="MAC">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description">
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                                                BorderWidth="4px" ForeColor="Black" />
                                            <PagerStyle BackColor="Khaki" />
                                        </asp:GridView>
            </eo:PageView>
                                    <eo:PageView ID="AgenceModem" runat="server" Width="100%">
                                        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="ModemDet" HeaderStyle-BackColor="Green" 
                                            HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" 
                                            BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" 
                                            HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center">

                                            <Columns>
                                                <asp:BoundField DataField="Etat" HeaderText="Etat" 
                                                    SortExpression="Etat">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                                                    SortExpression="Type">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description">
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
            </eo:PageView>
                                    <eo:PageView ID="AgenceLiaisons" runat="server" Width="100%">
                                        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataSourceID="LiaisonsDet" 
                                            HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                                            HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                                            CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center">
                                            <Columns>
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description">
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                                                BorderWidth="4px" ForeColor="Black" />
                                            <PagerStyle BackColor="Khaki" />
                                        </asp:GridView>
            </eo:PageView>
                                    <eo:PageView ID="AgenceAdsl" runat="server" Width="100%">
                                        <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataSourceID="AdslDet" HeaderStyle-BackColor="Green" 
                                            HeaderStyle-BorderColor="Black" HeaderStyle-BorderStyle="Inset" 
                                            BackColor="Beige" ForeColor="DarkGreen" CellPadding="5" CellSpacing="5" 
                                            HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center">
                                            <Columns>
                                                <asp:BoundField DataField="Etat_Tunnel" HeaderText="Etat Tunnel" 
                                                    SortExpression="Etat_Tunnel">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Etat_Carte" HeaderText="Etat Carte" 
                                                    SortExpression="Etat_Carte">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Adresse_Tunnel" HeaderText="IP Tunnel" 
                                                    SortExpression="Adresse_Tunnel">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Adresse_Carte" HeaderText="IP Carte" 
                                                    SortExpression="Adresse_Carte">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description">
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                                                BorderWidth="4px" ForeColor="Black" />
                                            <PagerStyle BackColor="Khaki" />
                                        </asp:GridView>
            </eo:PageView>
                                    <eo:PageView ID="AgenceFramerelay" runat="server" Width="100%">
                                        <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataSourceID="FrameRelayDet" 
                                            HeaderStyle-BackColor="Green" HeaderStyle-BorderColor="Black" 
                                            HeaderStyle-BorderStyle="Inset" BackColor="Beige" ForeColor="DarkGreen" 
                                            CellPadding="5" CellSpacing="5" HeaderStyle-BorderWidth="4" HeaderStyle-ForeColor="Black"
                     PagerStyle-BackColor="Khaki" HorizontalAlign="Center">
                                            <Columns>
                                                <asp:BoundField DataField="Etat" HeaderText="Etat" 
                                                    SortExpression="Etat">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IP" HeaderText="IP" 
                                                    SortExpression="IP">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description">
                                                </asp:BoundField>
                                            </Columns>
                                            <HeaderStyle BackColor="Green" BorderColor="Black" BorderStyle="Inset" 
                                                BorderWidth="4px" ForeColor="Black" />
                                            <PagerStyle BackColor="Khaki" />
                                        </asp:GridView>
            </eo:PageView>
        </eo:MultiPage>
        </div>
        </div>
        <div style="position:absolute; top: 75px; left: -5px; height: 220px;">
        <asp:SqlDataSource ID="FrameRelayDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                SelectCommand="SELECT Liaison.Etat, Liaison.Adresse_IP AS IP, Liaison.Description FROM Liaison_Framerelay INNER JOIN Liaison ON Liaison_Framerelay.ID_Liaison = Liaison.ID_Liaison WHERE (Liaison.ID_Liaison = @IDFrameRelay) AND (Liaison_Framerelay.ID_Liaison = @IDFrameRelay)">
            <SelectParameters>
                <asp:ControlParameter ControlID="FrameRelay" DefaultValue="0" 
                    Name="IDFrameRelay" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AdslDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                SelectCommand="SELECT Liaison.Etat AS Etat_Tunnel, Liaison_Adsl.Etat_Carte AS Etat_Carte, Liaison.Adresse_IP AS Adresse_Tunnel, Liaison_Adsl.Adresse_Carte AS Adresse_Carte, Liaison.Description FROM Liaison_Adsl INNER JOIN Liaison ON Liaison_Adsl.ID_Liaison = Liaison.ID_Liaison WHERE (Liaison.ID_Liaison = @IDAdsl) AND (Liaison_Adsl.ID_Liaison = @IDAdsl)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Adsl" DefaultValue="0" Name="IDAdsl" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="LiaisonsDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                
                SelectCommand="SELECT Liaison_Description AS Description FROM Agences WHERE (ID = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="ID" 
                    QueryStringField="IDAgence" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ModemDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                
                
                SelectCommand="SELECT Equipement.Etat, Equipement.Type + '-' + Equipement.Model AS Type, Equipement.Description FROM Equipement INNER JOIN Equipement_Modems ON Equipement.ID_Equipement = Equipement_Modems.ID_Equipement WHERE (Equipement.ID_Equipement = @IDModem) AND (Equipement_Modems.ID_Equipement = @IDModem)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Modem" DefaultValue="0" Name="IDModem" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SwitcheurDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                
                SelectCommand="SELECT Equipement.Etat, Equipement.Type + '-' + Equipement.Model AS Type, Equipement_Switchers.Adresse_IP AS IP, Equipement_Switchers.Adresse_MAC AS MAC, Equipement.Description FROM Equipement_Switchers INNER JOIN Equipement ON Equipement_Switchers.ID_Equipement = Equipement.ID_Equipement WHERE (Equipement_Switchers.ID_Equipement = @IDSwitcheur) AND (Equipement.ID_Equipement = @IDSwitcheur)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Switcheur" DefaultValue="0" Name="IDSwitcheur" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="RouteurDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
                
                
                SelectCommand="SELECT Equipement.Etat, Equipement.Type + '-' + Equipement.Model AS Type, Equipement_Routeurs.Adresse_IP AS IP, Equipement_Routeurs.Adresse_MAC AS MAC, Equipement.Description FROM Equipement_Routeurs INNER JOIN Equipement ON Equipement_Routeurs.ID_Equipement = Equipement.ID_Equipement WHERE (Equipement.ID_Equipement = @Routeur) AND (Equipement_Routeurs.ID_Equipement = @Routeur)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Routeur" DefaultValue="0" Name="Routeur" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="EquipementsDet" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                
                
                SelectCommand="SELECT Equipement_Description AS Description FROM Agences WHERE (ID = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="ID" 
                    QueryStringField="IDAgence" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Responsable" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                
                SelectCommand="SELECT Nom, Prenom, Email, Teléphone FROM Responsables WHERE (ID = @IDResponsable)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ResponsableAgence" DefaultValue="0" 
                    Name="IDResponsable" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DetAgence" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
                
                
                
                
                SelectCommand="SELECT Agences.Code AS Code, Agences.Adresse_IP AS IP, Agences.Nom AS Nom, Zones.Libelle + ', ' + Agences.Adresse AS Adresse, Agences.Descriptions AS Description FROM Agences INNER JOIN Zones ON Agences.Zone = Zones.ID WHERE (Agences.ID = @IDAgence)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="IDAgence" 
                    QueryStringField="IDAgence" />
            </SelectParameters>
        </asp:SqlDataSource>
    

    
        <asp:HiddenField ID="ResponsableAgence" runat="server" />
        <asp:HiddenField  ID="Routeur" runat="server" />
        <asp:HiddenField ID="Switcheur" runat="server" />
        <asp:HiddenField ID="Modem" runat="server" />
        <asp:HiddenField ID="Adsl" runat="server" />
        <asp:HiddenField ID="FrameRelay" runat="server" />
    </div>
    </form>
</body>
</html>
