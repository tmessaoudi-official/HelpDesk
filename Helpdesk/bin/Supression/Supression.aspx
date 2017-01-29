<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supression.aspx.cs" Inherits="Helpdesk.Supression" %>

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
    <div>
    
            
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="13"
            OnPageIndexChanging="GridView1_IndexChanging" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Supprimer" />
                                    <asp:BoundField DataField="Agence_Code" HeaderText="Agence_Code" 
                    SortExpression="Agence_Code" Visible="false" />
                                    <asp:BoundField DataField="Agence_ID" HeaderText="Agence_ID" 
                    SortExpression="Agence_ID" Visible="false" />
                <asp:BoundField DataField="Agence_Nom" 
                    HeaderText="Nom Agence" SortExpression="Agence_Nom" />
                                   <asp:BoundField DataField="Agence_Adresse_IP" 
                    HeaderText="@ IP" SortExpression="Agence_Adresse_IP" />

                                   <asp:TemplateField>
                    <ItemTemplate>
             <asp:HiddenField runat="server" ID="HiddenField1" Value='<%#Eval("Agence_ID")%>'></asp:HiddenField>
             </ItemTemplate>
                        <ItemStyle BackColor="#99CC00" />
             </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Agences.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            
            
            SelectCommand="SELECT Agences.Agence_Nom, Agences.Agence_Adresse_IP, Agences.Agence_ID, Agences.Agence_Code FROM Agences INNER JOIN Zone ON Agences.Agence_Zone = Zone.Zone_ID WHERE (Agences.Agence_Zone = @Zone)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="Zone" 
                    QueryStringField="Zone" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
