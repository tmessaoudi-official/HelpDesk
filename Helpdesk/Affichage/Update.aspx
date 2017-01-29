<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Helpdesk.Update" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../Styles/main.css" />
<link rel="Stylesheet" href="../Styles/Update.css" />
<link rel="Stylesheet" href="../Styles/Wizard.css" />
<link rel="Stylesheet" href="../Styles/Default.css" />
    <style type="text/css">
        .button{
clear:both;
background:#666666 url(img/button.png) no-repeat;
text-align:center;
line-height:31px;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
            margin-top: 0px;
        }
            .AjoutWizard
            {
    position:absolute;
    top: 78px;
    left: 211px;
    height: 249px;
    width: 57%;
}
        #IframeEdit
        {
            width: 307px;
        }
                .style1
        {
            width: 190px;
        }
        .style2
        {
            width: 106px;
        }
        .style3
        {
            width: 220px;
        }
        .style4
        {
            width: 60px;
        }
    </style>
        <script language="javascript" type="text/javascript">
            function EditCancelScript() {
                var frame = $get('IframeEdit');
                frame.src = "../DemoLoading.aspx";
            }
            function EditOkayScript() {
                EditCancelScript();
                window.location.reload(true);
            }
                   function TaskEdit() {
        $find('EditModalPopup').show();
        var frame = $get('IframeEdit');
        frame.src = "Zone.aspx?Page=Update&Mode=editzone&IDZone=<%=DropDownListAgenceZone.SelectedValue.ToString()%>";
        }
        function TaskDelete() {
        $find('EditModalPopup').show();
        var frame = $get('IframeEdit');
        frame.src = "Zone.aspx?Page=Update&Mode=deletezone&IDZone=<%=DropDownListAgenceZone.SelectedValue.ToString()%>";
        }
            function TaskNew() {
                $find('EditModalPopup').show();
                var frame = $get('IframeEdit');
                frame.src = "Zone.aspx?Page=Update&Mode=newzone";
            }
            function TaskNewResp() {
                $find('EditModalPopup').show();
                var frame = $get('IframeEdit');
                frame.src = "Zone.aspx?Page=Update&Mode=newresponsable";
            }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="msgboxpanel" runat="server">
    </div>        <div style=" position:absolute; width: 247px; margin-top: -8; margin-left: -8; height: 281px; top: 0px; left: 4px; right: 783px;">
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
                    <asp:Label ID="Label19" runat="server" ForeColor="White" Text="(More)"></asp:Label>
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
    <p align="center">

        <font size="+3" Color="teal">Modifier Les détailles d'une agence</font></p>
    <div style="position:absolute; left: 228px; top: 125px; width: 530px; height: 319px;">
    
            
                <asp:Wizard ID="wzd" runat="Server" DisplaySideBar="false" 
                    onfinishbuttonclick="wzd_FinishButtonClick" ActiveStepIndex="0" 
                    BackColor="GhostWhite" Height="243px" Width="530px">
    <HeaderTemplate>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td class="wizardTitle">
                    <%= wzd.ActiveStep.Title%>
                    <br />
                                     <asp:Button ToolTip="Initialiser les détailles" ID="Initialiser" runat="server" CssClass="button" Height="28px" 
                                    OnClick="Initialiser_Click" Text="Initialiser les détailles" Width="136px" />

                </td>
                <td>
                    <table style="width: 100%; border-collapse: collapse;">
                        <tr>
                            <td style="text-align: right">
                                <span class="wizardProgress">Steps:</span>
                            </td>
                            <asp:Repeater ID="SideBarList" runat="server">
                                <ItemTemplate>
                                
                                    <td class="stepBreak">&nbsp;</td>
                                    
                                    <td class="<%#GetClassForWizardStep(Container.DataItem) %>" title="<%# DataBinder.Eval(Container, "DataItem.Name")%>">
                                    <asp:LinkButton runat="server" ID="text" Text="<%#wzd.WizardSteps.IndexOf(Container.DataItem as WizardStep)+1%>" onclick="Unnamed1_Click"></asp:LinkButton>
                                    

                                    </td>
                                    
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </HeaderTemplate>
    <SideBarTemplate>
    </SideBarTemplate>
                    <WizardSteps>
                                            <asp:WizardStep runat="server" ID="ResponsableAgence" Title="Responsable De L'agence">
                                                <table id="Resposs" style="position:absolute; top: 85px; left: 16px;">
                        <tr><td>
                            <eo:ComboBox AutoPostBack="true" ID="ComboBox1" runat="server" ControlSkinID="None" 
                                DefaultIcon="00101070" HintText="Type here" Height="18px" Width="327px" 
                                OnTextChanged="ComboBox1_TextChanged">
                                <DropDownTemplate>
                                <div style="width:770px;height:400px;font-family:Verdana; font-size:12px;padding:4px; top: 130px; left: -98px;">
                                                               <a ID="NewR" runat="server" href="#" onclick="TaskNewResp();">
                            <asp:Image ID="AddResp" runat="server" Height="25px" ImageUrl="~/images/Add.png" 
                                ToolTip="Add Responsable" Width="30px" />
                            </a>
                                                                  <table id="listes">
                            <tr>
                            <td>
                                <eo:ListBox AutoPostBack="true" ID="Actuel" runat="server" ControlSkinID="None" 
                                            DataSourceID="ActualResponsable" DataTextField="Detaille" OnSelectedIndexChanged="Actuel_SelectedIndexChanged" 
                                DataValueField="ID" Height="200px" 
                                            Width="224px">
                                            <ListBoxStyle CssText="font-family: Tahoma; font-size:12px;background-color:white;" />
                                            <HeaderStyle CssText="background-image:url('00106001');background-position-x:left;background-position-y:top;background-repeat:repeat;height:16px;padding-bottom:2px;padding-left:7px;padding-right:2px;padding-top:6px;height:19px;margin-bottom:3px;" />
                                            <ItemListStyle CssText="padding: 4px;" />
                                            <BodyStyle CssText="border: solid 1px #dedede;" />
                                            <FooterStyle CssText="background-image:url('00106002'); background-position: left top; background-repeat: repeat; height:16px;padding-bottom:2px;padding-left:7px;padding-right:2px;padding-top:2px; margin-top:3px; height: 18px;" />
                                            <HeaderTemplate>
                                                Responsable Actuel
                                            </HeaderTemplate>
                                            <Items>
                                            </Items>
                                            <ItemTemplate>

<table id="Actualbuttons">
                                        <tr>
                                        <td class="style1">
                                                                                        <font Color="black"><%#Container.Item.Text %></font>
                                                <br />
                                                
                                        </td>
                                        <td class="style2">
                                                                   <a id="EditActual" runat="server" href="#">
                            <asp:Image ID="ModiferActual" runat="server" Height="25px"
                                ImageUrl="~/images/Modif.png" ToolTip="Edit Responsable" Width="30px" />
</a>
                             <asp:Panel ID="DivEditWindowActual" height="247px" 
                                runat="server" Width="308px" >
                          <iframe scrolling="no" id="IframeEditActual" src="Zone.aspx?Page=Update&Mode=editresponsable&IDResponsable=<%#Container.Item.Value%>" height="240" frameborder="0"></iframe>
                          
                          </asp:Panel>

                          <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender1" 
                                runat="server" DynamicServicePath="" Enabled="true"
                                TargetControlID="ModiferActual" PopupControlID="DivEditWindowActual" HoverDelay="3000" 
                                PopupPosition="Bottom">
                            </ajaxToolkit:HoverMenuExtender>
                                        </td>
                                        </tr>
                                        </table>

                                            </ItemTemplate>
                                            <ItemStyle CssText="border-bottom: solid 1px #dedede; padding-left: 2px; padding-right:2px; padding-top:4px; padding-bottom: 3px; background-color:white;" />
                                            <DisabledItemStyle CssText="border-bottom: solid 1px #dedede; color: #c0c0c0; padding: 2px; padding-left:2px; padding-top:4px;padding-right:2px;padding-bottom:4px;" />
                                            <SelectedItemStyle CssText="background-color:#ccff99;color:white;padding-bottom:4px;padding-left:2px;padding-right:2px;padding-top:4px;" />
                                            <ItemHoverStyle CssText="border-bottom: solid 1px #dedede; padding-left: 2px; padding-right:2px; padding-top:4px; padding-bottom: 3px; background-color:#f3f7fc;" />
                                            <MoreItemsMessageStyle CssText="padding:2px;" />
                                        </eo:ListBox>
                                         <asp:SqlDataSource ID="ActualResponsable" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
                                            SelectCommand="SELECT ID, Nom + ' ' + Prenom AS Detaille FROM Responsables WHERE (Niveau = 3) AND (Role = 2) AND (Responsables.ID = @IDR)">
                                            <SelectParameters>
                                                  <asp:ControlParameter ControlID="ResponsableA" Name="IDR" 
                                                 PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>  
 </td>
 <td>
 <eo:ListBox AutoPostBack="true" ID="Assigned" runat="server" ControlSkinID="None" 
                                            DataSourceID="AssignedResponsable" DataTextField="Detaille" OnSelectedIndexChanged="Assigned_SelectedIndexChanged" 
                                DataValueField="ID" Height="200px" 
                                            Width="224px">
                                            <ListBoxStyle CssText="font-family: Tahoma; font-size:12px;background-color:white;" />
                                            <HeaderStyle CssText="background-image:url('00106001');background-position-x:left;background-position-y:top;background-repeat:repeat;height:16px;padding-bottom:2px;padding-left:7px;padding-right:2px;padding-top:6px;height:19px;margin-bottom:3px;" />
                                            <ItemListStyle CssText="padding: 4px;" />
                                            <BodyStyle CssText="border: solid 1px #dedede;" />
                                            <FooterStyle CssText="background-image:url('00106002'); background-position: left top; background-repeat: repeat; height:16px;padding-bottom:2px;padding-left:7px;padding-right:2px;padding-top:2px; margin-top:3px; height: 18px;" />
                                            <HeaderTemplate>
                                              Responsables Assigné
                                            </HeaderTemplate>
                                            <Items>
                                            </Items>
                                            <ItemTemplate>

<table id="Assignedbuttons">
                                        <tr>
                                        <td class="style3">
                                                                                        <font Color="black"><%#Container.Item.Text %></font>
                                                <br />
                                                <font Color="#356c98">Mission : </font><font Color="maroon">
                                                <%# Mission(Int32.Parse(Container.Item.Value)) %></font>
                                        </td>
                                        <td class="style4">
                                                                   <a id="EditAssigned" runat="server" href="#">
                            <asp:Image ID="ModiferAssigned" runat="server" Height="25px"
                                ImageUrl="~/images/Modif.png" ToolTip="Edit Responsable" Width="30px" />
</a>
                             <asp:Panel ID="DivEditWindowAssigned" height="247px" 
                                runat="server" Width="308px" >
                          <iframe scrolling="no" id="IframeEditAssigned" src="Zone.aspx?Page=Update&Mode=editresponsable&IDResponsable=<%#Container.Item.Value%>" height="240" frameborder="0"></iframe>
                          
                          </asp:Panel>

                          <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender2" 
                                runat="server" DynamicServicePath="" Enabled="true"
                                TargetControlID="ModiferAssigned" PopupControlID="DivEditWindowAssigned" HoverDelay="3000" 
                                PopupPosition="Bottom">
                            </ajaxToolkit:HoverMenuExtender>

                           
                                        </td>
                                        </tr>
                                        </table>

                                            </ItemTemplate>
                                            <ItemStyle CssText="border-bottom: solid 1px #dedede; padding-left: 2px; padding-right:2px; padding-top:4px; padding-bottom: 3px; background-color:white;" />
                                            <DisabledItemStyle CssText="border-bottom: solid 1px #dedede; color: #c0c0c0; padding: 2px; padding-left:2px; padding-top:4px;padding-right:2px;padding-bottom:4px;" />
                                            <SelectedItemStyle CssText="background-color:#ccff99;color:white;padding-bottom:4px;padding-left:2px;padding-right:2px;padding-top:4px;" />
                                            <ItemHoverStyle CssText="border-bottom: solid 1px #dedede; padding-left: 2px; padding-right:2px; padding-top:4px; padding-bottom: 3px; background-color:#f3f7fc;" />
                                            <MoreItemsMessageStyle CssText="padding:2px;" />
                                        </eo:ListBox>
                                          <asp:SqlDataSource ID="AssignedResponsable" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
                                            
         
         SelectCommand="SELECT ID, Nom + ' ' + Prenom AS Detaille FROM Responsables WHERE (Niveau = 3) AND (Role = 2) AND (ID IN (SELECT Responsable FROM Agences WHERE Responsable <> @IDR))">
       <SelectParameters>
      <asp:ControlParameter ControlID="ResponsableA" Name="IDR" 
                                                           PropertyName="Value" />
                                                                                                                                                                   </SelectParameters>
                                        </asp:SqlDataSource>
 </td>
 <td>
    <eo:ListBox AutoPostBack="true" ID="Autres" runat="server" ControlSkinID="None" 
                                            DataSourceID="AutreResponsable" DataTextField="Detaille" OnSelectedIndexChanged="Autres_SelectedIndexChanged" 
                                DataValueField="ID" Height="200px" 
                                            Width="224px">
                                            <ListBoxStyle CssText="font-family: Tahoma; font-size:12px;background-color:white;" />
                                            <HeaderStyle CssText="background-image:url('00106001');background-position-x:left;background-position-y:top;background-repeat:repeat;height:16px;padding-bottom:2px;padding-left:7px;padding-right:2px;padding-top:6px;height:19px;margin-bottom:3px;" />
                                            <ItemListStyle CssText="padding: 4px;" />
                                            <BodyStyle CssText="border: solid 1px #dedede;" />
                                            <FooterStyle CssText="background-image:url('00106002'); background-position: left top; background-repeat: repeat; height:16px;padding-bottom:2px;padding-left:7px;padding-right:2px;padding-top:2px; margin-top:3px; height: 18px;" />
                                            <HeaderTemplate>
                                            Responsables En Attente
                                            </HeaderTemplate>
                                            <Items>
                                            </Items>
                                            <ItemTemplate>

<table id="Autresbuttons">
                                        <tr>
                                        <td class="style1">
                                <font Color="black"><%#Container.Item.Text %></font>
                                <br />
                                        </td>
                                        <td class="style2">
                              <a id="EditAutres" runat="server" href="#">
                            <asp:Image ID="ModiferAutres" runat="server" Height="25px"
                                ImageUrl="~/images/Modif.png" ToolTip="Edit Responsable" Width="30px" />
</a>
                             <asp:Panel ID="DivEditWindowAutres" height="247px" 
                                runat="server" Width="308px" >
                          <iframe scrolling="no" id="IframeEditAutres" src="Zone.aspx?Page=Update&Mode=editresponsable&IDResponsable=<%#Container.Item.Value%>" height="240" frameborder="0"></iframe>
                          
                          </asp:Panel>

                          <ajaxToolkit:HoverMenuExtender ID="HoverMenuExtender3" 
                                runat="server" DynamicServicePath="" Enabled="true"
                                TargetControlID="ModiferAutres" PopupControlID="DivEditWindowAutres" HoverDelay="3000" 
                                PopupPosition="Left">
                            </ajaxToolkit:HoverMenuExtender>

                            <a ID="DeleteAutres" runat="server" href="#">
                            <asp:Image ID="DeleteUAutres" runat="server" Height="25px" 
                                ImageUrl="~/images/close-button.png" ToolTip="Delete Responsable" Width="30px" />

                            </a>
                           <asp:Panel ID="DivEditWindowAutresDelete" height="247px" 
                                runat="server" Width="308px" >
                          <iframe scrolling="no" id="IframeEditAutresDelete" src="Zone.aspx?Page=Update&Mode=deleteresponsable&IDResponsable=<%#Container.Item.Value%>" height="240" frameborder="0"></iframe>
                          </asp:Panel>

                            <ajaxToolkit:HoverMenuExtender ID="Panel3_HoverMenuExtender" runat="server" HoverDelay="3000" 
                                DynamicServicePath="" Enabled="True" TargetControlID="DeleteUAutres" PopupControlID="DivEditWindowAutresDelete" PopupPosition="Left">
                            </ajaxToolkit:HoverMenuExtender>
                                        </td>
                                        </tr>
                                        </table>

                                            </ItemTemplate>
                                            <ItemStyle CssText="border-bottom: solid 1px #dedede; padding-left: 2px; padding-right:2px; padding-top:4px; padding-bottom: 3px; background-color:white;" />
                                            <DisabledItemStyle CssText="border-bottom: solid 1px #dedede; color: #c0c0c0; padding: 2px; padding-left:2px; padding-top:4px;padding-right:2px;padding-bottom:4px;" />
                                            <SelectedItemStyle CssText="background-color:#ccff99;color:white;padding-bottom:4px;padding-left:2px;padding-right:2px;padding-top:4px;" />
                                            <ItemHoverStyle CssText="border-bottom: solid 1px #dedede; padding-left: 2px; padding-right:2px; padding-top:4px; padding-bottom: 3px; background-color:#f3f7fc;" />
                                            <MoreItemsMessageStyle CssText="padding:2px;" />
                                        </eo:ListBox>
                                        <asp:SqlDataSource ID="AutreResponsable" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
                                            
         
         SelectCommand="SELECT DISTINCT Responsables.ID, Responsables.Nom + ' ' + Responsables.Prenom AS Detaille FROM Responsables CROSS JOIN Agences WHERE (Responsables.Niveau = 3) AND (Responsables.Role = 2) AND (Responsables.ID NOT IN (SELECT Responsable FROM Agences AS Agences_1))">
                                        </asp:SqlDataSource>
 </td>
 </tr>
                            </table>                                                                
                                    </div>
                                    
                                </DropDownTemplate>
                                <IconAreaStyle CssText="font-family: tahoma; font-size: 11px; background-image:url(00107007); background-position: left left; background-repeat:no-repeat; vertical-align:middle;padding-left:2px; padding-right:2px;" />
                                <HintTextStyle CssText="font-style:italic;background-color:#c0c0c0;color:white;line-height:15px;" />
                                <TextAreaStyle CssText="font-family: tahoma; font-size: 11px; border-top: solid 1px #3d7bad; border-bottom: solid 1px #b7d9ed; vertical-align:middle;padding-left:2px; padding-right:2px;" />
                                <TextStyle CssText="font-family: tahoma; font-size: 11px;" />
                                <IconStyle CssText="width:16px;height:16px;" />
                                <ButtonAreaStyle CssText="background-image:url(00107005);" />
                                <ButtonAreaHoverStyle CssText="background-image:url(00107006);" />
                                <ButtonStyle CssText="width:17px;height:23px;" />

<IconAreaStyle CssText="font-family: tahoma; font-size: 11px; background-image:url(00107007); background-position: left left; background-repeat:no-repeat; vertical-align:middle;padding-left:2px; padding-right:2px;"></IconAreaStyle>

<HintTextStyle CssText="font-style:italic;background-color:#c0c0c0;color:white;line-height:15px;"></HintTextStyle>

<TextAreaStyle CssText="font-family: tahoma; font-size: 11px; border-top: solid 1px #3d7bad; border-bottom: solid 1px #b7d9ed; vertical-align:middle;padding-left:2px; padding-right:2px;"></TextAreaStyle>

<TextStyle CssText="font-family: tahoma; font-size: 11px;"></TextStyle>

<IconStyle CssText="width:16px;height:16px;"></IconStyle>

<ButtonAreaStyle CssText="background-image:url(00107005);"> </ButtonAreaStyle>

<ButtonAreaHoverStyle CssText="background-image:url(00107006);"></ButtonAreaHoverStyle>

<ButtonStyle CssText="width:17px;height:23px;"></ButtonStyle>
                            </eo:ComboBox>
                            </td><td>                                                               
<asp:Button ID="CancelResp" CssClass="button" runat="server" OnClick="CancelResp_Click" Text="Refrech"/>
                            </td></tr>
                            </table>


                            
                                                


                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="DetailAgence" Title="Détaille Agence">
                            <table ID="DetailleAgence" runat="server">
                                <tr id="Tr1" runat="server">
                                    <td id="Td1" runat="server">
                                        <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Emplacement"></asp:Label>
                                    </td>
                                    <td id="Td2" runat="server">
                                          <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="SubmitChange" ID="DropDownListAgenceZone" runat="server" 
                                            DataSourceID="AgenceZone" DataTextField="Zone" DataValueField="ID" 
                                            Height="22px" Width="161px">
                                            
                                        </asp:DropDownList>

                                                                                <a runat="server" id="New" href="#" onclick="TaskNew();">
                                        <asp:Image ID="Image2" runat="server" ToolTip="Add Zone" 
                                            ImageUrl="~/images/Add.png" Height="25px" Width="30px"/></a>
                                        <a runat="server" id="Edi" href="#" onclick="TaskEdit();">
                                        <asp:Image ID="Button1" runat="server" ToolTip="Edit Zone" 
                                            ImageUrl="~/images/Modif.png" Height="25px" Width="30px"/></a>
                                   <a runat="server" id="Dele" href="#" onclick="TaskDelete();">
                                        <asp:Image ID="Image3" runat="server" ToolTip="Delete Zone" 
                                            ImageUrl="~/images/close-button.png" Height="25px" Width="30px"/></a>
                                            <asp:SqlDataSource ID="AgenceZone" runat="server" 
                                              OnSelected="CheckSqlSelected" onselecting="CheckSqlSelecting"
                                            ConnectionString="<%$ ConnectionStrings:AgencesConnectionString %>" 
                                            SelectCommand="SELECT ID, ' Zone Du '+Libelle AS Zone FROM Zones">
                                        </asp:SqlDataSource> 
                                    </td>
                                </tr>
                                                                                               <tr id="Tr30" runat="server">
                                    <td id="Td53" runat="server">
                                        <asp:Label ID="Label9" runat="server" Font-Size="Small" Text="Code"></asp:Label>
                                    </td>
                                    <td id="Td54" runat="server">
                                        <asp:TextBox ID="TextBoxAgenceCode" runat="server" Width="301px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="TextBoxAgenceCode" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                                               <tr id="Tr28" runat="server">
                                    <td id="Td49" runat="server">
                                        <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="Nom"></asp:Label>
                                    </td>
                                    <td id="Td50" runat="server">
                                        <asp:TextBox ID="TextBoxAgenceNom" runat="server" Width="301px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TextBoxAgenceNom" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="Tr2" runat="server">
                                    <td id="Td3" runat="server">
                                        <asp:Label ID="Label67" runat="server" Font-Size="Small" Text="Adress IP"></asp:Label>
                                    </td>
                                    <td id="Td4" runat="server">
                                    <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="IP1_TextChanged" ID="TextBoxAgenceAdressIP1" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="IP1_TextChanged" ID="TextBoxAgenceAdressIP2" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="IP1_TextChanged" ID="TextBoxAgenceAdressIP3" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="IP1_TextChanged" ID="TextBoxAgenceAdressIP4" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="TextBoxAgenceAdressIP_TextChanged" ID="TextBoxAgenceAdressIP" 
                                            runat="server" Width="120px" Visible="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator Visible="true" ID="RF32" runat="server" 
                                            ControlToValidate="TextBoxAgenceAdressIP" 
                                            ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="Tr3" runat="server">
                                    <td id="Td5" runat="server">
                                        <asp:Label ID="Label27" runat="server" Font-Size="Small" Text="Adress"></asp:Label>
                                    </td>
                                    <td id="Td6" runat="server">
                                        <asp:TextBox ID="TextBoxAgenceAdress" runat="server" Width="301px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RF12" runat="server" 
                                            ControlToValidate="TextBoxAgenceAdress" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="Tr4" runat="server">
                                    <td id="Td7" runat="server">
                                        <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                    </td>
                                    <td id="Td8" runat="server" rowspan="3">
                                        <asp:TextBox ID="TextBoxAgenceDescription" runat="server" Font-Size="Small" 
                                            Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="Tr5" runat="server">
                                    <td id="Td9" runat="server">
                                    </td>
                                </tr>
                                <tr id="Tr6" runat="server">
                                    <td id="Td10" runat="server">
                                    </td>
                                </tr>
                            </table>
                            
                        </asp:WizardStep>

                        <asp:WizardStep runat="server" ID="DetaillEquipement" Title="Détaille Equipements">
                                                <table runat="server" id="DetailleEquipement">
                            <tr>
                                <td>
                                    <asp:Label ID="Label23" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td rowspan="3">
                                    <asp:TextBox ID="TextBoxEquipementDescription" runat="server" 
                                        Font-Size="Small" Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="Routeur" Title="Routeur">
                                                <table id="Table1" runat="server">
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Font-Size="Small" Text="Etat"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListRouteurEtat" runat="server" Width="122px" 
                                        Font-Size="Small">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                                                        <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" Text="Type"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxRouteurType" runat="server" Font-Size="Small" 
                                        Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                        runat="server" ControlToValidate="TextBoxRouteurType" ErrorMessage="(*)" 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Model"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxRouteurModel" runat="server" Font-Size="Small" 
                                        Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF0" 
                                        runat="server" ControlToValidate="TextBoxRouteurModel" ErrorMessage="(*)" 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" runat="server" Font-Size="Small" Text="Adress IP"></asp:Label>
                                </td>
                                <td>
                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="RIP1_TextChanged" ID="TextBoxRouteurIP1" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="RIP1_TextChanged" ID="TextBoxRouteurIP2" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="RIP1_TextChanged" ID="TextBoxRouteurIP3" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="RIP1_TextChanged" ID="TextBoxRouteurIP4" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="TextBoxRouteurIP_TextChanged" ID="TextBoxRouteurIP" 
                                            runat="server" Width="120px" Visible="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF1" 
                                        runat="server" ControlToValidate="TextBoxRouteurIP" ErrorMessage="(*)" 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" runat="server" Font-Size="Small" Text="Adress Mac"></asp:Label>
                                </td>
                                <td>
<asp:TextBox OnTextChanged="Rmac_TextChanged" ID="TextBoxRouteurMac1" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Rmac_TextChanged" ID="TextBoxRouteurMac2" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Rmac_TextChanged" ID="TextBoxRouteurMac3" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Rmac_TextChanged" ID="TextBoxRouteurMac4" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Rmac_TextChanged" ID="TextBoxRouteurMac5" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Rmac_TextChanged" ID="TextBoxRouteurMac6" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>
                                    <asp:TextBox OnTextChanged="TextBoxRouteurMac_TextChanged" 
                                        ID="TextBoxRouteurMac" Visible="false" runat="server" Width="122px" AutoPostBack="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF2" 
                                        runat="server" ControlToValidate="TextBoxRouteurMac" ErrorMessage="(*)" 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxRouteurDescription" runat="server" Font-Size="Small" 
                                        Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="Switcheur" Title="Switcher">
                                              <table id="Table2" runat="server">
                            <tr id="Tr11" runat="server">
                                <td id="Td19" runat="server">
                                    <asp:Label ID="Label14" runat="server" Font-Size="Small" Text="Etat"></asp:Label>
                                </td>
                                <td id="Td20" runat="server">
                                    <asp:DropDownList ID="DropDownListSwitcheurEtat" runat="server" Width="122px">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="Tr12" runat="server">
                                <td id="Td21" runat="server">
                                    <asp:Label ID="Label15" runat="server" Font-Size="Small" Text="Type"></asp:Label>
                                </td>
                                <td id="Td22" runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurType" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF20" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurType" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr id="Tr29" runat="server">
                                <td id="Td51" runat="server">
                                    <asp:Label ID="Label6" runat="server" Font-Size="Small" Text="Model"></asp:Label>
                                </td>
                                <td id="Td52" runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurModel" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurType" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr13" runat="server">
                                <td id="Td23" runat="server">
                                    <asp:Label ID="Label16" runat="server" Font-Size="Small" Text="Adress IP"></asp:Label>
                                </td>
                                <td id="Td242" runat="server">
                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="SIP1_TextChanged" ID="TextBoxSwitcheurIP1" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="SIP1_TextChanged" ID="TextBoxSwitcheurIP2" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="SIP1_TextChanged" ID="TextBoxSwitcheurIP3" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="SIP1_TextChanged" ID="TextBoxSwitcheurIP4" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="TextBoxSwitcheurIP_TextChanged" ID="TextBoxSwitcheurIP" 
                                            runat="server" Width="120px" Visible="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF4" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurIP" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr141" runat="server">
                                <td id="Td25" runat="server">
                                    <asp:Label ID="Label17" runat="server" Font-Size="Small" Text="Adress Mac"></asp:Label>
                                </td>
                                <td id="Td26" runat="server">
                                <asp:TextBox OnTextChanged="Smac_TextChanged" ID="TextBoxSwitcheurMac1" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Smac_TextChanged" ID="TextBoxSwitcheurMac2" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Smac_TextChanged" ID="TextBoxSwitcheurMac3" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Smac_TextChanged" ID="TextBoxSwitcheurMac4" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Smac_TextChanged" ID="TextBoxSwitcheurMac5" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>-
                                    <asp:TextBox OnTextChanged="Smac_TextChanged" ID="TextBoxSwitcheurMac6" runat="server" Width="15px" MaxLength="2" AutoPostBack="True"></asp:TextBox>
                                    <asp:TextBox OnTextChanged="TextBoxSwitcheurMac_TextChanged" 
                                        ID="TextBoxSwitcheurMac" Visible="false" runat="server" Width="122px" AutoPostBack="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF5" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurMac" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr15" runat="server">
                                <td id="Td273" runat="server">
                                    <asp:Label ID="Label8" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td id="Td282" runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="Modem" Title="Modem">
                                                <table id="Table3" runat="server">
                            <tr id="Tr16" runat="server">
                                <td id="Td29" runat="server">
                                    <asp:Label ID="Label48" runat="server" Font-Size="Small" Text="Etat"></asp:Label>
                                </td>
                                <td id="Td30" runat="server">
                                    <asp:DropDownList ID="DropDownListModemEtat" runat="server" Width="122px" 
                                                    Font-Size="Small">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="Tr17" runat="server">
                                <td id="Td31" runat="server">
                                    <asp:Label ID="Label49" runat="server" Font-Size="Small" Text="Type"></asp:Label>
                                </td>
                                <td id="Td32" runat="server">
                                    <asp:TextBox ID="TextBoxModemType" runat="server" Font-Size="Small" 
                                                    Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF24" runat="server" 
                                                    ControlToValidate="TextBoxModemType" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr18" runat="server">
                                <td id="Td33" runat="server">
                                    <asp:Label ID="Label50" runat="server" Font-Size="Small" Text="Model"></asp:Label>
                                </td>
                                <td id="Td24" runat="server">
                                    <asp:TextBox ID="TextBoxModemModel" runat="server" Font-Size="Small" 
                                                    Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF25" runat="server" 
                                                    ControlToValidate="TextBoxModemModel" ErrorMessage="(*)" 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr14" runat="server">
                                <td id="Td27" runat="server">
                                    <asp:Label ID="Label52" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td id="Td28" runat="server">
                                    <asp:TextBox ID="TextBoxModemDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="DetaillLiaison" Title="Détaille Liaisons">
                                                <table ID="DetailleEquipement0" runat="server">
                            <tr id="Tr152" runat="server">
                                <td id="Td291" runat="server">
                                    <asp:Label ID="Label54" runat="server" Text="Description"></asp:Label>
                                </td>
                                <td id="Td301" runat="server" rowspan="3">
                                    <asp:TextBox ID="TextBoxLiaisonDescription" runat="server" 
                                                    Font-Size="Small" Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="Tr161" runat="server">
                                <td id="Td311" runat="server">
                                </td>
                            </tr>
                            <tr id="Tr171" runat="server">
                                <td id="Td321" runat="server">
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="Adsl" Title="Adsl">
                                                <table ID="DetailleAgence0" runat="server">
                   <tr id="Tr31" runat="server">
                                <td id="Td34" runat="server">
                                    <asp:Label ID="Label59" runat="server" Font-Size="Small" Text="Etat Tunnel"></asp:Label>
                                </td>
                                <td id="Td55" runat="server">
                                    <asp:DropDownList ID="DropDownListAdslEtatTunnel" runat="server" Font-Size="Small" 
                                        Width="122px">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                                 <tr id="Tr32" runat="server">
                                <td id="Td56" runat="server">
                                    <asp:Label ID="Label18" runat="server" Font-Size="Small" Text="Etat Carte"></asp:Label>
                                </td>
                                <td id="Td57" runat="server">
                                    <asp:DropDownList ID="DropDownListAdslEtatCarte" runat="server" Font-Size="Small" 
                                        Width="122px">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="Tr19" runat="server">
                                <td id="Td35" runat="server">
                                    <asp:Label ID="Label60" runat="server" Font-Size="Small" 
                                                    Text="Adresse Tunnel"></asp:Label>
                                </td>
                                <td id="Td36" runat="server">
                                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ATIP1_TextChanged" ID="TextBoxAdslAdresseTunnel1" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ATIP1_TextChanged" ID="TextBoxAdslAdresseTunnel2" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ATIP1_TextChanged" ID="TextBoxAdslAdresseTunnel3" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ATIP1_TextChanged" ID="TextBoxAdslAdresseTunnel4" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="TextBoxAdslAdresseTunnel_TextChanged" ID="TextBoxAdslAdresseTunnel" 
                                            runat="server" Width="120px" Visible="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF29" runat="server" 
                                                    ControlToValidate="TextBoxAdslAdresseTunnel" ErrorMessage="(*)" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr id="Tr131" runat="server">
                                <td id="Td251" runat="server">
                                    <asp:Label ID="Label7" runat="server" Font-Size="Small" 
                                                    Text="Adresse Carte"></asp:Label>
                                </td>
                                <td id="Td261" runat="server">
                                                                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ACIP1_TextChanged" ID="TextBoxAdslAdresseCarte1" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ACIP1_TextChanged" ID="TextBoxAdslAdresseCarte2" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ACIP1_TextChanged" ID="TextBoxAdslAdresseCarte3" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="ACIP1_TextChanged" ID="TextBoxAdslAdresseCarte4" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="TextBoxAdslAdresseCarte_TextChanged" ID="TextBoxAdslAdresseCarte" 
                                            runat="server" Width="120px" Visible="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="TextBoxAdslAdresseCarte" ErrorMessage="(*)" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr20" runat="server">
                                <td id="Td37" runat="server">
                                    <asp:Label ID="Label35" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td id="Td38" runat="server" rowspan="3">
                                    <asp:TextBox ID="TextBoxAdslDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="Tr21" runat="server">
                                <td id="Td39" runat="server">
                                </td>
                            </tr>
                            <tr id="Tr22" runat="server">
                                <td id="Td40" runat="server">
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" ID="FrameRelay" Title="FrameRelay">
                                                <table ID="DetailleAgence1" runat="server">
                            <tr id="Tr23" runat="server">
                                <td id="Td41" runat="server">
                                    <asp:Label ID="Label64" runat="server" Font-Size="Small" Text="Etat"></asp:Label>
                                </td>
                                <td id="Td42" runat="server">
                                    <asp:DropDownList ID="DropDownListFrarelayEtat" runat="server" Width="122px" 
                                                    Font-Size="Small">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="Tr24" runat="server">
                                <td id="Td43" runat="server">
                                    <asp:Label ID="Label65" runat="server" Font-Size="Small" 
                                                    Text="Adresse IP"></asp:Label>
                                </td>
                                <td id="Td44" runat="server">
                                                                                                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="FIP1_TextChanged" ID="TextBoxFrameRelayAdresseIP1" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="FIP1_TextChanged" ID="TextBoxFrameRelayAdresseIP2" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="FIP1_TextChanged" ID="TextBoxFrameRelayAdresseIP3" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>-
                                                                                <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="FIP1_TextChanged" ID="TextBoxFrameRelayAdresseIP4" 
                                            runat="server" Width="25" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox AutoPostBack="true" 
                                            OnTextChanged="TextBoxFrameRelayAdresseIP_TextChanged" ID="TextBoxFrameRelayAdresseIP" 
                                            runat="server" Width="120px" Visible="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF31" runat="server" 
                                                    ControlToValidate="TextBoxFrameRelayAdresseIP" ErrorMessage="(*)" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="Tr25" runat="server">
                                <td id="Td45" runat="server">
                                    <asp:Label ID="Label66" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td id="Td46" runat="server" rowspan="3">
                                    <asp:TextBox ID="TextBoxFramerelayDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="Tr26" runat="server">
                                <td id="Td47" runat="server">
                                </td>
                            </tr>
                            <tr id="Tr27" runat="server">
                                <td id="Td48" runat="server">
                                </td>
                            </tr>
                        </table>
                        </asp:WizardStep>
                    </WizardSteps>
</asp:Wizard><asp:HiddenField ID="ResponsableA" runat="server" />
<asp:Button ID="ButtonEdit" runat="server" Text="Edit Zone" style="display:none;"/>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="ModalPopupBG"
    runat="server" CancelControlID="ButtonEditCancel" OkControlID="ButtonEditDone"
    TargetControlID="ButtonEdit" PopupControlID="DivEditWindow" BehaviorID="EditModalPopup" OnCancelScript="EditCancelScript();" OnOkScript="EditOkayScript();">
</ajaxToolkit:ModalPopupExtender>
<div id="DivEditWindow" style="display:none;" class="popupConfirmation">
     <div class="popup_Titlebar" id="PopupHeader">
        <div class="TitlebarLeft"></div>
        <div class="TitlebarRight" onclick="$get('ButtonEditCancel').click();"></div>
     </div>
          <iframe id="IframeEdit" frameborder="0" height="240" scrolling="no"></iframe>
     <div class="popup_Buttons">
        <asp:Button ID="ButtonEditDone" style="display:none;" Text="Done" runat="server" />
        <asp:Button ID="ButtonEditCancel" Text="Cancel" runat="server" />
     </div>
</div>
                </div>
    </form>
</body>
</html>
