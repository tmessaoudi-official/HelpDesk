<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneHistoriques.aspx.cs" Inherits="Helpdesk.ZoneHistoriques" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
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
            <p><font size="+3" Color="teal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Consulter L'historique</font></p>
    <div>
       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="10"
            AutoGenerateColumns="False" 
            DataSourceID="Zone" OnPageIndexChanging="GridView1_IndexChanging" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" GridLines="None" HorizontalAlign="Center" Font-Names="Andalus" Font-Size="13pt">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Zone" HeaderText="Zone" 
                    SortExpression="Zone" />
<asp:TemplateField>
             <ItemTemplate>
             <a href="AgenceHistorique.aspx?Zone=<%#Eval("ID")%>"><asp:Image ImageUrl="~/images/Affiche.gif" runat="server" ID="Afficher" ToolTip="Afficher" Height="25px" Width="30px"></asp:Image></a>
             </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField>
             <ItemTemplate>
             <a><asp:Image ImageUrl="~/images/Modif.png" runat="server" ID="Modifier" ToolTip="Modifier" Height="25px" Width="30px"></asp:Image></a>
             <ajaxToolkit:BalloonPopupExtender ID="PopupControlExtender2" runat="server"
        TargetControlID="Modifier"
        BalloonPopupControlID="DivEditWindow"
        Position="BottomRight" 
        BalloonStyle="Rectangle"
        BalloonSize="Medium"
        CustomClassName="oval"
        UseShadow="true" 
        ScrollBars="None"
        DisplayOnMouseOver="true"
        DisplayOnFocus="false"
        DisplayOnClick="true" />
      <asp:Panel ID="DivEditWindow" CssClass="popupConfirmation" runat="server" >
<iframe style="width: 240px; height: 280px;" id="IframeEdit" src="../Affichage/Zone.aspx?Page=Affiche&Mode=editzone&IDZone=<%#Eval("ID")%>" frameborder="0" scrolling="no"></iframe>
</asp:Panel>
             </ItemTemplate>
             </asp:TemplateField>

                          <asp:TemplateField>
             <ItemTemplate>
             <a><asp:Image ImageUrl="~/images/close-button.png" runat="server" ID="Supprimer" ToolTip="Supprimer" Height="25px" Width="30px"></asp:Image></a>
             <ajaxToolkit:BalloonPopupExtender ID="PopupControlExtender3" runat="server"
        TargetControlID="Supprimer"
        BalloonPopupControlID="DivEditWindow1"
        Position="BottomRight" 
        BalloonStyle="Rectangle"
        BalloonSize="Medium"
        UseShadow="true" 
        ScrollBars="None"
        DisplayOnFocus="false"
        DisplayOnClick="true"/>
      <asp:Panel ID="DivEditWindow1" CssClass="popupConfirmation" runat="server" >
<iframe scrolling="no" id="IframeEdit2" src="../Affichage/Zone.aspx?Page=Affiche&Mode=deletezone&IDZone=<%#Eval("ID")%>" frameborder="0"></iframe>
</asp:Panel>
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
        <div style="position:absolute; top: 72px; left: 510px;">
             <a><asp:Image ImageUrl="~/images/Add.png" runat="server" ID="New" ToolTip="Ajouter" Height="25px" Width="30px"></asp:Image></a>
             <ajaxToolkit:BalloonPopupExtender ID="PopupControlExtender4" runat="server"
        TargetControlID="New"
        BalloonPopupControlID="DivEditWindow2"
        Position="BottomRight" 
        BalloonStyle="Rectangle"
        BalloonSize="Medium"
        UseShadow="true" 
        ScrollBars="None"
        DisplayOnFocus="false"
        DisplayOnClick="true"/>
      <asp:Panel ID="DivEditWindow2" CssClass="popupConfirmation" runat="server" >
<iframe scrolling="no" id="IframeEdit3" src="../Affichage/Zone.aspx?Page=Affiche&Mode=newzone" frameborder="0"></iframe>
</asp:Panel>
</div>
        <asp:SqlDataSource OnSelected="CheckSqlSelected" 
            onselecting="CheckSqlSelecting"  ID="Zone" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
            SelectCommand="SELECT ID, Libelle AS Zone FROM Zones">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
