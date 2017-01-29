<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Helpdesk.EditUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="../Styles/main.css" />
    <style type="text/css">
body{
font-family:"Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif;
font-size:12px;
}
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}
/* ----------- stylized ----------- */
.stylized{
border:solid 2px #b7ddf2;
background:#ebf4fb;
            height: 294px;
            margin:0 auto;
width:263px;
padding:14px;
        }
.stylized h1 {
font-size:14px;
font-weight:bold;
margin-bottom:8px;
}
.stylized p{
font-size:11px;
color:#666666;
margin-bottom:20px;
border-bottom:solid 1px #b7ddf2;
padding-bottom:10px;
}
.label{
display:block;
font-weight:bold;
text-align:right;
width:70px;
float:left;
}
.stylized .small{
color:#666666;
display:block;
font-size:11px;
float:left;
font-weight:normal;
text-align:right;
width:100px;
}
.stylized1{
border:solid 2px #b7ddf2;
background:#ebf4fb;
            height: 294px;
            margin:0 auto;
width:263px;
padding:14px;
        }
.stylized1 h1 {
font-size:14px;
font-weight:bold;
margin-bottom:8px;
}
.stylized1 p{
font-size:11px;
color:#666666;
margin-bottom:20px;
border-bottom:solid 1px #b7ddf2;
padding-bottom:10px;
}
.stylized1 .small{
color:#666666;
display:block;
font-size:11px;
float:left;
font-weight:normal;
text-align:right;
width:100px;
}
.input{
float:left;
font-size:12px;
padding:3px 2px;
border:solid 1px #aacfe4;
margin:2px 0 0px 10px;
width:130PX;
        }
.button{
clear:both;
margin-left:150px;
width:125px;
height:31px;
background:#666666 url(img/button.png) no-repeat;
text-align:center;
line-height:31px;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
}
    </style>
</head>
<body style="width: 295px; height: 327px;">
<div id="msgboxpanel" runat="server"></div>  
    <form id="form1" runat="server">
                <asp:Button CssClass="button" ID="Ajouter" runat="server" Text="Ajouter un ingénieur" 
                    onclick="Ajouter_Click"/>
            <asp:Button CssClass="button" ID="Editer" runat="server" Text="Editer" 
                    onclick="Editer_Click"/>
                                <asp:Button CssClass="button" ID="EditMeU" Visible="false" runat="server" 
                    Text="Editer" onclick="EditMeU_Click"/>
    
    <div style="width: 310px; height: 463px">
        <asp:Panel runat="server" ID="Register" class="stylized" Visible="false">
            <h1>
                <asp:Label runat="server" ID="TitleR" Text="Ajouter un ingénieur"></asp:Label></h1>
            <p>
                <asp:Label runat="server" ID="hintR" Text="Type User details"></asp:Label></p>
            <asp:Label CssClass="label" ID="LabelNomR" runat="server" Text="Nom : "></asp:Label>
            <asp:TextBox CssClass="input" ID="TextBoxNomR" runat="server"></asp:TextBox>
            <asp:Label CssClass="label" ID="LabelPrenomR" runat="server" Text="Prenom : "></asp:Label>
            <asp:TextBox CssClass="input" ID="TextBoxPrenomR" runat="server"></asp:TextBox>
            <asp:Label CssClass="label" ID="LabelUsernameR" runat="server" Text="Username : "></asp:Label>
            <asp:TextBox CssClass="input" ID="TextBoxUsernameR" runat="server"></asp:TextBox>
            <asp:Label CssClass="label" ID="LabelPasswordR" runat="server" Text="Password : "></asp:Label>
            <asp:TextBox CssClass="input" TextMode="Password" ID="TextBoxPasswordR" runat="server"></asp:TextBox>
            <asp:Label CssClass="label" ID="LabelEmailR" runat="server" Text="">Email : <asp:RegularExpressionValidator  CssClass="small"
        id="RegularExpressionValidator2"
        ControlToValidate="TextBoxEmailR"
        Text="(Invalid email)"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        Runat="server" ForeColor="Red" /></asp:Label><asp:TextBox CssClass="input" ID="TextBoxEmailR" runat="server"></asp:TextBox><asp:Button CssClass="button" ID="ActionR" runat="server" Text="Ajouter" 
                onclick="ActionR_Click"/>
            <div class="spacer">
            </div>
            </asp:Panel>

                    <asp:Panel runat="server" ID="Edit" class="stylized1" 
            Visible="false" Height="336px">
            <h1>
                <asp:Label runat="server" ID="TitleU" Text=" Editer les ingénieurs"></asp:Label></h1><p>
                <asp:Label runat="server" ID="hintU" Text="Type User details"></asp:Label></p><asp:Button ToolTip="Modifier Détaille Administrateur" CssClass="button" ID="EditMe" runat="server" Text="Modifier mes détailles" 
                            onclick="EditMe_Click"/>
                 <asp:Button CssClass="button" ID="Lister" runat="server" Text="Lister les ingénieurs" 
                            onclick="Lister_Click" />
                
                <asp:Panel ID="Up1" runat="server" Visible="false">
                    <asp:HiddenField ID="IDU" runat="server" />
            <asp:Label CssClass="label" ID="LabelNomU" runat="server" Text="Nom : "></asp:Label><asp:TextBox CssClass="input" ID="TextBoxNomU" runat="server"></asp:TextBox><asp:Label CssClass="label" ID="LabelPrenomU" runat="server" Text="Prenom : "></asp:Label><asp:TextBox CssClass="input" ID="TextBoxPrenomU" runat="server"></asp:TextBox><asp:Label CssClass="label" ID="LabelUsernameU" runat="server" Text="Username : "></asp:Label><asp:TextBox CssClass="input" ID="TextBoxUsernameU" runat="server"></asp:TextBox><asp:Label CssClass="label" ID="LabelPasswordU" runat="server" Text="Password : "></asp:Label><asp:TextBox CssClass="input" ID="TextBoxPasswordU" TextMode="Password" runat="server"></asp:TextBox><asp:Label CssClass="label" ID="LabelEmailU" runat="server" Text="">Email : <asp:RegularExpressionValidator CssClass="small"
        id="RegularExpressionValidator1"
        ControlToValidate="TextBoxEmailU"
        Text="(Invalid email)"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        Runat="server" ForeColor="Red" /></asp:Label><asp:TextBox CssClass="input" ID="TextBoxEmailU" runat="server"></asp:TextBox><asp:Button CssClass="button" ID="ActionUM" runat="server" Text="Enregistrer" 
                        onclick="ActionU_Click"/>
                                    <asp:Button CssClass="button" ID="ActionUO" runat="server" 
                        Text="Enregistrer" onclick="ActionUO_Click"/>
            <div class="spacer">
            </div>
            </asp:Panel>

            <asp:Panel ID="List1" runat="server" Visible="false">
                        <asp:Panel ID="Li1" runat="server" Visible="false">
            <br />
                            <asp:GridView EmptyDataText="Aucun utilisateurs" ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" PageSize="4"
            OnPageIndexChanging="GridView1_IndexChanging" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#CCCCCC" />

                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Nom" HeaderText="Nom" 
                                        SortExpression="Nom" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" 
                                        SortExpression="Username" />
                                                     <asp:TemplateField>
             <ItemTemplate>
             <asp:LinkButton runat="server" CommandArgument=<%#Eval("ID")%> ID="Link" onclick="Link_Click"><asp:Image ImageUrl="~/images/Modif.png" runat="server" ID="Modifier" ToolTip="Modifier" Height="18px" Width="22px"></asp:Image></asp:LinkButton></ItemTemplate></asp:TemplateField><asp:TemplateField>
             <ItemTemplate>
             <asp:LinkButton runat="server" CommandArgument=<%#Eval("ID")%> ID="LinkD" onclick="Link1_Click"><asp:Image ImageUrl="~/images/close-button.png" runat="server" ID="Supprime" ToolTip="Supprime" Height="18px" Width="22px"></asp:Image></asp:LinkButton></ItemTemplate></asp:TemplateField></Columns><FooterStyle BackColor="#CCCCCC" />
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
                                
                                
                                
                                SelectCommand="SELECT ID, Nom + ' ' + Prenom AS Nom, Username FROM Responsables WHERE (Niveau = 2) AND (Role = 1)">
                            </asp:SqlDataSource>
            
            </asp:Panel>
            </asp:Panel>
            </asp:Panel>
                        <asp:Panel ID="ModifUser" runat="server" CssClass="stylized" Visible="false">
            <asp:Label CssClass="label" ID="Label1" runat="server" Text="Nom : "></asp:Label><asp:TextBox CssClass="input" ID="NomU" runat="server"></asp:TextBox><asp:Label CssClass="label" ID="Label2" runat="server" Text="Prenom : "></asp:Label><asp:TextBox CssClass="input" ID="PrenomU" runat="server"></asp:TextBox><asp:Label CssClass="label" ID="Label5" runat="server" Text="">Email : <asp:RegularExpressionValidator  CssClass="small"
        id="regEmail"
        ControlToValidate="EmailU"
        Text="(Invalid email)"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        Runat="server" ForeColor="Red" /> </asp:Label><asp:TextBox CssClass="input" ID="EmailU" runat="server"></asp:TextBox><asp:Button CssClass="button" ID="EditU" runat="server" Text="Enregistrer" 
                    onclick="EditU_Click"/>
            <div class="spacer">
            </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
