<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Historiques.aspx.cs" Inherits="Helpdesk.Historiques" %>

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
    
       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="13"
            AutoGenerateColumns="False" 
            DataSourceID="Zone" OnPageIndexChanging="GridView1_IndexChanging"
            onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" GridLines="None" HorizontalAlign="Center" >
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                                    <asp:CommandField ShowSelectButton="True" SelectText="Afficher" />
                <asp:BoundField DataField="Zone_ID" Visible="false" HeaderText="Zone_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Zone_ID" />
                <asp:BoundField DataField="Zone" HeaderText="Zone" 
                    SortExpression="Zone" />
                                        <asp:TemplateField>
                    <ItemTemplate>
             <asp:HiddenField runat="server" ID="HiddenField1" Value='<%#Eval("Zone_ID")%>'></asp:HiddenField>
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
        <asp:SqlDataSource ID="Zone" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Agences.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT Zone_ID, Zone_Libelle AS Zone FROM Zone">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
