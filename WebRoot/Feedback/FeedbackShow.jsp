<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>���ֹ���</title>
</head>

<body>
<%FeedbackTo to = (FeedbackTo)request.getAttribute("to");%>
<form id="form" name="form" method="post">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>���ֲ鿴</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="80">��Ա�ʺ�</td>
      <td><%=to.getUserID()%></td>
    </tr>
    <tr>
      <td>����</td>
      <td><%=to.getFeedback()%></td>
    </tr>
    
    <tr>
      <td>���ö�</td>
      <td><%=to.getIntegral()%></td>
    </tr>
    
    <tr>
	<td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" ���� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
