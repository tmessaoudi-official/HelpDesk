<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultRecherche.aspx.cs" Inherits="Helpdesk.Recherche.ResultRecherche" %>
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
    <p align="center"><font size="+3" Color="teal">&nbsp;&nbsp; Recherche Dans L'Historiques</font></p>
    <div>
    <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" PageSize="5" EmptyDataText="Aucun Historique dans ce date"
            OnPageIndexChanging="GridView1_IndexChanging" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" HorizontalAlign="Center" 
            DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="#CCCCCC" />

            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" Visible="false" />
                <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                <asp:BoundField DataField="Adresse_IP" HeaderText="Adresse IP" 
                    SortExpression="Adresse_IP" />
                    <asp:TemplateField>
                    <ItemTemplate>
                    <a href="AfficheHistoriqueDate.aspx?Date=<%# Request.QueryString["Date"] %>&IDAgence=<%#Eval("ID")%>"><asp:Image ImageUrl="~/images/Historique.png" runat="server" ID="Afficher" ToolTip="Consulter L'historique" Height="25px" Width="30px"></asp:Image></a>
                    </ItemTemplate>
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
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            
            
            
            SelectCommand="SELECT DISTINCT Agences.ID, Agences.Nom, Agences.Adresse_IP FROM Agences LEFT OUTER JOIN Historiques_Switcheurs ON Agences.ID = Historiques_Switcheurs.Agence_ID LEFT OUTER JOIN Historiques_Routeurs ON Agences.ID = Historiques_Routeurs.Agence_ID LEFT OUTER JOIN Historiques_Modems ON Agences.ID = Historiques_Modems.Agence_ID LEFT OUTER JOIN Historiques_Framerelays ON Agences.ID = Historiques_Framerelays.Agence_ID LEFT OUTER JOIN Responsabilité ON Agences.ID = Responsabilité.Agence_ID LEFT OUTER JOIN Historiques_Agences ON Agences.ID = Historiques_Agences.Agence_ID LEFT OUTER JOIN Historiques_Adsls ON Agences.ID = Historiques_Adsls.Agence_ID WHERE (Historiques_Adsls.Date = @Date) OR (Historiques_Agences.Date = @Date) OR (Responsabilité.DateFin = @Date) OR (Historiques_Framerelays.Date = @Date) OR (Historiques_Modems.Date = @Date) OR (Historiques_Routeurs.Date = @Date) OR (Historiques_Switcheurs.Date = @Date)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Date" QueryStringField="Date" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
