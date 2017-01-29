<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AfficheAgence.aspx.cs" Inherits="Helpdesk.AfficheAgence" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="Styles/main.css" />
    <link rel="Stylesheet" href="Styles/BodyFrame.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server"></div>
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Caption="Détaille Agence" 
            HorizontalAlign="Center" BackColor="#FFFFCC" BorderColor="Maroon" 
            ShowFooter="True">
            <AlternatingRowStyle BackColor="#FF9900" BorderColor="Black" BorderStyle="None" 
                Font-Bold="False" ForeColor="Black" HorizontalAlign="Left" />
            <Columns>
                <asp:BoundField DataField="Adress" HeaderText="Adress" 
                    SortExpression="Adress" ReadOnly="True" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="Responsable" 
                    HeaderText="Responsable" SortExpression="Responsable" ReadOnly="True" />
            </Columns>
            <FooterStyle BackColor="Black" />
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" Caption="Equipement" 
            HorizontalAlign="Center" BackColor="#FFFFCC" BorderColor="Maroon" 
            ShowFooter="True">
                       <AlternatingRowStyle BackColor="#FF9900" BorderColor="Black" BorderStyle="None" 
                Font-Bold="False" ForeColor="Black" HorizontalAlign="Left" />
            <Columns>
                <asp:BoundField DataField="Modem" HeaderText="Modem" ReadOnly="True" 
                    SortExpression="Modem" />
                <asp:BoundField DataField="Routeur" HeaderText="Routeur" ReadOnly="True" 
                    SortExpression="Routeur" />
                <asp:BoundField DataField="Switcheur" HeaderText="Switcheur" ReadOnly="True" 
                    SortExpression="Switcheur" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
            </Columns>
            <FooterStyle BackColor="Black" />
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            Caption="Liaison" DataSourceID="SqlDataSource3" HorizontalAlign="Center" BackColor="#FFFFCC" BorderColor="Maroon" 
            ShowFooter="True">
                       <AlternatingRowStyle BackColor="#FF9900" BorderColor="Black" BorderStyle="None" 
                Font-Bold="False" ForeColor="Black" HorizontalAlign="Left" />
            <Columns>
                <asp:BoundField DataField="FrameRelay" HeaderText="FrameRelay" ReadOnly="True" 
                    SortExpression="FrameRelay" />
                <asp:BoundField DataField="Adsl" HeaderText="Adsl" ReadOnly="True" 
                    SortExpression="Adsl" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
            </Columns>
        </asp:GridView>
        <FooterStyle BackColor="Black" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Agences.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT 'Statut : ' + Framerelay.Framerelay_Statut + ', Identificateur : ' + Framerelay.Framerelay_Identificateur + ', Description : ' + Framerelay.Framerelay_Description AS FrameRelay, 'Statut : ' + Adsl.Adsl_Statut + ', Identificateur : ' + Adsl.Adsl_Identificateur + ', Description : ' + Adsl.Adsl_Description AS Adsl, Liaisons.Liaison_Description AS Description FROM Adsl INNER JOIN Liaisons ON Adsl.Adsl_ID = Liaisons.Liaison_Adsl INNER JOIN Framerelay ON Liaisons.Liaison_Framerelay = Framerelay.Framerelay_ID WHERE (Liaisons.Liaison_ID = @Liaison_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Liaison" DefaultValue="1" Name="Liaison_ID" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Agences.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            
            
            SelectCommand="SELECT +'Statut : ' + Modems.Modem_Statut + ',Type : ' + Modems.Modem_Type+',@IP : ' +Modems.Modem_IPadress +',@Mac : ' + Modems.Modem_Macadress +',Description : ' +Modems.Modem_Description AS Modem, 'Statut : ' + Routeurs.Routeur_Statut + ',Type : ' + Routeurs.Routeur_Type + ',@IP : ' + Routeurs.Routeur_IPadress + ',@Mac : ' + Routeurs.Routeur_Macadress + ',Description : ' + Routeurs.Routeur_Description AS Routeur, 'Statut : ' + Switcheurs.Switcheur_Statut + ',Type : ' + Switcheurs.Switcheur_Type + ',@IP : ' + Switcheurs.Switcheur_IPadress + ',@Mac : ' + Switcheurs.Switcheur_Macadress + ',Description : ' + Switcheurs.Switcheur_Description AS Switcheur, Equipements.Equipement_Description AS Description FROM Equipements INNER JOIN Modems ON Equipements.Equipement_Modem = Modems.Modem_ID INNER JOIN Routeurs ON Equipements.Equipement_Routeur = Routeurs.Routeur_ID INNER JOIN Switcheurs ON Equipements.Equipement_Switcheur = Switcheurs.Switcheur_ID WHERE (Equipements.Equipement_ID = @Equipement_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Equipement" DefaultValue="1" 
                    Name="Equipement_ID" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Agences.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT Emplacement.Emplacement_Libelle + ', ' + Agences.Agence_Zone + ', ' + Agences.Adress AS Adress, Agences.Agence_Descriptions AS Description, 'Nom : ' + Respnosable_Agence.Nom + ', Prenom : ' + Respnosable_Agence.Prenom + ', Email : ' + Respnosable_Agence.Email + ', Téléphone : ' + Respnosable_Agence.Teléphone AS Responsable FROM Agences INNER JOIN Emplacement ON Agences.Agence_Emplacement = Emplacement.Emplacement_ID INNER JOIN Respnosable_Agence ON Agences.Agence_Coordonnee_Responsable = Respnosable_Agence.ID WHERE (Agences.Agence_ID = @Agence_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="IDagence" Name="Agence_ID" 
                    PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="IDagence" runat="server" />
        <asp:HiddenField ID="Equipement" runat="server" />
        <asp:HiddenField ID="Liaison" runat="server" />
        <br />
    
    </div>
    </form>
</body>
</html>
