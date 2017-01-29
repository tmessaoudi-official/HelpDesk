<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="Helpdesk.userinfo" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link rel="Stylesheet" href="Styles/main.css" />
    <script type="text/javascript" src="JavaScript/overlayUser.js"></script>
    </head>
<body>
 <div id="msgboxpanel" runat="server"></div>
    <form id="form1" runat="server">
    <div>
        <div style="position:absolute; top: 11px; left: 306px; width: 26px; height: 0px;">
        <a href="#" onclick="javascript:cachetout1();"><img src="images/close-button.png" 
                style="height: 19px; width: 23px" /></a></div>
        <asp:GridView GridLines="Both" CellPadding="0" ForeColor="Green" 
            PagerStyle-BackColor="Green" PagerStyle-ForeColor="White" BackColor="Beige" HeaderStyle-BackColor="Black" 
            HeaderStyle-BorderColor="Green" HeaderStyle-BorderStyle="Inset" 
            HeaderStyle-BorderWidth="3" HeaderStyle-ForeColor="Red" AllowPaging="true" 
            PageSize="2" OnPageIndexChanging="Me_IndexChanged" runat="server" ID="Me" 
            Height="77px" Width="320px">
            <FooterStyle BackColor="Green" ForeColor="White" />
<HeaderStyle BackColor="Green" BorderColor="Green" BorderWidth="3px" BorderStyle="Inset" ForeColor="White"></HeaderStyle>
        </asp:GridView>
        <br />

        <br /></div>
    </form>
</body>
</html>
