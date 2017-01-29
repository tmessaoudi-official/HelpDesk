<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="Helpdesk.forgot" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forgot Password</title>
<link href="../Styles/stylelog.css" rel="stylesheet" type="text/css" />
<link rel="Stylesheet" href="../Styles/main.css" />
</head>

<body>
<form class="LoginForm" id="frmlogin" runat="server">
<div id="msgboxpanel" runat="server"></div>

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
      <asp:Label runat="server" ID="Maillabel" CssClass="labels" Text="Password"></asp:Label>
      </td>
      <td>
      <asp:TextBox runat="server" ID="mail" CssClass="inputs2"  ></asp:TextBox><asp:requiredfieldvalidator id="rvPasswordValidator" runat="server" controltovalidate="mail" errormessage="Enter your email" display="None"></asp:requiredfieldvalidator>
      </td>
      </tr>
      <tr>
      <td></td>
      <td>
      <asp:Button runat="server" OnClick="submit_Click" ID="button" Text=" Send password " />
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
  Go back to <asp:HyperLink NavigateUrl="login.aspx" runat="server" ID="login" Text="Login"></asp:HyperLink> page </div>
  <div id="right04"></div>
</div>

<div id="layer05_holder">
  <div align="left">Copyright © 2012, Messaoudi takieddine et Hassan hatem</div>
</div>
</form>
</body>
</html>