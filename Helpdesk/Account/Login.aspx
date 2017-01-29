<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Helpdesk.Login" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="500000">
<title>Untitled Document</title>
<link href="../Styles/stylelog.css" rel="stylesheet" type="text/css" />
<link rel="Stylesheet" href="../Styles/main.css" />
</head>

<body>
<div id="msgboxpanel" runat="server"></div>
<form class="LoginForm" id="frmlogin" runat="server">

<div id="layer01_holder">
  <div id="left01"></div>
  <div id="center01"></div>
  <div id="right01"></div>
</div>

<div id="layer02_holder">
  <div id="left02"></div>
  <div id="center02"></div>
  <div id="right02"></div>
</div>

<div id="layer03_holder">
  <div id="left03"></div>
  <div id="center03">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td>
  Login : 
  </td>
  </tr>
      <tr>
      <td>
      <asp:Label runat="server" ID="usernamelevel" CssClass="labels" Text="Username"></asp:Label>
      </td>
      <td>
      <asp:TextBox runat="server" ID="username" TextMode="SingleLine" CssClass="inputs" ></asp:TextBox><asp:requiredfieldvalidator id="rvUserValidator" runat="server" controltovalidate="username" errormessage="You must supply a Username!" display="None"></asp:requiredfieldvalidator>
      </td>
      </tr>
      <tr>
      <td>
      <asp:Label runat="server" ID="passwordlabel" CssClass="labels" Text="Password"></asp:Label>
      </td>
      <td>
      <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="inputs2"  ></asp:TextBox><asp:requiredfieldvalidator id="rvPasswordValidator" runat="server" controltovalidate="password" errormessage="Empty Passwords not accepted" display="None"></asp:requiredfieldvalidator>
      </td>
      </tr>
      <tr>
      <td>
          &nbsp;</td>
      <td>
      <asp:Button runat="server" OnClick="submit_Click" ID="button" Text=" Connexion " />
      </td> 
</tr>
</table>
<table id="messageDisplay">
<tr>
<td>
<asp:validationsummary id="Validationsummary1" Font-Size="Small" ForeColor="Chartreuse" runat="server" width="472px" displaymode="List"></asp:validationsummary>
</td>
</tr>
</table>
</div>
<div id="right03"></div>
</div>

<div id="layer04_holder">
  <div id="left04"></div>
  <div id="center04">
  If you forgot your password, please contact administrator or <asp:HyperLink NavigateUrl="forgot.aspx" runat="server" ID="forgot" Text="Click Here"></asp:HyperLink>
</div>
  <div id="right04"></div>
</div>

<div id="layer05_holder">
  <div align="left">Copyright © 2012, Messaoudi takieddine et Hassan hatem</div>
</div>
</form>
</body>
</html>