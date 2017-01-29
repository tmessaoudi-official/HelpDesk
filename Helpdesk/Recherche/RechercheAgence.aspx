<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechercheAgence.aspx.cs" Inherits="Helpdesk.RechercheAgence" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="Stylesheet" href="../Styles/main.css" />
    <style type="text/css">
        #form1
        {
            height: 131px;
            margin-bottom: 8px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server">
    </div>

    <eo:ComboBox ID="ComboBox4" runat="server" AutoPostBack="True" 
        ControlSkinID="None" DefaultIcon="00101070" Height="24px" HintText="Recherche Agence" Width="195px">
        <DropDownTemplate>
            <div style="width:200px;height:120px;font-family:Verdana; font-size:12px;border:solid 1px #909090;padding:4px;background-color:white;">
                    <eo:ListBox AutoPostBack="true" OnSelectedIndexChanged="SubmitChange" ID="Critere" runat="server" ControlSkinID="None" Height="100px" Width="200px">
        <HeaderTemplate>
        <asp:Label runat="server" ID="RechercheA" Text="Recherche Agence" ForeColor="White" BackColor="Black"></asp:Label>
        </HeaderTemplate>
        <HeaderStyle CssText="background-color:Black;"/>
        <ListBoxStyle CssText="font-family:Tahoma; font-size:11px;" />
        <BodyStyle CssText="border: solid 1px #c6c7d2;background-color:white;" />
        <ItemStyle CssText="padding: 2px; background-color:white; color: black;" />
        <DisabledItemStyle CssText="background-color:white; color: #c0c0c0; padding: 2px;" />
        <SelectedItemStyle CssText="padding: 2px; background-color:#3399ff; color:white;" />
        <MoreItemsMessageStyle CssText="padding:2px;" />
        <Items>
        <eo:ListBoxItem Text="Adresse" Value="Adresse" />
        <eo:ListBoxItem Text="Code" Value="Code" />
        <eo:ListBoxItem Text="Nom" Value="Nom" />
        <eo:ListBoxItem Text="IP" Value="IP" />
        <eo:ListBoxItem Text="Responsable" Value="Responsable" />
        <eo:ListBoxItem Enabled="false" />
        </Items>
    </eo:ListBox></div>
        </DropDownTemplate>
        <IconAreaStyle CssText="font-family: tahoma; font-size: 11px; background-image:url(00107007); background-position: left left; background-repeat:no-repeat; vertical-align:middle;padding-left:2px; padding-right:2px;" />
        <HintTextStyle CssText="font-style:italic;background-color:#c0c0c0;color:white;line-height:15px;" />
        <TextAreaStyle CssText="font-family: tahoma; font-size: 11px; border-top: solid 1px #3d7bad; border-bottom: solid 1px #b7d9ed; vertical-align:middle;padding-left:2px; padding-right:2px;" />
        <TextStyle CssText="font-family: tahoma; font-size: 11px;" />
        <IconStyle CssText="width:16px;height:16px;" />
        <ButtonAreaStyle CssText="background-image:url(00107005);" />
        <ButtonAreaHoverStyle CssText="background-image:url(00107006);" />
        <ButtonStyle CssText="width:17px;height:23px;" />
    </eo:ComboBox>

                  

                                
    <asp:Panel ID="Panel1" runat="server" Visible="False" Width="208px">
        <asp:Label ID="Label3" runat="server" Text=" Adresse : " Visible="true"></asp:Label>
        <asp:TextBox ID="Adress" runat="server" Visible="true"></asp:TextBox>
        <br />
        <asp:Button ID="SubmitAdresse" runat="server" Text="Recherche" 
                    onclick="SubmitAdresse_Click" Visible="true" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false" Width="208px">
     <asp:Label ID="Label8" Visible="true" runat="server" Text=" Code : "></asp:Label>
      <asp:TextBox Visible="true" ID="Code" runat="server"></asp:TextBox>
        <br />
      <asp:Button  Visible="true" ID="SubmitCode" runat="server" Text="Recherche" onclick="SubmitCode_Click" />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="False" Width="208px">
        <asp:Label Visible="true" ID="Label10" runat="server" Text=" Nom : "></asp:Label>
    <asp:TextBox Visible="true" ID="AgenceNom" runat="server"></asp:TextBox>
    <br />
    <asp:Button Visible="true" ID="SubmitNom" runat="server" onclick="SubmitNom_Click" 
        Text="Recherche" />
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server" Visible="False" Width="208px">
        <asp:Label Visible="true" ID="Label9" runat="server" Text=" @IP : "></asp:Label>
    <asp:TextBox Visible="true" ID="IP1" runat="server" AutoPostBack="true" MaxLength="3" 
        OnTextChanged="IP_TextChanged" Width="25"></asp:TextBox>
    -
    <asp:TextBox Visible="true" ID="IP2" runat="server" AutoPostBack="true" MaxLength="3" 
        OnTextChanged="IP_TextChanged" Width="25"></asp:TextBox>
    -
    <asp:TextBox Visible="true" ID="IP3" runat="server" AutoPostBack="true" MaxLength="3" 
        OnTextChanged="IP_TextChanged" Width="25"></asp:TextBox>
    -
    <asp:TextBox Visible="true" ID="IP4" runat="server" AutoPostBack="true" MaxLength="3" 
        OnTextChanged="IP_TextChanged" Width="25"></asp:TextBox>
    <br />
        <asp:TextBox ID="IP" runat="server" AutoPostBack="true" 
            OnTextChanged="IPf_TextChanged" Visible="False" Width="120px"></asp:TextBox>
    <asp:Button Visible="true" ID="ButtontIP" runat="server" onclick="ButtontIP_Click" 
        Text="Recherche" />

    </asp:Panel>
    <asp:Panel ID="Panel8" runat="server" Visible="False" Width="208px">
                    <eo:ComboBox AutoPostBack="true" OnTextChanged="SubmitChangeR" 
        ID="ComboBox2" runat="server" ControlSkinID="None"
        DefaultIcon="00101070" Height="20px" HintText="Type here" 
        LabelHtml="" Width="211px">
                <DropDownTemplate>
                    <div style="width:200px;height:120px;font-family:Verdana; font-size:12px;border:solid 1px #909090;padding:4px;background-color:white;">
        <eo:ListBox OnSelectedIndexChanged="SubmitChangeR" ID="CritereR" runat="server" 
        ControlSkinID="None" Height="100px" 
        Width="200px">
        <ListBoxStyle CssText="font-family:Tahoma; font-size:11px;" />
        <BodyStyle CssText="border: solid 1px #c6c7d2;background-color:white;" />
        <ItemStyle CssText="padding: 2px; background-color:white; color: black;" />
        <DisabledItemStyle CssText="background-color:white; color: #c0c0c0; padding: 2px;" />
        <SelectedItemStyle CssText="padding: 2px; background-color:#3399ff; color:white;" />
        <MoreItemsMessageStyle CssText="padding:2px;" />
        <Items>
        <eo:ListBoxItem Text="" Value="" />
        <eo:ListBoxItem Text="Nom" Value="Nom" />
        <eo:ListBoxItem Text="Email" Value="Email" />
        <eo:ListBoxItem Text="Telephone" Value="Telephone" />
        </Items>
    </eo:ListBox>
                        </div>
                </DropDownTemplate>
                <IconAreaStyle CssText="font-family: tahoma; font-size: 11px; background-image:url(00107007); background-position: left left; background-repeat:no-repeat; vertical-align:middle;padding-left:2px; padding-right:2px;" />
                <HintTextStyle CssText="font-style:italic;background-color:#c0c0c0;color:white;line-height:15px;" />
                <ExpandEffect Type="GlideTopToBottom" />
                <LabelStyle CssText="" />
                <TextAreaStyle CssText="font-family: tahoma; font-size: 11px; border-top: solid 1px #3d7bad; border-bottom: solid 1px #b7d9ed; vertical-align:middle;padding-left:2px; padding-right:2px;" />
                <TextStyle CssText="font-family: tahoma; font-size: 11px;" />
                <IconStyle CssText="width:16px;height:16px;" />
                <ButtonAreaStyle CssText="background-image:url(00107005);" />
                <ButtonAreaHoverStyle CssText="background-image:url(00107006);" />
                <ButtonStyle CssText="width:17px;height:23px;" />
                
    </eo:ComboBox>
    </asp:Panel>
    <asp:Panel ID="Panel5" runat="server" Visible="False" Width="208px">
        <asp:Label Visible="true" ID="Label4" runat="server" Text=" Nom : "></asp:Label>
    <asp:TextBox Visible="true" ID="Nom" runat="server"></asp:TextBox>
    <asp:Label Visible="true" ID="Label5" runat="server" Text=" Prenom : "></asp:Label>
    <asp:TextBox Visible="true" ID="Prenom" runat="server"></asp:TextBox>
    <asp:Button Visible="true" ID="SubmitResponsableNom" runat="server" 
        onclick="SubmitResponsableNom_Click" Text="Recherche" />
    
    </asp:Panel>
    <asp:Panel ID="Panel6" runat="server" Visible="False" Width="208px">
        <asp:Label Visible="true" ID="Label6" runat="server" Text=" E-mail : "></asp:Label>
    <asp:TextBox Visible="true" ID="Email" runat="server" Width="216px"></asp:TextBox>
    <asp:Button Visible="true" ID="Button1Email" runat="server" onclick="Button1Email_Click" 
        Text="Recherche" />
    </asp:Panel>
    <asp:Panel ID="Panel7" runat="server" Visible="False" Width="208px">
        <asp:Label Visible="true" ID="Label7" runat="server" Text=" Telephone : "></asp:Label>
    <asp:TextBox Visible="true" ID="Telephone" runat="server" Width="166px"></asp:TextBox>
    <asp:Button Visible="true" ID="SubmitResponsableTelephone" runat="server" 
        onclick="SubmitResponsableTelephone_Click" Text="Recherche" />
    </asp:Panel>
        <eo:ComboBox AutoPostBack="true" ID="ComboBox3" runat="server" ControlSkinID="None" 
            DefaultIcon="00101070" Height="24px" HintText="Recherche Historique" Width="195px">
            <DropDownTemplate>
                <div style="width:200px;height:120px;font-family:Verdana; font-size:12px;border:solid 1px #909090;padding:4px;background-color:white;">
                                                                <eo:ListBox AutoPostBack="true" OnSelectedIndexChanged="SubmitChangesH" ID="CritereH" runat="server" 
        ControlSkinID="None" Height="100px" 
        Width="200px">
        <HeaderTemplate>
        <asp:Label runat="server" ID="RechercheH" Text="Recherche Historique" ForeColor="White" BackColor="Black"></asp:Label>
        </HeaderTemplate>
        <HeaderStyle CssText="background-color:Black;"/>
        <ListBoxStyle CssText="font-family:Tahoma; font-size:11px;" />
        <BodyStyle CssText="border: solid 1px #c6c7d2;background-color:white;" />
        <ItemStyle CssText="padding: 2px; background-color:white; color: black;" />
        <DisabledItemStyle CssText="background-color:white; color: #c0c0c0; padding: 2px;" />
        <SelectedItemStyle CssText="padding: 2px; background-color:#3399ff; color:white;" />
        <MoreItemsMessageStyle CssText="padding:2px;" />
        <Items>
        <eo:ListBoxItem Text="Nom" Value="NomH" />
        <eo:ListBoxItem Text="Code" Value="CodeH" />
        <eo:ListBoxItem Text="@ IP" Value="IPH" />
        <eo:ListBoxItem Text="Date" Value="Date" />
        <eo:ListBoxItem Text="Framerelay" Value="FR" />
        <eo:ListBoxItem Text="Adsl Carte" Value="AdslC" />
        <eo:ListBoxItem Text="Adsl Tunnel" Value="AdslT" />
        
        </Items>
    </eo:ListBox></div>
            </DropDownTemplate>
            <IconAreaStyle CssText="font-family: tahoma; font-size: 11px; background-image:url(00107007); background-position: left left; background-repeat:no-repeat; vertical-align:middle;padding-left:2px; padding-right:2px;" />
            <HintTextStyle CssText="font-style:italic;background-color:#c0c0c0;color:white;line-height:15px;" />
            <TextAreaStyle CssText="font-family: tahoma; font-size: 11px; border-top: solid 1px #3d7bad; border-bottom: solid 1px #b7d9ed; vertical-align:middle;padding-left:2px; padding-right:2px;" />
            <TextStyle CssText="font-family: tahoma; font-size: 11px;" />
            <IconStyle CssText="width:16px;height:16px;" />
            <ButtonAreaStyle CssText="background-image:url(00107005);" />
            <ButtonAreaHoverStyle CssText="background-image:url(00107006);" />
            <ButtonStyle CssText="width:17px;height:23px;" />
        </eo:ComboBox>
    <asp:Panel ID="Panel9" runat="server" Visible="False" Width="208px">
                                                                                    <asp:Label ID="Label2" runat="server" Text="Nom Agence"></asp:Label>
                                                                &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="NomAgence" runat="server" Width="128px"></asp:TextBox>
                                                                <br />
                                                                <asp:Button ID="RechercheHNom" runat="server" Text="Recherche" onclick="RechercheHNom_Click"/>
                                        <br />
    </asp:Panel>
        <asp:Panel ID="Panel10" runat="server" Visible="False" Width="208px">
                                                                                                <asp:Label ID="Label1" runat="server" Text="Code Agence"></asp:Label>
                                                                &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="CodeAgence" runat="server"></asp:TextBox>
                                        <br />
                                                                <asp:Button ID="RechercheHCode" runat="server" Text="Recherche" onclick="RechercheHCode_Click"/>
                                                                <br />
    </asp:Panel>
        <asp:Panel ID="Panel11" runat="server" Visible="False" Width="208px">
                                                                                                <asp:Label ID="Label11" runat="server" Text="@ IP"></asp:Label>
                                                                                                &nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;
                                                                                                <br />
                                                                <asp:TextBox ID="IPA1" runat="server" AutoPostBack="true" MaxLength="3" OnTextChanged="IPAG_TextChanged" 
                                                                                                    Visible="true" Width="25"></asp:TextBox>
                                                                                                -
                                                                                                <asp:TextBox ID="IPA2" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                                    OnTextChanged="IPAG_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                -
                                                                                                <asp:TextBox ID="IPA3" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                                    OnTextChanged="IPAG_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                -
                                                                                                <asp:TextBox ID="IPA4" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                                    OnTextChanged="IPAG_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                            <asp:TextBox ID="IPA" runat="server" AutoPostBack="true" 
            OnTextChanged="IPA_TextChanged" Visible="False" Width="120px"></asp:TextBox>
                                        <br />
                                                                                                <asp:Button ID="SubmitIP" runat="server" onclick="SubmitIP_Click" 
                                                                                                    Text="Recherche" />
                                                                                                <br />
    </asp:Panel>
        <asp:Panel ID="Panel12" runat="server" Visible="False" Width="208px">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                                            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                                            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="154px" 
                                             ShowGridLines="True" 
                                            Width="210px">
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                                                ForeColor="#FFFFCC" />
                                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                        </asp:Calendar>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="RechercheHDate" runat="server" Text="Recherche" 
                                            onclick="RechercheHDate_Click" />
    </asp:Panel>
            <asp:Panel ID="Panel13" runat="server" Visible="False" Width="208px">
                                                                                                            <asp:Label ID="Label12" runat="server" Text="@ IP Framerelay"></asp:Label>
                                                                &nbsp;&nbsp; :&nbsp;&nbsp;<br /> &nbsp;<asp:TextBox ID="IPF1" runat="server" AutoPostBack="true" MaxLength="3" 
    OnTextChanged="IPFL_TextChanged" 
                                                                                                    
    Visible="true" Width="25"></asp:TextBox>
                                                                                                            -<asp:TextBox ID="IPF2" runat="server" AutoPostBack="true" 
    MaxLength="3" 
                                                                                                    
    OnTextChanged="IPFL_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                            -<asp:TextBox ID="IPF3" runat="server" AutoPostBack="true" 
    MaxLength="3" 
                                                                                                    
    OnTextChanged="IPFL_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                            -<asp:TextBox ID="IPF4" runat="server" AutoPostBack="true" 
    MaxLength="3" 
                                                                                                    
    OnTextChanged="IPFL_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                            <asp:TextBox ID="IPF" runat="server" AutoPostBack="true" 
            OnTextChanged="IPFR_TextChanged" Visible="False" Width="120px"></asp:TextBox>
                                        
                                                                <asp:Button ID="Submitframerelay" runat="server" 
                                                                    onclick="Submitframerelay_Click" Text="Recherche" />
                                        <br />
    </asp:Panel>
            <asp:Panel ID="Panel14" runat="server" Visible="False" Width="208px">
                                                                                                                        <asp:Label ID="Label13" runat="server" Text="@ IP Carte"></asp:Label>
                                                                            &nbsp;&nbsp; :&nbsp;&nbsp;<br />
                                                                            <asp:TextBox ID="IPAD1" runat="server" AutoPostBack="true" MaxLength="3" OnTextChanged="IPAC_TextChanged" Visible="true" 
                                                                                                                            Width="25"></asp:TextBox>
                                                                                                                        <asp:TextBox ID="IPAD2" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                                                            OnTextChanged="IPAC_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                                        <asp:TextBox ID="IPAD3" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                                                            OnTextChanged="IPAC_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                                        <asp:TextBox ID="IPAD4" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                                                            OnTextChanged="IPAC_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                                                        <asp:TextBox ID="IPAD" runat="server" AutoPostBack="true" 
                                                                                                                            OnTextChanged="IPADC_TextChanged" Visible="False" Width="120px"></asp:TextBox>
                                        <br />
                                                                            <asp:Button ID="SubmitAdslCarte" runat="server" 
                                                                                 Text="Recherche" onclick="SubmitAdslCarte_Click" />
                                                                            <br />
    </asp:Panel>
            <asp:Panel ID="Panel15" runat="server" Visible="False" Width="208px">
                                                                                    <asp:Label ID="Label14" runat="server" Text="@ IP Tunnel"></asp:Label>
                                        &nbsp;&nbsp; :&nbsp;&nbsp;
                                                                                    <br />
                                        <asp:TextBox ID="IPAT1" runat="server" AutoPostBack="true" MaxLength="3" OnTextChanged="IPAT_TextChanged" Visible="true" 
                                                                                        Width="25"></asp:TextBox>
                                                                                    <asp:TextBox ID="IPAT2" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                        OnTextChanged="IPAT_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                    <asp:TextBox ID="IPAT3" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                        OnTextChanged="IPAT_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                    <asp:TextBox ID="IPAT4" runat="server" AutoPostBack="true" MaxLength="3" 
                                                                                        OnTextChanged="IPAT_TextChanged" Visible="true" Width="25"></asp:TextBox>
                                                                                    <asp:TextBox ID="IPAT" runat="server" AutoPostBack="true" 
                                                                                        OnTextChanged="IPADT_TextChanged" Visible="False" Width="120px"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="SubmitAdslTunnel" runat="server" Text="Recherche" 
                                            onclick="SubmitAdslTunnel_Click" />
                                        <br />
    </asp:Panel>
    </form>
</body>
</html>