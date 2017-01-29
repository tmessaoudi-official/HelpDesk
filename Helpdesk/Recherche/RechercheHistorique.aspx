<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechercheHistorique.aspx.cs" Inherits="Helpdesk.Recherche.RechercheHistorique" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../Styles/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server">
    </div>
    <p align="center"><font size="+3" Color="teal">&nbsp;&nbsp;&nbsp;&nbsp; Recherche Dans L'Historiques</font></p>
    <div style="position:absolute; top: 75px; left: 349px;">

    
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
                    <eo:TabItem Text-Html="Par Agence">
                        <SubGroup>
                            <Items>
                                <eo:TabItem Selected="true" PageViewID="Nom" Text-Html="Nom">
                                </eo:TabItem>
                                <eo:TabItem PageViewID="Code" Text-Html="Code">
                                </eo:TabItem>
                                <eo:TabItem PageViewID="IP" Text-Html="IP">
                                </eo:TabItem>
                            </Items>
                        </SubGroup>
                    </eo:TabItem>
                    <eo:TabItem PageViewID="Date" Text-Html="Par Date">
                    </eo:TabItem>
                    <eo:TabItem Text-Html="Par Accés">
                        <SubGroup>
                            <Items>
                                <eo:TabItem Selected="true" PageViewID="Framerelay" Text-Html="Framerelay">
                                </eo:TabItem>
                                <eo:TabItem Text-Html="Adsl">
                                    <SubGroup>
                                        <Items>
                                            <eo:TabItem Selected="true" PageViewID="Carte" Text-Html="Carte">
                                            </eo:TabItem>
                                            <eo:TabItem PageViewID="Tunnel" Text-Html="Tunnel">
                                            </eo:TabItem>
                                        </Items>
                                    </SubGroup>
                                </eo:TabItem>
                            </Items>
                        </SubGroup>
                    </eo:TabItem>
                </Items>
            </TopGroup>
        </eo:TabStrip>
    
        <eo:MultiPage ID="MultiPage1" runat="server" Height="180px" Width="55%">
            <eo:PageView ID="Nom" runat="server" Width="100%">
                                                                            <asp:Label ID="Label2" runat="server" Text="Nom Agence"></asp:Label>
                                                                &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="NomAgence" runat="server"></asp:TextBox>
                                                                <br />
                                                                <asp:Button ID="SubmitNom" runat="server" 
                                                                    Text="Recherche" onclick="SubmitNom_Click" />
                                        <br />
            </eo:PageView>
                        <eo:PageView ID="Code" runat="server" Width="100%">
                                                                                        <asp:Label ID="Label3" runat="server" Text="Code Agence"></asp:Label>
                                                                &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="CodeAgence" runat="server"></asp:TextBox>
                                        <br />
                                                                <asp:Button ID="SubmitCode" runat="server"
                                                                    Text="Recherche" onclick="SubmitCode_Click" />
                                                                <br />
            </eo:PageView>
                        <eo:PageView ID="IP" runat="server" Width="100%">
                                                                                        <asp:Label ID="Label4" runat="server" Text="@ IP"></asp:Label>
                                                                &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="IPAgence" runat="server"></asp:TextBox>
                                        <br />
                                                                <asp:Button ID="SubmitIP" runat="server"
                                                                    Text="Recherche" onclick="SubmitIP_Click" />
                                                                <br />
            </eo:PageView>
                        <eo:PageView ID="Date" runat="server" Width="100%">
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                                    onselectionchanged="Calendar1_SelectionChanged" ShowGridLines="True" 
                                    Width="220px">
                                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="#CC9966" />
                                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                    <SelectorStyle BackColor="#FFCC66" />
                                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                                        ForeColor="#FFFFCC" />
                                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                </asp:Calendar>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                    Text="Recherche" />
            </eo:PageView>
                                    <eo:PageView ID="Framerelay" runat="server" Width="100%">
                                                                                                    <asp:Label ID="Label1" runat="server" Text="@ IP Framerelay"></asp:Label>
                                                                &nbsp;&nbsp; :&nbsp;&nbsp;
                                                                <asp:TextBox ID="IPFramerelay" runat="server"></asp:TextBox>
                                                                <br />
                                                                <asp:Button ID="Submitframerelay" runat="server" 
                                                                    onclick="Submitframerelay_Click" Text="Recherche" />
                                        <br />
            </eo:PageView>
                                    <eo:PageView ID="Carte" runat="server" Width="100%">
                                                                                                                <asp:Label ID="Label5" runat="server" Text="@ IP Carte"></asp:Label>
                                                                            &nbsp;&nbsp; :&nbsp;&nbsp;
                                                                            <asp:TextBox ID="IPAdslCarte" runat="server"></asp:TextBox>
                                        <br />
                                                                            <asp:Button ID="SubmitAdslCarte" runat="server" 
                                                                                 Text="Recherche" onclick="SubmitAdslCarte_Click" />
                                                                            <br />
            </eo:PageView>
                                    <eo:PageView ID="Tunnel" runat="server" Width="100%">
                                                                            <asp:Label ID="Label6" runat="server" Text="@ IP Tunnel"></asp:Label>
                                        &nbsp;&nbsp; :&nbsp;&nbsp;
                                        <asp:TextBox ID="IPAdslTunnel" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="SubmitAdslTunnel" runat="server" Text="Recherche" 
                                            onclick="SubmitAdslTunnel_Click" />
                                        <br />
            </eo:PageView>
        </eo:MultiPage>
    
    </div>
    </form>
</body>
</html>
