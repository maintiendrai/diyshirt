<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>����Ա����</title>
</head>
<body>
<%
AdministratorinfoTo Admin = (AdministratorinfoTo)session.getAttribute("Admin");
%>
<form id="form" name="form" method="post" action="FrontController.do?operation=adminquery&method=edit">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>���˹���</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">����ԱID</td>
      <td><%=Admin.getAdminID() %></td>
    </tr>
    <tr>
      <td width="130">����Ա�ʻ�</td>
      <td><%=Admin.getAdminAccount() %></td>
    </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" �޸����� " class="button"/>
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
