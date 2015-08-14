<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>厂商信息管理</title>
</head>

<body>
<%ManufacturersinfoTo to = (ManufacturersinfoTo)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>厂商信息详细资料</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">单位名称</td>
      <td><%=to.getMF_Name()%></td>
    </tr>
    <tr>
      <td>联系电话</td>
      <td><%=to.getMF_Tel()%></td>
    </tr>
    <tr>
      <td>邮编</td>
      <td><%=to.getMF_Post()%></td>     
    </tr>
    <tr>
      <td>联系地址</td>
      <td><%=to.getMF_Add()%></td>
    </tr>
<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html> 