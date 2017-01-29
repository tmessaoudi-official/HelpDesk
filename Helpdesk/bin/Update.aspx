<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Helpdesk.Update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="Stylesheet" href="Styles/main.css" />
<link rel="Stylesheet" href="Styles/BodyFrame.css" />
<link rel="Stylesheet" href="Styles/Update.css" />
    <style type="text/css">

            .AjoutWizard
            {
                position:absolute;
    top: 50px;
    left: 140px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="msgboxpanel" runat="server">
    </div>
    <div>

                        <asp:DropDownList ID="DropDownListAgenceID" runat="server" CssClass="Agence" 
            DataSourceID="SqlDataSource1" DataTextField="AD" DataValueField="Agence_ID" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DropDownListAgenceID_SelectedIndexChanged">
        </asp:DropDownList>

                        <br />

            <br />
            <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="8" CssClass="updateWizard"
            onfinishbuttonclick="Wizard1_FinishButtonClick" BackColor="White" 
            BorderColor="White" FinishCompleteButtonText="Ajouter L'agence">
                <NavigationStyle BackColor="White" />
                <SideBarButtonStyle BackColor="Black" ForeColor="Red" />
                <SideBarStyle BackColor="Black" ForeColor="White" />
                <StepStyle BackColor="White" />
                <WizardSteps>
                    <asp:WizardStep runat="server" title="Détaille d'Agence">
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label67" runat="server" Text="Détaille Agence"></asp:Label>
                        <table runat="server" id="DetailleAgence">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Emplacement" Font-Size="Small"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListAgenceEmplacement" runat="server" 
             DataSourceID="AgenceEmplcament" DataTextField="Emplacement_Libelle" 
             DataValueField="Emplacement_ID" Height="22px" Width="122px">
                                    </asp:DropDownList>
                                    <asp:EntityDataSource ID="AgenceEmplcament" runat="server" 
                    ConnectionString="name=AgenceEntities" DefaultContainerName="AgenceEntities" 
                    EnableFlattening="False" EntitySetName="Emplacement" 
                    EntityTypeFilter="Emplacement" 
                    Select="it.[Emplacement_ID], it.[Emplacement_Libelle]">
                                    </asp:EntityDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Zone" Font-Size="Small" ID="Label37"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAgenceZone" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF11" runat="server" 
                    ControlToValidate="TextBoxAgenceZone" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Adress" Font-Size="Small" ID="Label27"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAgenceAdress" runat="server" Width="301px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF12" runat="server" 
                    ControlToValidate="TextBoxAgenceAdress" ErrorMessage="(*)" 
                  ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Description" ID="Label2" Font-Size="Small"></asp:Label>
                                </td>
                                <td rowspan="3">
                                    <asp:TextBox ID="TextBoxAgenceDescription" runat="server" 
                    Height="63px" TextMode="MultiLine" Width="376px" Font-Size="Small"></asp:TextBox>
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
                    <asp:WizardStep ID="WizardStep1" runat="server" title="Responsable De l'agence">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label68" runat="server" Text="Responsable De l'agence"></asp:Label>
                        <table runat="server" id="Responsable">
                            <tr>
                                <td>
                                    <asp:Label ID="Label39" runat="server" Font-Size="Small" Text="Nom"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:TextBox ID="TextBoxResponsableNom" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF13" runat="server" 
                        ControlToValidate="TextBoxResponsableNom" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label40" runat="server" Font-Size="Small" Text="Prenom"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:TextBox ID="TextBoxResponsablePrenom" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF14" runat="server" 
                        ControlToValidate="TextBoxResponsablePrenom" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label41" runat="server" Font-Size="Small" Text="E-mail"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:TextBox ID="TextBoxResponsableEmail" runat="server" Width="194px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF15" runat="server" 
                        ControlToValidate="TextBoxResponsableEmail" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label42" runat="server" Font-Size="Small" Text="Téléphone"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:TextBox ID="TextBoxResponsableTelephone" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF16" runat="server" 
                        ControlToValidate="TextBoxResponsableTelephone" ErrorMessage="(*)" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" title="Détaille Equipements">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label69" runat="server" Text="Equipement"></asp:Label>
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
                    <asp:WizardStep ID="WizardStep3" runat="server" title="Routeur">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label70" runat="server" Text="Routeur"></asp:Label>
                        <br />
                        <table runat="server">
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Font-Size="Small" Text="Statut"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListRouteurStatut" runat="server" Width="122px" 
                                        Font-Size="Small">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Type"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxRouteurType" runat="server" Font-Size="Small" 
                                        Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF0" 
                                        runat="server" ControlToValidate="TextBoxRouteurType" ErrorMessage="(*)" 
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" runat="server" Font-Size="Small" Text="Adress IP"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxRouteurIP" runat="server" Width="122px"></asp:TextBox>
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
                                    <asp:TextBox ID="TextBoxRouteurMac" runat="server" Width="122px"></asp:TextBox>
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
                    <asp:WizardStep ID="WizardStep4" runat="server" 
                    title="Switcheur">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label71" runat="server" Text="Switcheur"></asp:Label>
                        <br />
                        <br />
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label14" runat="server" Font-Size="Small" Text="Statut"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:DropDownList ID="DropDownListSwitcheurStatut" runat="server" Width="122px">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label15" runat="server" Font-Size="Small" Text="Type"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurType" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF20" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurType" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label16" runat="server" Font-Size="Small" Text="Adress IP"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurIP" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF4" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurIP" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label17" runat="server" Font-Size="Small" Text="Adress Mac"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurMac" runat="server" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF5" runat="server" 
                                                    ControlToValidate="TextBoxSwitcheurMac" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label8" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxSwitcheurDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep5" runat="server" title="Modem">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label72" runat="server" Text="Modem"></asp:Label>
                        <br />
                        <br />
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label48" runat="server" Font-Size="Small" Text="Statut"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:DropDownList ID="DropDownListModemStatut" runat="server" Width="122px" 
                                                    Font-Size="Small">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label49" runat="server" Font-Size="Small" Text="Type"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxModemType" runat="server" Font-Size="Small" 
                                                    Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF24" runat="server" 
                                                    ControlToValidate="TextBoxModemType" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label50" runat="server" Font-Size="Small" Text="Adress IP"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxModemIP" runat="server" Font-Size="Small" 
                                                    Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF25" runat="server" 
                                                    ControlToValidate="TextBoxModemIP" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label51" runat="server" Font-Size="Small" Text="Adress Mac"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxModemMac" runat="server" Font-Size="Small" 
                                                    Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF26" runat="server" 
                                                    ControlToValidate="TextBoxModemMac" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label52" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxModemDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep6" runat="server" title="Détaille Liaisons">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label73" runat="server" Text="Liaison"></asp:Label>
                        <table ID="DetailleEquipement0" runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label54" runat="server" Text="Description"></asp:Label>
                                </td>
                                <td runat="server" rowspan="3">
                                    <asp:TextBox ID="TextBoxLiaisonDescription" runat="server" 
                                                    Font-Size="Small" Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep7" runat="server" title="Adsl">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label74" runat="server" Text="Adsl"></asp:Label>
                        <table ID="DetailleAgence0" runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label59" runat="server" Font-Size="Small" Text="Statut"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:DropDownList ID="DropDownListAdslStatut" runat="server" Font-Size="Small" Width="122px">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label60" runat="server" Font-Size="Small" 
                                                    Text="Identificateur de Ligne"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxAdslIdentificateur" runat="server" Font-Size="Small" 
                                                    Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF29" runat="server" 
                                                    ControlToValidate="TextBoxAdslIdentificateur" ErrorMessage="(*)" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label35" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td runat="server" rowspan="3">
                                    <asp:TextBox ID="TextBoxAdslDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep8" runat="server" title="FrameRelay">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label75" runat="server" Text="Framerelay"></asp:Label>
                        <table ID="DetailleAgence1" runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label64" runat="server" Font-Size="Small" Text="Statut"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:DropDownList ID="DropDownListFrarelayStatut" runat="server" Width="122px" 
                                                    Font-Size="Small">
                                        <asp:ListItem Value="Fonctionnel">Fonctionnel</asp:ListItem>
                                        <asp:ListItem Value="En Panne">En Panne</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label65" runat="server" Font-Size="Small" 
                                                    Text="Identificateur de Ligne"></asp:Label>
                                </td>
                                <td runat="server">
                                    <asp:TextBox ID="TextBoxFrameRelayIdentificateur" runat="server" 
                                                    Font-Size="Small" Width="122px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RF31" runat="server" 
                                                    ControlToValidate="TextBoxFrameRelayIdentificateur" ErrorMessage="(*)" 
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:Label ID="Label66" runat="server" Font-Size="Small" Text="Description"></asp:Label>
                                </td>
                                <td runat="server" rowspan="3">
                                    <asp:TextBox ID="TextBoxFramerelayDescription" runat="server" Font-Size="Small" 
                                                    Height="63px" TextMode="MultiLine" Width="376px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                </td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" title="Ajouter L'agence">
                        <asp:Label runat="server" ID="Ajout" Text="Clicker de terminer pour ajouter l'agence"></asp:Label>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Agences.mdf;Integrated Security=True;User Instance=True" 
            ProviderName="System.Data.SqlClient" 
            
            SelectCommand="SELECT Emplacement.Emplacement_Libelle + ', ' + Agences.Agence_Zone + ', ' + Agences.Adress AS AD, Agences.Agence_ID 
FROM Agences INNER JOIN Emplacement ON Agences.Agence_Emplacement = Emplacement.Emplacement_ID">
        </asp:SqlDataSource>
         <br />
     
    </div>
    </form>
</body>
</html>
